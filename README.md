# syparse - the Solidity parser written in Erlang

[![Build Status](https://travis-ci.org/walter-weinmann/syparse.svg?branch=master)](https://travis-ci.org/walter-weinmann/syparse)

**syparse** is a production-ready [Solidity](https://github.com/ethereum/solidity) parser written in pure Erlang.  **syparse** is closely aligned to the Solidity project and in future will be adapted on a regular basis as the Solidity project evolves. Solidity is a high-level language whose syntax is similar to that of JavaScript and it is designed to compile to code for the Ethereum Virtual Machine. And, with the [grammar.txt file](https://github.com/ethereum/solidity/blob/develop/libsolidity/grammar.txt) the project provides the basis for the definition of the LALR grammar.

## 1. Usage

### Example code:

```
pragma solidity ^0.4.0;

contract C {
  struct s { uint a; uint b; }
  uint x;
  mapping(uint => mapping(uint => s)) data;
}
```

### Parsing the example code:

```erlang
1> {ok, {ParseTree, Tokens}} = syparse:source_to_pt("pragma solidity ^0.4.0;
                                                     
                                                     contract C {
                                                       struct s { uint a; uint b; }
                                                       uint x;
                                                       mapping(uint => mapping(uint => s)) data;
                                                     }").

{ok,{{sourceUnit,
         [{pragmaDirective,{identifier,"solidity"},"^0.4.0;"},
          {contractDefinition,"contract",
              {identifier,"C"},
              [],
              [{contractPart,
                   {structDefinition,
                       {identifier,"s"},
                       [{variableDeclaration,
                            {typeName,{elementaryTypeName,"uint"}},
                            [],
                            {identifier,"a"}},
                        {variableDeclaration,
                            {typeName,{elementaryTypeName,"uint"}},
                            [],
                            {identifier,"b"}}]}},
               {contractPart,
                   {stateVariableDeclaration,
                       {typeName,{elementaryTypeName,"uint"}},
                       [],
                       {identifier,"x"},
                       []}},
               {contractPart,
                   {stateVariableDeclaration,
                       {typeName,
                           {mapping,
                               {elementaryTypeName,"uint"},
                               {typeName,
                                   {mapping,{elementaryTypeName,...},{...}}}}},
                       [],
                       {identifier,"data"},
                       []}}]}]},
     [{'PRAGMA',1},
      {'IDENTIFIER',8,"solidity"},
      {'PRAGMA_DIRECTIVE',1,"^0.4.0;"},
      {'CONTRACT',3},
      {'IDENTIFIER',1,"C"},
      {'{',3},
      {'STRUCT',4},
      {'IDENTIFIER',1,"s"},
      {'{',4},
      {'UINT',4,"uint"},
      {'IDENTIFIER',1,"a"},
      {';',4},
      {'UINT',4,"uint"},
      {'IDENTIFIER',1,"b"},
      {';',4},
      {'}',4},
      {'UINT',5,"uint"},
      {'IDENTIFIER',1,"x"},
      {';',5},
      {'MAPPING',6},
      {'(',6},
      {'UINT',6,[...]},
      {'=>',6},
      {'MAPPING',...},
      {...}|...]}}
````

### Access the parse tree of the example code:

```erlang
2> ParseTree.

{sourceUnit,
    [{pragmaDirective,{identifier,"solidity"},"^0.4.0;"},
     {contractDefinition,"contract",
         {identifier,"C"},
         [],
         [{contractPart,
              {structDefinition,
                  {identifier,"s"},
                  [{variableDeclaration,
                       {typeName,{elementaryTypeName,"uint"}},
                       [],
                       {identifier,"a"}},
                   {variableDeclaration,
                       {typeName,{elementaryTypeName,"uint"}},
                       [],
                       {identifier,"b"}}]}},
          {contractPart,
              {stateVariableDeclaration,
                  {typeName,{elementaryTypeName,"uint"}},
                  [],
                  {identifier,"x"},
                  []}},
          {contractPart,
              {stateVariableDeclaration,
                  {typeName,
                      {mapping,
                          {elementaryTypeName,"uint"},
                          {typeName,
                              {mapping,
                                  {elementaryTypeName,"uint"},
                                  {typeName,{userDefinedTypeName,...}}}}}},
                  [],
                  {identifier,"data"},
                  []}}]}]}
```

### Access the token list of the example code:

```erlang
3> Tokens.

[{'PRAGMA',1},
 {'IDENTIFIER',8,"solidity"},
 {'PRAGMA_DIRECTIVE',1,"^0.4.0;"},
 {'CONTRACT',3},
 {'IDENTIFIER',1,"C"},
 {'{',3},
 {'STRUCT',4},
 {'IDENTIFIER',1,"s"},
 {'{',4},
 {'UINT',4,"uint"},
 {'IDENTIFIER',1,"a"},
 {';',4},
 {'UINT',4,"uint"},
 {'IDENTIFIER',1,"b"},
 {';',4},
 {'}',4},
 {'UINT',5,"uint"},
 {'IDENTIFIER',1,"x"},
 {';',5},
 {'MAPPING',6},
 {'(',6},
 {'UINT',6,"uint"},
 {'=>',6},
 {'MAPPING',6},
 {'(',6},
 {'UINT',6,[...]},
 {'=>',6},
 {'IDENTIFIER',...},
 {...}|...]
```

### Compile the code from a parse tree:

```erlang
4> syparse:pt_to_source_td(ParseTree).

<<"pragma solidity ^0.4.0; contract C{struct s{uint a;uint b;} uint x; mapping(uint=>mapping(uint=>s)) data;}">>
```

### Complete parse tree:

The output of the parse tree in the Erlang shell is shortened (cause not known). The complete parse tree of the example code looks as follows:

```erlang
{sourceUnit,
 [{pragmaDirective,{identifier,"solidity"},"^0.4.0;"},
  {contractDefinition,"contract",
   {identifier,"C"},
   [],
   [{contractPart,
     {structDefinition,
      {identifier,"s"},
      [{variableDeclaration,
        {typeName,{elementaryTypeName,"uint"}},
        [],
        {identifier,"a"}},
       {variableDeclaration,
        {typeName,{elementaryTypeName,"uint"}},
        [],
        {identifier,"b"}}]}},
    {contractPart,
     {stateVariableDeclaration,
      {typeName,{elementaryTypeName,"uint"}},
      [],
      {identifier,"x"},
      []}},
    {contractPart,
     {stateVariableDeclaration,
      {typeName,
       {mapping,
        {elementaryTypeName,"uint"},
        {typeName,
         {mapping,
          {elementaryTypeName,"uint"},
          {typeName,{userDefinedTypeName,[{identifier,"s"}]}}}}}},
      [],
      {identifier,"data"},
      []}}]}]}
```

## 2. Documentation

The documentation for **syparse** is available here: [Wiki](https://github.com/walter-weinmann/syparse/wiki).

## 3. Known issues

**Due to deficiencies in the grammar definition of the rules `PrimaryExpression` and `TypeName`, the usability of the parser is still very limited.**
### ElementaryTypeNameExpression

Due to a reduce / reduce conflict between
```
ElementaryTypeNameExpression = ElementaryTypeName
```
and
```
TypeName = ElementaryTypeName
         | UserDefinedTypeName
         | Mapping
         | ArrayTypeName
         | FunctionTypeName
```
the grammar rule of ```ElementaryTypeNameExpression``` has precedence over ```TypeName```.

### Identifier versus Keywords

Keywords such as 'abstract', 'address', 'after', etc. must not be used as identifiers.

### NumberLiteral

```
NumberLiteral = '0x'? [0-9]+ (' ' NumberUnit)?
```

The ' ' can not be enforced with the parser tools leex and yecc.

### ParameterList

Due to a reduce / reduce conflict between
```
ParameterList =        '(' ( TypeName            Identifier? (',' TypeName            Identifier?)* )? ')'
```
and
```
TypeNameList =         '(' ( TypeName (',' TypeName )* )? ')'
```
the grammar rule of ```ParameterList``` has precedence over ```TypeNameList```.

### PrimaryExpression

Due to a reduce / reduce conflict between
```
PrimaryExpression = BooleanLiteral
                  | NumberLiteral
                  | HexLiteral
                  | StringLiteral
                  | TupleExpression
                  | Identifier
                  | ElementaryTypeNameExpression
```
and
```
UserDefinedTypeName = Identifier ( '.' Identifier )*
```
the grammar rule of ```PrimaryExpression``` has precedence over ```UserDefinedTypeName```.

### TypeNameList

Due to a reduce / reduce conflict between
```
ParameterList =        '(' ( TypeName            Identifier? (',' TypeName            Identifier?)* )? ')'
```
and
```
TypeNameList =         '(' ( TypeName (',' TypeName )* )? ')'
```
the grammar rule of ```ParameterList``` has precedence over ```TypeNameList```.

## 4. Acknowledgement

This project was inspired by the [sqlparse](https://github.com/K2InformaticsGmbH/sqlparse) project of the company [K2 Informatics GmbH](http://www.k2informatics.ch).

## 5. Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
