%%-*- mode: erlang -*-
%%-*- coding: utf-8 -*-

% Manual testing.
[{tests, []}].

%%
%% Tests for rule: referenceExamples
%%

"
        // =====================================================================
        // from file:       abi-spec.rst
        //      chapter:    Examples
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Foo {
            function bar(bytes3[2] xy) {}
            function baz(uint32 x, bool y) returns (bool r) { r = x > 32 || y; }
            function sam(bytes name, bool z, uint[] data) {}
        }
    ".
"
        // =====================================================================
        // from file:       abi-spec.rst
        //      chapter:    JSON
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Test {
            function Test(){ b = 0x12345678901234567890123456789012; }
            event Event1(uint indexed a, bytes32 b);
            event Event2(uint indexed a, bytes32 b);
            function foo(uint a) { Event1(a, b); }
            bytes32 b;
        }
    ".
"
        // =====================================================================
        // from file:       abi-spec.rst
        //      chapter:    Handling tuple types
        // ---------------------------------------------------------------------


        contract Test {
            struct S { uint a; uint[] b; T[] c; }
            struct T { uint x; uint y; }
            function f(S s, T t, uint a) { }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Example
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        library GetCode {
            function at(address _addr) returns (bytes o_code) {
                assembly {
                    // retrieve the size of the code, this needs assembly
                    let size := extcodesize(_addr)
                    // allocate output byte array - this could also be done without assembly
                    // by using o_code = new bytes(size)
                    o_code := mload(0x40)
                    // new \"memory end\" including padding
                    mstore(0x40, add(o_code, and(add(add(size, 0x20), 0x1f), not(0x1f))))
                    // store length in memory
                    mstore(o_code, size)
                    // actually retrieve the code, this needs assembly
                    extcodecopy(_addr, add(o_code, 0x20), 0, size)
                }
            }
        }


        pragma solidity ^0.4.12;

        library VectorSum {
            // This function is less efficient because the optimizer currently fails to
            // remove the bounds checks in array access.
            function sumSolidity(uint[] _data) returns (uint o_sum) {
                for (uint i = 0; i < _data.length; ++i)
                    o_sum += _data[i];
            }

            // We know that we only access the array in bounds, so we can avoid the check.
            // 0x20 needs to be added to an array because the first slot contains the
            // array length.
            function sumAsm(uint[] _data) returns (uint o_sum) {
                for (uint i = 0; i < _data.length; ++i) {
                    assembly {
                        o_sum := add(o_sum, mload(add(add(_data, 0x20), mul(i, 0x20))))
                    }
                }
            }

            // Same as above, but accomplish the entire code within inline assembly.
            function sumPureAsm(uint[] _data) returns (uint o_sum) {
                assembly {
                   // Load the length (first 32 bytes)
                   let len := mload(_data)

                   // Skip over the length field.
                   //
                   // Keep temporary variable so it can be incremented in place.
                   //
                   // NOTE: incrementing _data would result in an unusable
                   //       _data variable after this assembly block
                   let data := add(_data, 0x20)

                   // Iterate until the bound is not met.
                   for
                       { let end := add(data, len) }
                       lt(data, end)
                       { data := add(data, 0x20) }
                   {
                       o_sum := add(o_sum, mload(data))
                   }
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Literals
        // ---------------------------------------------------------------------


        contract my_contract {
            function my_function () {
                assembly { 2 3 add \"abc\" and }
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Functional Style
        // ---------------------------------------------------------------------


        contract my_contract {
            function my_function () {
                assembly {
                     3 0x80 mload add 0x80 mstore

                     mstore(0x80, add(mload(0x80), 3))
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Access to External Variables and Functions
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        contract C {
            uint b;
            function f(uint x) returns (uint r) {
                assembly {
                    r := mul(x, sload(b_slot)) // ignore the offset, we know it is zero
                }

                % Labels -------------------------------------------------------
                assembly {
                        let n := calldataload(4)
                        let a := 1
                        let b := a
                    loop:
                        jumpi(loopend, eq(n, 0))
                        a add swap1
                        n := sub(n, 1)
                        jump(loop)
                    loopend:
                        mstore(0, a)
                        return(0, 0x20)
                }

                assembly {
                    let x := 8
                    jump(two)
                    one:
                        // Here the stack height is 2 (because we pushed x and 7),
                        // but the assembler thinks it is 1 because it reads
                        // from top to bottom.
                        // Accessing the stack variable x here will lead to errors.
                        x := 9
                        jump(three)
                    two:
                        7 // push something onto the stack
                        jump(one)
                    three:
                }

                assembly {
                    let x := 8
                    jump(two)
                    0 // This code is unreachable but will adjust the stack height correctly
                    one:
                        x := 9 // Now x can be accessed properly.
                        jump(three)
                        pop // Similar negative correction.
                    two:
                        7 // push something onto the stack
                        jump(one)
                    three:
                    pop // We have to pop the manually pushed value here again.
                }

            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Declaring Assembly-Local Variables
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            function f(uint x) returns (uint b) {
                assembly {
                    let v := add(x, 1)
                    mstore(0x80, v)
                    {
                        let y := add(sload(v), 1)
                        b := y
                    } // y is \"deallocated\" here
                    b := add(b, v)
                } // v is \"deallocated\" here
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Assignments
        // ---------------------------------------------------------------------


        contract my_contract {
            function my_function () {
                assembly {
                    let v := 0 // functional-style assignment as part of variable declaration
                    let g := add(v, 2)
                    sload(10)
                    =: v // instruction style assignment, puts the result of sload(10) into v
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Switch
        // ---------------------------------------------------------------------


        contract my_contract {
            function my_function () {
                assembly {
                    let x := 0
                    switch calldataload(4)
                    case 0 {
                        x := calldataload(0x24)
                    }
                    default {
                        x := calldataload(0x44)
                    }
                    sstore(0, div(x, 2))
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Loops
        // ---------------------------------------------------------------------


        contract my_contract {
            function my_function () {
                assembly {
                    let x := 0
                    for { let i := 0 } lt(i, 0x100) { i := add(i, 0x20) } {
                        x := add(x, mload(i))
                    }
                }

                assembly {
                    let x := 0
                    let i := 0
                    for { } lt(i, 0x100) { } {     // while(i < 0x100)
                        x := add(x, mload(i))
                        i := add(i, 0x20)
                    }
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Inline Assembly
        //      subchapter: Functions
        // ---------------------------------------------------------------------


        contract my_contract {
            function my_function () {
                assembly {
                    let v := 0 // functional-style assignment as part of variable declaration
                    let g := add(v, 2)
                    sload(10)
                    =: v // instruction style assignment, puts the result of sload(10) into v
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       assembly.rst
        //      chapter:    Standalone Assembly
        // ---------------------------------------------------------------------


        contract my_contract {
            function my_function () {
                assembly {
                    let v := 0 // functional-style assignment as part of variable declaration
                    let g := add(v, 2)
                    sload(10)
                    =: v // instruction style assignment, puts the result of sload(10) into v
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    creating Contracts
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract OwnedToken {
            // TokenCreator is a contract type that is defined below.
            // It is fine to reference it as long as it is not used
            // to create a new contract.
            TokenCreator creator;
            address owner;
            bytes32 name;

            // This is the constructor which registers the
            // creator and the assigned name.
            function OwnedToken(bytes32 _name) {
                // State variables are accessed via their name
                // and not via e.g. this.owner. This also applies
                // to functions and especially in the constructors,
                // you can only call them like that (\"internally\"),
                // because the contract itself does not exist yet.
                owner = msg.sender;
                // We do an explicit type conversion from `address`
                // to `TokenCreator` and assume that the type of
                // the calling contract is TokenCreator, there is
                // no real way to check that.
                creator = TokenCreator(msg.sender);
                name = _name;
            }

            function changeName(bytes32 newName) {
                // Only the creator can alter the name --
                // the comparison is possible since contracts
                // are implicitly convertible to addresses.
                if (msg.sender == address(creator))
                    name = newName;
            }

            function transfer(address newOwner) {
                // Only the current owner can transfer the token.
                if (msg.sender != owner) return;
                // We also want to ask the creator if the transfer
                // is fine. Note that this calls a function of the
                // contract defined below. If the call fails (e.g.
                // due to out-of-gas), the execution here stops
                // immediately.
                if (creator.isTokenTransferOK(owner, newOwner))
                    owner = newOwner;
            }
        }

        contract TokenCreator {
            function createToken(bytes32 name)
               returns (OwnedToken tokenAddress)
            {
                // Create a new Token contract and return its address.
                // From the JavaScript side, the return type is simply
                // \"address\", as this is the closest type available in
                // the ABI.
                return new OwnedToken(name);
            }

            function changeName(OwnedToken tokenAddress, bytes32 name) {
                // Again, the external type of \"tokenAddress\" is
                // simply \"address\".
                tokenAddress.changeName(name);
            }

            function isTokenTransferOK(
                address currentOwner,
                address newOwner
            ) returns (bool ok) {
                // Check some arbitrary condition.
                address tokenAddress = msg.sender;
                return (keccak256(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Visibility and Getters
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            function f(uint a) private returns (uint b) { return a + 1; }
            function setData(uint a) internal { data = a; }
            uint public data;
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Visibility and Getters
        //      subchapter: Getter Functions
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            uint public data = 42;
        }


        contract Caller {
            C c = new C();
            function f() {
                uint local = c.data();
            }
        }


        pragma solidity ^0.4.0;

        contract C {
            uint public data;
            function x() {
                data = 3; // internal access
                uint val = this.data(); // external access
            }
        }


        pragma solidity ^0.4.0;

        contract Complex {
           struct Data {
               uint a;
               bytes3 b;
               mapping (uint => uint) map;
           }
           mapping (uint => mapping(bool => Data[])) public data;
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Function Modifiers
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        contract owned {
            function owned() { owner = msg.sender; }
            address owner;

            // This contract only defines a modifier but does not use
            // it - it will be used in derived contracts.
            // The function body is inserted where the special symbol
            // \"_;\" in the definition of a modifier appears.
            // This means that if the owner calls this function, the
            // function is executed and otherwise, an exception is
            // thrown.
            modifier onlyOwner {
                require(msg.sender == owner);
                _;
            }
        }


        contract mortal is owned {
            // This contract inherits the \"onlyOwner\"-modifier from
            // \"owned\" and applies it to the \"close\"-function, which
            // causes that calls to \"close\" only have an effect if
            // they are made by the stored owner.
            function close() onlyOwner {
                selfdestruct(owner);
            }
        }


        contract priced {
            // Modifiers can receive arguments:
            modifier costs(uint price) {
                if (msg.value >= price) {
                    _;
                }
            }
        }


        contract Register is priced, owned {
            mapping (address => bool) registeredAddresses;
            uint price;

            function Register(uint initialPrice) { price = initialPrice; }

            // It is important to also provide the
            // \"payable\" keyword here, otherwise the function will
            // automatically reject all Ether sent to it.
            function register() payable costs(price) {
                registeredAddresses[msg.sender] = true;
            }

            function changePrice(uint _price) onlyOwner {
                price = _price;
            }
        }

        contract Mutex {
            bool locked;
            modifier noReentrancy() {
                require(!locked);
                locked = true;
                _;
                locked = false;
            }

            /// This function is protected by a mutex, which means that
            /// reentrant calls from within msg.sender.call cannot call f again.
            /// The `return 7` statement assigns 7 to the return value but still
            /// executes the statement `locked = false` in the modifier.
            function f() noReentrancy returns (uint) {
                require(msg.sender.call());
                return 7;
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Constant State Variables
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            uint constant x = 32**22 + 8;
            string constant text = \"abc\";
            bytes32 constant myHash = keccak256(\"abc\");
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    View Functions
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.16;

        contract C {
            function f(uint a, uint b) view returns (uint) {
                return a * (b + 42) + now;
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Pure Functions
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.16;

        contract C {
            function f(uint a, uint b) pure returns (uint) {
                return a * (b + 42);
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Fallback Function
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Test {
            // This function is called for all messages sent to
            // this contract (there is no other function).
            // Sending Ether to this contract will cause an exception,
            // because the fallback function does not have the \"payable\"
            // modifier.
            function() { x = 1; }
            uint x;
        }


        // This contract keeps all Ether sent to it with no way
        // to get it back.
        contract Sink {
            function() payable { }
        }


        contract Caller {
            function callTest(Test test) {
                test.call(0xabcdef01); // hash does not exist
                // results in test.x becoming == 1.

                // The following will not compile, but even
                // if someone sends ether to that contract,
                // the transaction will fail and reject the
                // Ether.
                //test.send(2 ether);
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Events
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract ClientReceipt {
            event Deposit(
                address indexed _from,
                bytes32 indexed _id,
                uint _value
            );

            function deposit(bytes32 _id) payable {
                // Any call to this function (even deeply nested) can
                // be detected from the JavaScript API by filtering
                // for `Deposit` to be called.
                Deposit(msg.sender, _id, msg.value);
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Inheritance
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract owned {
            function owned() { owner = msg.sender; }
            address owner;
        }


        // Use \"is\" to derive from another contract. Derived
        // contracts can access all non-private members including
        // internal functions and state variables. These cannot be
        // accessed externally via `this`, though.
        contract mortal is owned {
            function kill() {
                if (msg.sender == owner) selfdestruct(owner);
            }
        }


        // These abstract contracts are only provided to make the
        // interface known to the compiler. Note the function
        // without body. If a contract does not implement all
        // functions it can only be used as an interface.
        contract Config {
            function lookup(uint id) returns (address adr);
        }


        contract NameReg {
            function register(bytes32 name);
            function unregister();
         }


        // Multiple inheritance is possible. Note that \"owned\" is
        // also a base class of \"mortal\", yet there is only a single
        // instance of \"owned\" (as for virtual inheritance in C++).
        contract named is owned, mortal {
            function named(bytes32 name) {
                Config config = Config(0xd5f9d8d94886e70b06e474c3fb14fd43e2f23970);
                NameReg(config.lookup(1)).register(name);
            }

            // Functions can be overridden by another function with the same name and
            // the same number/types of inputs.  If the overriding function has different
            // types of output parameters, that causes an error.
            // Both local and message-based function calls take these overrides
            // into account.
            function kill() {
                if (msg.sender == owner) {
                    Config config = Config(0xd5f9d8d94886e70b06e474c3fb14fd43e2f23970);
                    NameReg(config.lookup(1)).unregister();
                    // It is still possible to call a specific
                    // overridden function.
                    mortal.kill();
                }
            }
        }


        // If a constructor takes an argument, it needs to be
        // provided in the header (or modifier-invocation-style at
        // the constructor of the derived contract (see below)).
        contract PriceFeed is owned, mortal, named(\"GoldFeed\") {
           function updateInfo(uint newInfo) {
              if (msg.sender == owner) info = newInfo;
           }

           function get() constant returns(uint r) { return info; }

           uint info;
        }


        pragma solidity ^0.4.0;

        contract owned {
            function owned() { owner = msg.sender; }
            address owner;
        }

        contract mortal is owned {
            function kill() {
                if (msg.sender == owner) selfdestruct(owner);
            }
        }

        contract Base1 is mortal {
            function kill() { /* do cleanup 1 */ mortal.kill(); }
        }


        contract Base2 is mortal {
            function kill() { /* do cleanup 2 */ mortal.kill(); }
        }


        contract Final is Base1, Base2 {
        }


        pragma solidity ^0.4.0;

        contract owned {
            function owned() { owner = msg.sender; }
            address owner;
        }

        contract mortal is owned {
            function kill() {
                if (msg.sender == owner) selfdestruct(owner);
            }
        }


        contract Base1 is mortal {
            function kill() { /* do cleanup 1 */ super.kill(); }
        }


        contract Base2 is mortal {
            function kill() { /* do cleanup 2 */ super.kill(); }
        }


        contract Final is Base2, Base1 {
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Inheritance
        //      subchapter: Arguments for Base Constructors
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Base {
            uint x;
            function Base(uint _x) { x = _x; }
        }


        contract Derived is Base(7) {
            function Derived(uint _y) Base(_y * _y) {
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Abstract Contracts
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Feline {
            function utterance() returns (bytes32);
        }

        contract Cat is Feline {
            function utterance() returns (bytes32) { return \"miaow\"; }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Interfaces
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        interface Token {
           function transfer(address recipient, uint amount);
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Libraries
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        library Set {
          // We define a new struct datatype that will be used to
          // hold its data in the calling contract.
          struct Data { mapping(uint => bool) flags; }

          // Note that the first parameter is of type \"storage
          // reference\" and thus only its storage address and not
          // its contents is passed as part of the call.  This is a
          // special feature of library functions.  It is idiomatic
          // to call the first parameter 'self', if the function can
          // be seen as a method of that object.
          function insert(Data storage self, uint value)
              returns (bool)
          {
              if (self.flags[value])
                  return false; // already there
              self.flags[value] = true;
              return true;
          }

          function remove(Data storage self, uint value)
              returns (bool)
          {
              if (!self.flags[value])
                  return false; // not there
              self.flags[value] = false;
              return true;
          }

          function contains(Data storage self, uint value)
              returns (bool)
          {
              return self.flags[value];
          }
        }


        contract C {
            Set.Data knownValues;

            function register(uint value) {
                // The library functions can be called without a
                // specific instance of the library, since the
                // \"instance\" will be the current contract.
                require(Set.insert(knownValues, value));
            }
            // In this contract, we can also directly access knownValues.flags, if we want.
        }


        pragma solidity ^0.4.0;

        library BigInt {
            struct bigint {
                uint[] limbs;
            }

            function fromUint(uint x) internal returns (bigint r) {
                r.limbs = new uint[](1);
                r.limbs[0] = x;
            }

            function add(bigint _a, bigint _b) internal returns (bigint r) {
                r.limbs = new uint[](max(_a.limbs.length, _b.limbs.length));
                uint carry = 0;
                for (uint i = 0; i < r.limbs.length; ++i) {
                    uint a = limb(_a, i);
                    uint b = limb(_b, i);
                    r.limbs[i] = a + b + carry;
                    if (a + b < a || (a + b == uint(-1) && carry > 0))
                        carry = 1;
                    else
                        carry = 0;
                }
                if (carry > 0) {
                    // too bad, we have to add a limb
                    uint[] memory newLimbs = new uint[](r.limbs.length + 1);
                    for (i = 0; i < r.limbs.length; ++i)
                        newLimbs[i] = r.limbs[i];
                    newLimbs[i] = carry;
                    r.limbs = newLimbs;
                }
            }

            function limb(bigint _a, uint _limb) internal returns (uint) {
                return _limb < _a.limbs.length ? _a.limbs[_limb] : 0;
            }

            function max(uint a, uint b) private returns (uint) {
                return a > b ? a : b;
            }
        }


        contract C {
            using BigInt for BigInt.bigint;

            function f() {
                var x = BigInt.fromUint(7);
                var y = BigInt.fromUint(uint(-1));
                var z = x.add(y);
            }
        }
    ".
"
        // =====================================================================
        // from file:       contracts.rst
        //      chapter:    Using For
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        // This is the same code as before, just without comments
        library Set {
          struct Data { mapping(uint => bool) flags; }

          function insert(Data storage self, uint value)
              returns (bool)
          {
              if (self.flags[value])
                return false; // already there
              self.flags[value] = true;
              return true;
          }

          function remove(Data storage self, uint value)
              returns (bool)
          {
              if (!self.flags[value])
                  return false; // not there
              self.flags[value] = false;
              return true;
          }

          function contains(Data storage self, uint value)
              returns (bool)
          {
              return self.flags[value];
          }
        }


        contract C {
            using Set for Set.Data; // this is the crucial change
            Set.Data knownValues;

            function register(uint value) {
                // Here, all variables of type Set.Data have
                // corresponding member functions.
                // The following function call is identical to
                // Set.insert(knownValues, value)
                require(knownValues.insert(value));
            }
        }


        pragma solidity ^0.4.0;

        library Search {
            function indexOf(uint[] storage self, uint value) returns (uint) {
                for (uint i = 0; i < self.length; i++)
                    if (self[i] == value) return i;
                return uint(-1);
            }
        }


        contract C {
            using Search for uint[];
            uint[] data;

            function append(uint value) {
                data.push(value);
            }

            function replace(uint _old, uint _new) {
                // This performs the library function call
                uint index = data.indexOf(_old);
                if (index == uint(-1))
                    data.push(_new);
                else
                    data[index] = _new;
            }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Input Parameters and Output Parameters
        //      subchapter: Input Parameters
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Simple {
            function taker(uint _a, uint _b) {
                // do something with _a and _b.
            }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Input Parameters and Output Parameters
        //      subchapter: Output Parameters
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Simple {
            function arithmetics(uint _a, uint _b) returns (uint o_sum, uint o_product) {
                o_sum = _a + _b;
                o_product = _a * _b;
            }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Function Calls
        //      subchapter: Internal Function Calls
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            function g(uint a) returns (uint ret) { return f(); }
            function f() returns (uint ret) { return g(7) + f(); }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Function Calls
        //      subchapter: External Function Calls
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract InfoFeed {
            function info() payable returns (uint ret) { return 42; }
        }

        contract Consumer {
            InfoFeed feed;
            function setFeed(address addr) { feed = InfoFeed(addr); }
            function callFeed() { feed.info.value(10).gas(800)(); }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Function Calls
        //      subchapter: Named Calls and Anonymous Function Parameters
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            function f(uint key, uint value) {
                // ...
            }

            function g() {
                // named arguments
                f({value: 2, key: 3});
            }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Function Calls
        //      subchapter: Omitted Function Parameter Names
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            // omitted name for parameter
            function func(uint k, uint) returns(uint) {
                return k;
            }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Function Calls
        //      subchapter: Creating Contracts via ``new``
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract D {
            uint x;
            function D(uint a) payable {
                x = a;
            }
        }

        contract C {
            D d = new D(4); // will be executed as part of C's constructor

            function createD(uint arg) {
                D newD = new D(arg);
            }

            function createAndEndowD(uint arg, uint amount) payable {
                // Send ether along with the creation
                D newD = (new D).value(amount)(arg);
            }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Assignment
        //      subchapter: Destructuring Assignments and Returning Multiple Values
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            uint[] data;

            function f() returns (uint, bool, uint) {
                return (7, true, 2);
            }

            function g() {
                // Declares and assigns the variables. Specifying the type explicitly is not possible.
                var (x, b, y) = f();
                // Assigns to a pre-existing variable.
                (x, y) = (2, 7);
                // Common trick to swap values -- does not work for non-value storage types.
                (x, y) = (y, x);
                // Components can be left out (also for variable declarations).
                // If the tuple ends in an empty component,
                // the rest of the values are discarded.
                (data.length,) = f(); // Sets the length to 7
                // The same can be done on the left side.
                (,data[3]) = f(); // Sets data[3] to 2
                // Components can only be left out at the left-hand-side of assignments, with
                // one exception:
                (x,) = (1,);
                // (1,) is the only way to specify a 1-component tuple, because (1) is
                // equivalent to 1.
            }
        }
    ".
"
        // =====================================================================
        // from file:       control-structure.rst
        //      chapter:    Assignment
        //      subchapter: Error handling: Assert, Require, Revert and Exceptions
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Sharer {
            function sendHalf(address addr) payable returns (uint balance) {
                require(msg.value % 2 == 0); // Only allow even numbers
                uint balanceBeforeTransfer = this.balance;
                addr.transfer(msg.value / 2);
                // Since transfer throws an exception on failure and
                // cannot call back here, there should be no way for us to
                // still have half of the money.
                assert(this.balance == balanceBeforeTransfer - msg.value / 2);
                return this.balance;
            }
        }
    ".
"
        // =====================================================================
        // from file:       frequently-asked-questions.rst
        //      chapter:    What are some examples of basic string manipulation (``substring``, ``indexOf``, ``charAt``, etc)?
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            string s;

            function append(byte c) {
                bytes(s).push(c);
            }

            function set(uint i, byte c) {
                bytes(s)[i] = c;
            }
        }
    ".
"
        // =====================================================================
        // from file:       frequently-asked-questions.rst
        //      chapter:    When returning a value of say ``uint`` type, is it possible to return an ``undefined`` or 'null'-like value?
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            uint[] counters;

            function getCounter(uint index)
                returns (uint counter, bool error) {
                    if (index >= counters.length)
                        return (0, true);
                    else
                        return (counters[index], false);
            }

            function checkCounter(uint index) {
                var (counter, error) = getCounter(index);
                if (error) {
                    // ...
                } else {
                    // ...
                }
            }
        }
    ".
"
        // =====================================================================
        // from file:       frequently-asked-questions.rst
        //      chapter:    What is the ``memory`` keyword? What does it do?
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            uint[] data1;
            uint[] data2;

            function appendOne() {
                append(data1);
            }

            function appendTwo() {
                append(data2);
            }

            function append(uint[] storage d) internal {
                d.push(1);
            }
        }


        pragma solidity ^0.4.0;

        contract C {
            uint someVariable;
            uint[] data;

            function f() {
                uint[] x = data;
                x.push(2);
            }
        }
    ".
"
        // =====================================================================
        // from file:       frequently-asked-questions.rst
        //      chapter:    How do I initialize a contract with only a specific amount of wei?
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract B {
            function B() payable {}
        }

        contract A {
            address child;

            function test() {
                child = (new B).value(10)(); //construct a new B with 10 wei
            }
        }
    ".
"
        // =====================================================================
        // from file:       frequently-asked-questions.rst
        //      chapter:    Can a contract pass an array (static size) or string or ``bytes`` (dynamic size) to another contract?
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            uint[20] x;

            function f() {
                g(x);
                h(x);
            }

            function g(uint[20] y) internal {
                y[2] = 3;
            }

            function h(uint[20] storage y) internal {
                y[3] = 4;
            }
        }
    ".
"
        // =====================================================================
        // from file:       introduction-to-smart-contracts.rst
        //      chapter:    A Simple Smart Contract
        //      subchapter: Storage
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract SimpleStorage {
            uint storedData;

            function set(uint x) {
                storedData = x;
            }

            function get() constant returns (uint) {
                return storedData;
            }
        }
    ".
"
        // =====================================================================
        // from file:       introduction-to-smart-contracts.rst
        //      chapter:    A Simple Smart Contract
        //      subchapter: Subcurrency Example
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Coin {
            // The keyword \"public\" makes those variables
            // readable from outside.
            address public minter;
            mapping (address => uint) public balances;

            // Events allow light clients to react on
            // changes efficiently.
            event Sent(address from_address, address to_address, uint amount);

            // This is the constructor whose code is
            // run only when the contract is created.
            function Coin() {
                minter = msg.sender;
            }

            function mint(address receiver, uint amount) {
                if (msg.sender != minter) return;
                balances[receiver] += amount;
            }

            function send(address receiver, uint amount) {
                if (balances[msg.sender] < amount) return;
                balances[msg.sender] -= amount;
                balances[receiver] += amount;
                Sent(msg.sender, receiver, amount);
            }
        }
    ".
"
        // =====================================================================
        // from file:       layout-of-source-files.rst
        //      chapter:    Comments
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        /** @title Shape calculator. */
        contract shapeCalculator {
            /** @dev Calculates a rectangle's surface and perimeter.
              * @param w Width of the rectangle.
              * @param h Height of the rectangle.
              * @return s The calculated surface.
              * @return p The calculated perimeter.
              */
            function rectangle(uint w, uint h) returns (uint s, uint p) {
                s = w * h;
                p = 2 * (w + h);
            }
        }
    ".
"
        // =====================================================================
        // from file:       miscellaneous.rst
        //      chapter:    Layout of State Variables in Storage
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
          struct s { uint a; uint b; }
          uint x;
          mapping(uint => mapping(uint => s)) data;
        }
    ".
"
        // =====================================================================
        // from file:       security-considerations.rst
        //      chapter:    Re-Entrancy
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        // THIS CONTRACT CONTAINS A BUG - DO NOT USE
        contract Fund {
          /// Mapping of ether shares of the contract.
          mapping(address => uint) shares;
          /// Withdraw your share.
          function withdraw() {
              if (msg.sender.send(shares[msg.sender]))
                  shares[msg.sender] = 0;
          }
        }

        pragma solidity ^0.4.11;

        contract Fund {
          /// Mapping of ether shares of the contract.
          mapping(address => uint) shares;
          /// Withdraw your share.
          function withdraw() {
              var share = shares[msg.sender];
              shares[msg.sender] = 0;
              msg.sender.transfer(share);
          }
        }
    ".
"
        // =====================================================================
        // from file:       security-considerations.rst
        //      chapter:    tx.origin
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        // THIS CONTRACT CONTAINS A BUG - DO NOT USE
        contract TxUserWallet {
            address owner;

            function TxUserWallet() {
                owner = msg.sender;
            }

            function transferTo(address dest, uint amount) {
                require(tx.origin == owner);
                dest.transfer(amount);
            }
        }


        pragma solidity ^0.4.11;

        interface TxUserWallet {
            function transferTo(address dest, uint amount);
        }

        contract TxAttackWallet {
            address owner;

            function TxAttackWallet() {
                owner = msg.sender;
            }

            function() {
                TxUserWallet(msg.sender).transferTo(owner, msg.sender.balance);
            }
        }
    ".
"
        // =====================================================================
        // from file:       structure-of-a-contract.rst
        //      chapter:    State Variables
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract SimpleStorage {
          uint storedData; // State variable
          // ...
        }
    ".
"
        // =====================================================================
        // from file:       structure-of-a-contract.rst
        //      chapter:    Functions
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract SimpleAuction {
          function bid() payable { // Function
              // ...
          }
        }
    ".
"
        // =====================================================================
        // from file:       structure-of-a-contract.rst
        //      chapter:    Function Modifiers
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        contract Purchase {
          address public seller;

          modifier onlySeller() { // Modifier
              require(msg.sender == seller);
              _;
          }

          function abort() onlySeller { // Modifier usage
              // ...
          }
        }
    ".
"
        // =====================================================================
        // from file:       structure-of-a-contract.rst
        //      chapter:    Events
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract SimpleAuction {
          event HighestBidIncreased(address bidder, uint amount); // Event

          function bid() payable {
              // ...
              HighestBidIncreased(msg.sender, msg.value); // Triggering event
          }
        }
    ".
"
        // =====================================================================
        // from file:       structure-of-a-contract.rst
        //      chapter:    Structs Types
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Ballot {
          struct Voter { // Struct
              uint weight;
              bool voted;
              address delegate;
              uint vote;
          }
        }
    ".
"
        // =====================================================================
        // from file:       structure-of-a-contract.rst
        //      chapter:    Enum Types
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Purchase {
          enum State { Created, Locked, Inactive } // Enum
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Enums
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;
        
        contract test {
            enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
            ActionChoices choice;
            ActionChoices constant defaultChoice = ActionChoices.GoStraight;
        
            function setGoStraight() {
                choice = ActionChoices.GoStraight;
            }
        
            // Since enum types are not part of the ABI, the signature of \"getChoice\"
            // will automatically be changed to \"getChoice() returns (uint8)\"
            // for all matters external to Solidity. The integer type used is just
            // large enough to hold all enum values, i.e. if you have more values,
            // `uint16` will be used and so on.
            function getChoice() returns (ActionChoices) {
                return choice;
            }
        
            function getDefaultChoice() returns (uint) {
                return uint(defaultChoice);
            }
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Function Types
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract Selector {
          function f() returns (bytes4) {
            return this.f.selector;
          }
        }


        pragma solidity ^0.4.5;

        library ArrayUtils {
          // internal functions can be used in internal library functions because
          // they will be part of the same code context
          function map(uint[] memory self, function (uint) returns (uint) f)
            internal
            returns (uint[] memory r)
          {
            r = new uint[](self.length);
            for (uint i = 0; i < self.length; i++) {
              r[i] = f(self[i]);
            }
          }
          function reduce(
            uint[] memory self,
            function (uint, uint) returns (uint) f
          )
            internal
            returns (uint r)
          {
            r = self[0];
            for (uint i = 1; i < self.length; i++) {
              r = f(r, self[i]);
            }
          }
          function range(uint length) internal returns (uint[] memory r) {
            r = new uint[](length);
            for (uint i = 0; i < r.length; i++) {
              r[i] = i;
            }
          }
        }

        contract Pyramid {
          using ArrayUtils for *;
          function pyramid(uint l) returns (uint) {
            return ArrayUtils.range(l).map(square).reduce(sum);
          }
          function square(uint x) internal returns (uint) {
            return x * x;
          }
          function sum(uint x, uint y) internal returns (uint) {
            return x + y;
          }
        }


        pragma solidity ^0.4.11;

        contract Oracle {
          struct Request {
            bytes data;
            function(bytes memory) external callback;
          }
          Request[] requests;
          event NewRequest(uint);
          function query(bytes data, function(bytes memory) external callback) {
            requests.push(Request(data, callback));
            NewRequest(requests.length - 1);
          }
          function reply(uint requestID, bytes response) {
            // Here goes the check that the reply comes from a trusted source
            requests[requestID].callback(response);
          }
        }

        contract OracleUser {
          Oracle constant oracle = Oracle(0x1234567); // known contract
          function buySomething() {
            oracle.query(\"USD\", this.oracleResponse);
          }
          function oracleResponse(bytes response) {
            require(msg.sender == address(oracle));
            // Use the data
          }
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Data location
        // ---------------------------------------------------------------------


        contract C {
            uint[] x; // the data location of x is storage

            // the data location of memoryArray is memory
            function f(uint[] memoryArray) {
                x = memoryArray; // works, copies the whole array to storage
                var y = x; // works, assigns a pointer, data location of y is storage
                y[7]; // fine, returns the 8th element
                y.length = 2; // fine, modifies x through y
                delete x; // fine, clears the array, also modifies y
                // The following does not work; it would need to create a new temporary /
                // unnamed array in storage, but storage is \"statically\" allocated:
                // y = memoryArray;
                // This does not work either, since it would \"reset\" the pointer, but there
                // is no sensible location it could point to.
                // delete y;
                g(x); // calls g, handing over a reference to x
                h(x); // calls h and creates an independent, temporary copy in memory
            }

            function g(uint[] storage storageArray) internal {}
            function h(uint[] memoryArray) {}
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Allocating Memory Arrays
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            function f(uint len) {
                uint[] memory a = new uint[](7);
                bytes memory b = new bytes(len);
                // Here we have a.length == 7 and b.length == len
                a[6] = 8;
            }
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Array Literals / Inline Arrays
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract C {
            function f() {
                g([uint(1), 2, 3]);
            }
            function g(uint[3] _data) {
                // ...
            }
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Members
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract ArrayContract {
            uint[2**20] m_aLotOfIntegers;
            // Note that the following is not a pair of dynamic arrays but a
            // dynamic array of pairs (i.e. of fixed size arrays of length two).
            bool[2][] m_pairsOfFlags;
            // newPairs is stored in memory - the default for function arguments

            function setAllFlagPairs(bool[2][] newPairs) {
                // assignment to a storage array replaces the complete array
                m_pairsOfFlags = newPairs;
            }

            function setFlagPair(uint index, bool flagA, bool flagB) {
                // access to a non-existing index will throw an exception
                m_pairsOfFlags[index][0] = flagA;
                m_pairsOfFlags[index][1] = flagB;
            }

            function changeFlagArraySize(uint newSize) {
                // if the new size is smaller, removed array elements will be cleared
                m_pairsOfFlags.length = newSize;
            }

            function clear() {
                // these clear the arrays completely
                delete m_pairsOfFlags;
                delete m_aLotOfIntegers;
                // identical effect here
                m_pairsOfFlags.length = 0;
            }

            bytes m_byteData;

            function byteArrays(bytes data) {
                // byte arrays (\"bytes\") are different as they are stored without padding,
                // but can be treated identical to \"uint8[]\"
                m_byteData = data;
                m_byteData.length += 7;
                m_byteData[3] = 8;
                delete m_byteData[2];
            }

            function addFlag(bool[2] flag) returns (uint) {
                return m_pairsOfFlags.push(flag);
            }

            function createMemoryArray(uint size) returns (bytes) {
                // Dynamic memory arrays are created using `new`:
                uint[2][] memory arrayOfPairs = new uint[2][](size);
                // Create a dynamic byte array:
                bytes memory b = new bytes(200);
                for (uint i = 0; i < b.length; i++)
                    b[i] = byte(i);
                return b;
            }
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Structs
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.11;

        contract CrowdFunding {
            // Defines a new type with two fields.
            struct Funder {
                address addr;
                uint amount;
            }

            struct Campaign {
                address beneficiary;
                uint fundingGoal;
                uint numFunders;
                uint amount;
                mapping (uint => Funder) funders;
            }

            uint numCampaigns;
            mapping (uint => Campaign) campaigns;

            function newCampaign(address beneficiary, uint goal) returns (uint campaignID) {
                campaignID = numCampaigns++; // campaignID is return variable
                // Creates new struct and saves in storage. We leave out the mapping type.
                campaigns[campaignID] = Campaign(beneficiary, goal, 0, 0);
            }

            function contribute(uint campaignID) payable {
                Campaign storage c = campaigns[campaignID];
                // Creates a new temporary memory struct, initialised with the given values
                // and copies it over to storage.
                // Note that you can also use Funder(msg.sender, msg.value) to initialise.
                c.funders[c.numFunders++] = Funder({addr: msg.sender, amount: msg.value});
                c.amount += msg.value;
            }

            function checkGoalReached(uint campaignID) returns (bool reached) {
                Campaign storage c = campaigns[campaignID];
                if (c.amount < c.fundingGoal)
                    return false;
                uint amount = c.amount;
                c.amount = 0;
                c.beneficiary.transfer(amount);
                return true;
            }
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Mappings
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract MappingExample {
            mapping(address => uint) public balances;

            function update(uint newBalance) {
                balances[msg.sender] = newBalance;
            }
        }

        contract MappingUser {
            function f() returns (uint) {
                MappingExample m = new MappingExample();
                m.update(100);
                return m.balances(this);
            }
        }
    ".
"
        // =====================================================================
        // from file:       types.rst
        //      chapter:    Delete
        // ---------------------------------------------------------------------


        pragma solidity ^0.4.0;

        contract DeleteExample {
            uint data;
            uint[] dataArray;

            function f() {
                uint x = data;
                delete x; // sets x to 0, does not affect data
                delete data; // sets data to 0, does not affect x which still holds a copy
                uint[] y = dataArray;
                delete dataArray; // this sets dataArray.length to zero, but as uint[] is a complex object, also
                // y is affected which is an alias to the storage object
                // On the other hand: \"delete y\" is not valid, as assignments to local variables
                // referencing storage objects can only be made from existing storage objects.
            }
        }
    ".
