%%-*- mode: erlang -*-
%%-*- coding: utf-8 -*-

% Manual testing.
[{tests, []}].

%%
%% Tests from the Solidity documentation
%%

% ================================================================================
% document : Common Patterns
% case     : Restricting Access
"
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
                    // Do not forget the "_"! It will
                    // be replaced by the actual function
                    // body when the modifier is invoked.
                    _
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
                    _
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
                // This is dangerous, because if the function
                // uses `return` explicitly, this will not be
                // done! This behavior will be fixed in Version 0.4.0.
                modifier costs(uint _amount) {
                    if (msg.value < _amount)
                        throw;
                    _
                    if (msg.value > _amount)
                        msg.sender.send(msg.value - _amount);
                }

                function forceOwnerChange(address _newOwner)
                    costs(200 ether)
                {
                    owner = _newOwner;
                    // just some example condition
                    if (uint(owner) & 0 == 1)
                        // in this case, overpaid fees will not
                        // be refunded
                        return;
                    // otherwise, refund overpaid fees
                }
            }
        
".
% ================================================================================
% document : Common Patterns
% case     : State Machine
"
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
                    _
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
                    _
                }

                // Order of the modifiers matters here!
                function bid()
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
                // If you use `return` in the function,
                // `nextStage` will not be called
                // automatically.
                modifier transitionNext()
                {
                    _
                    nextStage();
                }

                function g()
                    timedTransitions
                    atStage(Stages.AnotherStage)
                    transitionNext
                {
                    // If you want to use `return` here,
                    // you have to call `nextStage()` manually.
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
        
".
% ================================================================================
% document : Common Patterns
% case     : Withdrawal from Contracts 1
"
            contract WithdrawalContract {
                address public richest;
                uint public mostSent;

                mapping (address => uint) pendingWithdrawals;

                function WithdrawalContract() {
                    richest = msg.sender;
                    mostSent = msg.value;
                }

                function becomeRichest() returns (bool) {
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
        
".
% ================================================================================
% document : Common Patterns
% case     : Withdrawal from Contracts 2
"
            contract SendContract {
                address public richest;
                uint public mostSent;

                function SendContract() {
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
        
".
