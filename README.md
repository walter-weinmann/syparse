# syparse - the Solidity parser written in Erlang

[![Build Status](https://travis-ci.org/walter-weinmann/syparse.svg?branch=master)](https://travis-ci.org/walter-weinmann/syparse)

**syparse** is a production-ready [Solidity](https://github.com/ethereum/solidity) parser written in pure Erlang.  **syparse** is closely aligned to the Solidity project and in future will be adapted on a regular basis as the Solidity project evolves. Solidity is a high-level language whose syntax is similar to that of JavaScript and it is designed to compile to code for the Ethereum Virtual Machine. And, with the [grammar.txt file](https://github.com/ethereum/solidity/blob/develop/libsolidity/grammar.txt) the project provides the basis for the definition of the LALR grammar.

## 1. Usage

### Example code:

```
contract C {
    function f(uint a) private returns (uint b) { return a + 1; }
    function setData(uint a) internal { data = a; }
    uint public data;
}
```

### Parsing the example code:

```erlang
1> {ok, {ParseTree, Tokens}} = syparse:parsetree_with_tokens("contract C {functi
on f(uint a) private returns (uint b) { return a + 1; } function setData(uint a)
 internal { data = a; } uint public data;}").

{ok,{{sourceUnit,
         [{contractDefinition,"contract",
              {identifier,"C"},
              [],
              [{contractPart,
                   {functionDefinition,
                       {identifier,"f"},
                       {parameterList,
                           [{{typeName,{elementaryTypeName,"uint"},[]},
                             {identifier,"a"}}]},
                       ["private"],
                       {parameterList,
                           [{{typeName,{elementaryTypeName,"uint"},[]},
                             {identifier,"b"}}]},
                       {block,[{statement,{return,{expression,{...},...}}}]}}},
               {contractPart,
                   {functionDefinition,
                       {identifier,"setData"},
                       {parameterList,
                           [{{typeName,{elementaryTypeName,"uint"},[]},
                             {identifier,"a"}}]},
                       ["internal"],
                       [],
                       {block,
                           [{statement,
                                {simpleStatement,
                                    {expressionStatement,...}}}]}}},
               {contractPart,
                   {stateVariableDeclaration,
                       {typeName,{elementaryTypeName,"uint"},[]},
                       "public",
                       {identifier,"data"},
                       []}}]}]},
     [{'CONTRACT',1},
      {'IDENTIFIER',1,"C"},
      {'{',1},
      {'FUNCTION',1},
      {'IDENTIFIER',1,"f"},
      {'(',1},
      {'UINT',1,"uint"},
      {'IDENTIFIER',1,"a"},
      {')',1},
      {'PRIVATE',1},
      {'RETURNS',1},
      {'(',1},
      {'UINT',1,"uint"},
      {'IDENTIFIER',1,"b"},
      {')',1},
      {'{',1},
      {'RETURN',1},
      {'IDENTIFIER',1,"a"},
      {'+',1},
      {'NUMBER_LITERAL',1,"1"},
      {';',1},
      {'}',1},
      {'FUNCTION',1},
      {'IDENTIFIER',...},
      {...}|...]}}
````

### Access the parse tree of the example code:

```erlang
2> ParseTree.

{sourceUnit,
    [{contractDefinition,"contract",
         {identifier,"C"},
         [],
         [{contractPart,
              {functionDefinition,
                  {identifier,"f"},
                  {parameterList,
                      [{{typeName,{elementaryTypeName,"uint"},[]},
                        {identifier,"a"}}]},
                  ["private"],
                  {parameterList,
                      [{{typeName,{elementaryTypeName,"uint"},[]},
                        {identifier,"b"}}]},
                  {block,
                      [{statement,
                           {return,
                               {expression,
                                   {expression,{primaryExpression,...}},
                                   "+",
                                   {expression,...}}}}]}}},
          {contractPart,
              {functionDefinition,
                  {identifier,"setData"},
                  {parameterList,
                      [{{typeName,{elementaryTypeName,"uint"},[]},
                        {identifier,"a"}}]},
                  ["internal"],
                  [],
                  {block,
                      [{statement,
                           {simpleStatement,
                               {expressionStatement,
                                   {expression,{...},...}}}}]}}},
          {contractPart,
              {stateVariableDeclaration,
                  {typeName,{elementaryTypeName,"uint"},[]},
                  "public",
                  {identifier,"data"},
                  []}}]}]}
```

### Access the token list of the example code:

```erlang
3> Tokens.

[{'CONTRACT',1},
 {'IDENTIFIER',1,"C"},
 {'{',1},
 {'FUNCTION',1},
 {'IDENTIFIER',1,"f"},
 {'(',1},
 {'UINT',1,"uint"},
 {'IDENTIFIER',1,"a"},
 {')',1},
 {'PRIVATE',1},
 {'RETURNS',1},
 {'(',1},
 {'UINT',1,"uint"},
 {'IDENTIFIER',1,"b"},
 {')',1},
 {'{',1},
 {'RETURN',1},
 {'IDENTIFIER',1,"a"},
 {'+',1},
 {'NUMBER_LITERAL',1,"1"},
 {';',1},
 {'}',1},
 {'FUNCTION',1},
 {'IDENTIFIER',7,"setData"},
 {'(',1},
 {'UINT',1,[...]},
 {'IDENTIFIER',1,...},
 {')',...},
 {...}|...]
```

### Compile the code from a parse tree:

```erlang
4> syparse:parsetree_to_string(ParseTree).

<<"contract C{function f(uint a)private returns(uint b){return a + 1;} function
setData(uint a)internal {data = a;} uin"...>>
```

### Complete parse tree:

The output of the parse tree in the Erlang shell is shortened (cause not known). The complete parse tree of the example code looks as follows:

```erlang
{sourceUnit,
 [{contractDefinition,"contract",
   {identifier,"C"},
   [],
   [{contractPart,
     {functionDefinition,
      {identifier,"f"},
      {parameterList,
       [{{typeName,{elementaryTypeName,"uint"},[]},
         {identifier,"a"}}]},
      ["private"],
      {parameterList,
       [{{typeName,{elementaryTypeName,"uint"},[]},
         {identifier,"b"}}]},
      {block,
       [{statement,
         {return,
          {expression,
           {expression,{primaryExpression,{identifier,"a"}}},
           "+",
           {expression,
            {primaryExpression,{numberLiteral,"1",[]}}}}}}]}}},
    {contractPart,
     {functionDefinition,
      {identifier,"setData"},
      {parameterList,
       [{{typeName,{elementaryTypeName,"uint"},[]},
         {identifier,"a"}}]},
      ["internal"],
      [],
      {block,
       [{statement,
         {simpleStatement,
          {expressionStatement,
           {expression,
            {expression,{primaryExpression,{identifier,"data"}}},
            "=",
            {expression,
             {primaryExpression,{identifier,"a"}}}}}}}]}}},
    {contractPart,
     {stateVariableDeclaration,
      {typeName,{elementaryTypeName,"uint"},[]},
      "public",
      {identifier,"data"},
      []}}]}]}

```

## 2. Documentation

The documentation for **syparse** is available here: [Wiki](https://github.com/walter-weinmann/syparse/wiki).

## 3. Known issues

### Expression

```
Expression = Expression ',' Expression
```

This rule results in a reduce/reduce conflict with `InheritanceSpecifier = Identifier ( '(' Expression ( ',' Expression )* ')' )?`, for example.

### Keyword 'from'

```
ImportDirective = ... | 'import' ('*' | Identifier) ('as' Identifier)? 'from' StringLiteral ';' | ...
```

The keyword `from` cannot be used as an identifier.

### NumberLiteral

```
NumberLiteral = '0x'? [0-9]+ (' ' NumberUnit)?
```

The ' ' can not be enforced with the parser tools leex and yecc.

### TypeName

```
TypeName = Identifier
```

This rule results in a reduce/reduce conflict with `PrimaryExpression = Identifier`, for example.

## 4. Acknowledgement

This project was inspired by the [sqlparse](https://github.com/K2InformaticsGmbH/sqlparse) project of the company [K2 Informatics GmbH](http://www.k2informatics.ch).

## 5. Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## 6. Release Notes

### Version 1.0.1

Release Date: 17.11.2016 - Grammar as of 08.01.2017

#### Grammar changes

- **ArrayTypeName**

```
New: ArrayTypeName = TypeName '[' Expression? ']' StorageLocation?

Old: ArrayTypeName = TypeName StorageLocation? '[' Expression? ']'
```

- **AssemblyAssignment**

```
New: AssemblyAssignment = Identifier ':=' FunctionalAssemblyExpression | '=:' Identifier

Old: n/a
```

- **AssemblyLocalBinding**

```
New: AssemblyLocalBinding = 'let' Identifier ':=' FunctionalAssemblyExpression

Old: n/a
```

- **AssemblyItem**

```
New: AssemblyItem = Identifier | FunctionalAssemblyExpression | InlineAssemblyBlock | AssemblyLocalBinding | AssemblyAssignment | NumberLiteral | StringLiteral | HexLiteral

Old: n/a
```

- **DecimalNumber**

```
New: DecimalNumber = [0-9]+

Old: n/a
```

- **DoWhileStatement**

```
New: DoWhileStatement = 'do' Statement 'while' '(' Expression ')' ';'

Old: n/a
```

- **ElementaryTypeNameExpression**

```
New: ElementaryTypeNameExpression = ElementaryTypeName

Old: n/a
```

- **Expression**

```
New: | Expression ('<<' | '>>') Expression

Old: | Expression ('<<' | '>>' | '>>>')
```

- **ExpressionStatement**

```
New: ExpressionStatement = Expression

Old: ExpressionStatement = Expression | VariableDefinition
```

- **FunctionalAssemblyExpression**

```
New: FunctionalAssemblyExpression = Identifier '(' AssemblyItem? ( ',' AssemblyItem )* ')'

Old: n/a
```

- **FunctionCall**

```
New: FunctionCall = ( PrimaryExpression | NewExpression | TypeName ) ( ( '.' Identifier ) | ( '[' Expression ']' ) )* '(' Expression? ( ',' Expression )* ')'

Old: FunctionCall = Identifier '(' Expression? ( ',' Expression )* ')'
```

- **FunctionDefinition**

```
New: FunctionDefinition = 'function' Identifier? ParameterList
                          ( FunctionCall | Identifier | 'constant' | 'payable' | 'external' | 'public' | 'internal' | 'private' )*
                          ( 'returns' ParameterList )? ( ';' | Block )

Old: FunctionDefinition = 'function' Identifier? ParameterList
                          ( FunctionCall | Identifier | 'constant' | 'external' | 'public' | 'internal' | 'private' )*
                          ( 'returns' ParameterList )? Block
```

- **FunctionTypeName**

```
New: FunctionTypeName = 'function' TypeNameList ( 'internal' | 'external' | 'constant' | 'payable' )*
                        ( 'returns' TypeNameList )?

Old: n/a
```

- **HexLiteral**

```
New: HexLiteral = 'hex' ('"' ([0-9a-fA-F]{2})* '"' | '\'' ([0-9a-fA-F]{2})* '\'')

Old: n/a
```

- **HexNumber**

```
New: HexNumber = '0x' [0-9a-fA-F]+

Old: n/a
```

- **InheritanceSpecifier**

```
New: InheritanceSpecifier = UserDefinedTypeName ( '(' Expression ( ',' Expression )* ')' )?

Old: InheritanceSpecifier = Identifier ( '(' Expression ( ',' Expression )* ')' )?
```

- **InlineAssemblyBlock**

```
New: InlineAssemblyBlock = '{' AssemblyItem* '}'

Old: n/a
```

- **InlineAssemblyStatement**

```
New: InlineAssemblyStatement = 'assembly' InlineAssemblyBlock

Old: n/a
```

- **NumberLiteral**

```
New: NumberLiteral = ( HexNumber | DecimalNumber ) (' ' NumberUnit)?

Old: NumberLiteral = '0x'? [0-9]+ (' ' NumberUnit)?
```

- **PragmaDirective**

```
New: PragmaDirective = 'pragma' Identifier ([^;]+) ';'

Old: PragmaDirective = 'pragma' Identifier Expression ';'
```

- **PrimaryExpression**

```
New: PrimaryExpression = Identifier
                       | BooleanLiteral
                       | NumberLiteral
                       | HexLiteral
                       | StringLiteral
                       | ElementaryTypeNameExpression

Old: PrimaryExpression = Identifier | BooleanLiteral | NumberLiteral | StringLiteral
```

- **Statement**

```
New: Statement = IfStatement | WhileStatement | ForStatement | Block | InlineAssemblyStatement |
                 ( DoWhileStatement | PlaceholderStatement | Continue | Break | Return |
                   Throw | SimpleStatement ) ';'

Old: Statement = IfStatement | WhileStatement | ForStatement | Block | PlaceholderStatement |
                 ( Continue | Break | Return | Throw | SimpleStatement | ExpressionStatement ) ';'
```

- **TypeName**

```
New: TypeName = ElementaryTypeName
              | UserDefinedTypeName StorageLocation?
              | Mapping
              | ArrayTypeName
              | FunctionTypeName

Old: TypeName = ElementaryTypeName | Identifier StorageLocation? | Mapping | ArrayTypeName
```

- **TypeNameList**

```
New: TypeNameList = '(' ( TypeName (',' TypeName )* )? ')'

Old: n/a
```

- **UserDefinedTypeName**

```
New: UserDefinedTypeName = Identifier ( '.' Identifier )*

Old: n/a
```

#### New features

1. Support of rebar3.
2. Additional test data based on Solidity documentation.

### Version 1.0.0

Release Date: 05.09.2016
