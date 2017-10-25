-define(BYTE,
    [
        "byte",
        "bytes",
        "bytes1",
        "bytes2",
        "bytes3",
        "bytes4",
        "bytes5",
        "bytes6",
        "bytes7",
        "bytes8",
        "bytes9",
        "bytes10",
        "bytes11",
        "bytes12",
        "bytes13",
        "bytes14",
        "bytes15",
        "bytes16",
        "bytes17",
        "bytes18",
        "bytes19",
        "bytes20",
        "bytes21",
        "bytes22",
        "bytes23",
        "bytes24",
        "bytes25",
        "bytes26",
        "bytes27",
        "bytes28",
        "bytes29",
        "bytes30",
        "bytes31",
        "bytes32"
    ]
).
-define(INT,
    [
        "int",
        "int8",
        "int16",
        "int24",
        "int32",
        "int40",
        "int48",
        "int56",
        "int64",
        "int72",
        "int80",
        "int88",
        "int96",
        "int104",
        "int112",
        "int120",
        "int128",
        "int136",
        "int144",
        "int152",
        "int160",
        "int168",
        "int176",
        "int184",
        "int192",
        "int200",
        "int208",
        "int216",
        "int224",
        "int232",
        "int240",
        "int248",
        "int256"
    ]
).
-define(TESTS_FROM_SOLIDITY_DOCS, [
    {"Common Patterns",
        "Restricting Access",
        "
            pragma solidity ^0.4.0;

            contract AccessRestriction {
                // These will be assigned at the construction
                // phase, where `msg.sender` is the account
                // creating this contract.
                address public owner = msg.sender;
                uint public creationTime = now;

                // Modifiers can be used to change
                // the body of a function.
                // If this modifier is used, it will
                // prepend a check that only passes
                // if the function is called from
                // a certain address.
                modifier onlyBy(address _account)
                {
                    if (msg.sender != _account)
                        throw;
                    // Do not forget the \\\"_;\\\"! It will
                    // be replaced by the actual function
                    // body when the modifier is used.
                    _;
                }

                /// Make `_newOwner` the new owner of this
                /// contract.
                function changeOwner(address _newOwner)
                    onlyBy(owner)
                {
                    owner = _newOwner;
                }

                modifier onlyAfter(uint _time) {
                    if (now < _time) throw;
                    _;
                }

                /// Erase ownership information.
                /// May only be called 6 weeks after
                /// the contract has been created.
                function disown()
                    onlyBy(owner)
                    onlyAfter(creationTime + 6 weeks)
                {
                    delete owner;
                }

                // This modifier requires a certain
                // fee being associated with a function call.
                // If the caller sent too much, he or she is
                // refunded, but only after the function body.
                // This was dangerous before Solidity version 0.4.0,
                // where it was possible to skip the part after `_;`.
                modifier costs(uint _amount) {
                    if (msg.value < _amount)
                        throw;
                    _;
                    if (msg.value > _amount)
                        msg.sender.send(msg.value - _amount);
                }

                function forceOwnerChange(address _newOwner)
                    costs(200 ether)
                {
                    owner = _newOwner;
                    // just some example condition
                    if (uint(owner) & 0 == 1)
                        // This did not refund for Solidity
                        // before version 0.4.0.
                        return;
                    // refund overpaid fees
                }
            }
        "
    },
    {"Common Patterns",
        "State Machine",
        "
            pragma solidity ^0.4.0;

            contract StateMachine {
                enum Stages {
                    AcceptingBlindedBids,
                    RevealBids,
                    AnotherStage,
                    AreWeDoneYet,
                    Finished
                }

                // This is the current stage.
                Stages public stage = Stages.AcceptingBlindedBids;

                uint public creationTime = now;

                modifier atStage(Stages _stage) {
                    if (stage != _stage) throw;
                    _;
                }

                function nextStage() internal {
                    stage = Stages(uint(stage) + 1);
                }

                // Perform timed transitions. Be sure to mention
                // this modifier first, otherwise the guards
                // will not take the new stage into account.
                modifier timedTransitions() {
                    if (stage == Stages.AcceptingBlindedBids &&
                                now >= creationTime + 10 days)
                        nextStage();
                    if (stage == Stages.RevealBids &&
                            now >= creationTime + 12 days)
                        nextStage();
                    // The other stages transition by transaction
                    _;
                }

                // Order of the modifiers matters here!
                function bid()
                    payable
                    timedTransitions
                    atStage(Stages.AcceptingBlindedBids)
                {
                    // We will not implement that here
                }

                function reveal()
                    timedTransitions
                    atStage(Stages.RevealBids)
                {
                }

                // This modifier goes to the next stage
                // after the function is done.
                modifier transitionNext()
                {
                    _;
                    nextStage();
                }

                function g()
                    timedTransitions
                    atStage(Stages.AnotherStage)
                    transitionNext
                {
                }

                function h()
                    timedTransitions
                    atStage(Stages.AreWeDoneYet)
                    transitionNext
                {
                }

                function i()
                    timedTransitions
                    atStage(Stages.Finished)
                {
                }
            }
        "
    },
    {"Common Patterns",
        "Withdrawal from Contracts 1",
        "
            pragma solidity ^0.4.0;

            contract WithdrawalContract {
                address public richest;
                uint public mostSent;

                mapping (address => uint) pendingWithdrawals;

                function WithdrawalContract() payable {
                    richest = msg.sender;
                    mostSent = msg.value;
                }

                function becomeRichest() payable returns (bool) {
                    if (msg.value > mostSent) {
                        pendingWithdrawals[richest] += msg.value;
                        richest = msg.sender;
                        mostSent = msg.value;
                        return true;
                    } else {
                        return false;
                    }
                }

                function withdraw() returns (bool) {
                    uint amount = pendingWithdrawals[msg.sender];
                    // Remember to zero the pending refund before
                    // sending to prevent re-entrancy attacks
                    pendingWithdrawals[msg.sender] = 0;
                    if (msg.sender.send(amount)) {
                        return true;
                    } else {
                        pendingWithdrawals[msg.sender] = amount;
                        return false;
                    }
                }
            }
        "
    },
    {"Common Patterns",
        "Withdrawal from Contracts 2",
        "
            pragma solidity ^0.4.0;

            contract SendContract {
                address public richest;
                uint public mostSent;

                function SendContract() payable {
                    richest = msg.sender;
                    mostSent = msg.value;
                }

                function becomeRichest() returns (bool) {
                    if (msg.value > mostSent) {
                        // Check if call succeeds to prevent an attacker
                        // from trapping the previous person's funds in
                        // this contract through a callstack attack
                        if (!richest.send(msg.value)) {
                            throw;
                        }
                        richest = msg.sender;
                        mostSent = msg.value;
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        "
    }
]).
-define(UINT,
    [
        "uint",
        "uint8",
        "uint16",
        "uint24",
        "uint32",
        "uint40",
        "uint48",
        "uint56",
        "uint64",
        "uint72",
        "uint80",
        "uint88",
        "uint96",
        "uint104",
        "uint112",
        "uint120",
        "uint128",
        "uint136",
        "uint144",
        "uint152",
        "uint160",
        "uint168",
        "uint176",
        "uint184",
        "uint192",
        "uint200",
        "uint208",
        "uint216",
        "uint224",
        "uint232",
        "uint240",
        "uint248",
        "uint256"
    ]
).
