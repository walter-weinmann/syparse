%% -*- erlang -*-
Header "%% Copyright (C) Walter Weinmann"
"%% @private"
"%% @Author Walter Weinmann".

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nonterminals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 anonymous_opt
 array_type_name
 as_identifier
 as_identifier_opt
 assignment
 block
 boolean_literal
 break
 continue
 contract_definition
 contract_part
 contract_part_list
 contract_part_list_opt
 elementary_type_name
 enum_definition
 enum_value
 enum_value_commalist
 enum_value_commalist_opt
 event_definition
 expression
 expression_commalist
 expression_commalist_opt
 expression_statement
 for_statement
 function_call
 function_definition
 function_definition_visibility
 function_definition_visibility_list
 function_definition_visibility_list_opt
 identifier
 if_statement
 import
 import_identifier
 import_identifier_commalist
 import_list
 import_list_opt
 imports
 index_access
 indexed_type_parameter
 indexed_type_parameter_commalist
 indexed_type_parameter_list
 inheritance_specifier
 inheritance_specifier_commalist
 inheritance_specifier_commalist_opt
 initial_value_opt
 mapping
 member_access
 modifier_definition
 new_expression
 number_literal
 number_unit
 number_unit_opt
 parameter_list
 parameter_list_opt
 place_holder_statement
 primary_expression
 return
 returns_opt
 state_variable_declaration
 state_variable_declaration_visibility
 state_variable_declaration_visibility_opt
 statement
 statement_list
 statement_list_opt
 string_literal
 struct_definition
 throw
 type_name
 type_name_commalist
 type_parameter_list
 using_declaration
 var_def_or_expr_stmt
 variable_declaration
 variable_declaration_commalist
 variable_declaration_commalist_opt
 variable_declaration_semicolonlist
 variable_declaration_semicolonlist_opt
 variable_definition
 while_statement
 .

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Terminals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 ADDRESS
 ANONYMOUS
 AS
 BOOL
 BREAK
 BYTE
 BYTES
 BYTES1
 BYTES2
 BYTES3
 BYTES4
 BYTES5
 BYTES6
 BYTES7
 BYTES8
 BYTES9
 BYTES10
 BYTES11
 BYTES12
 BYTES13
 BYTES14
 BYTES15
 BYTES16
 BYTES17
 BYTES18
 BYTES19
 BYTES20
 BYTES21
 BYTES22
 BYTES23
 BYTES24
 BYTES25
 BYTES26
 BYTES27
 BYTES28
 BYTES29
 BYTES30
 BYTES31
 BYTES32
 CONSTANT
 CONTINUE
 CONTRACT
 DAYS
 DELETE
 ELSE
 ENUM
 ETHER
 EVENT
 EXTERNAL
 FALSE
 FINNEY
 FIXED
 
 FIXED0X8
 FIXED0X16
 FIXED0X24
 FIXED0X32
 FIXED0X40
 FIXED0X48
 FIXED0X56
 FIXED0X64
 FIXED0X72
 FIXED0X80
 FIXED0X88
 FIXED0X96
 FIXED0X104
 FIXED0X112
 FIXED0X120
 FIXED0X128
 FIXED0X136
 FIXED0X144
 FIXED0X152
 FIXED0X160
 FIXED0X168
 FIXED0X176
 FIXED0X184
 FIXED0X192
 FIXED0X200
 FIXED0X208
 FIXED0X216
 FIXED0X224
 FIXED0X232
 FIXED0X240
 FIXED0X248
 FIXED0X256
 
 FIXED8X8
 FIXED8X16
 FIXED8X24
 FIXED8X32
 FIXED8X40
 FIXED8X48
 FIXED8X56
 FIXED8X64
 FIXED8X72
 FIXED8X80
 FIXED8X88
 FIXED8X96
 FIXED8X104
 FIXED8X112
 FIXED8X120
 FIXED8X128
 FIXED8X136
 FIXED8X144
 FIXED8X152
 FIXED8X160
 FIXED8X168
 FIXED8X176
 FIXED8X184
 FIXED8X192
 FIXED8X200
 FIXED8X208
 FIXED8X216
 FIXED8X224
 FIXED8X232
 FIXED8X240
 FIXED8X248

 FIXED16X8
 FIXED16X16
 FIXED16X24
 FIXED16X32
 FIXED16X40
 FIXED16X48
 FIXED16X56
 FIXED16X64
 FIXED16X72
 FIXED16X80
 FIXED16X88
 FIXED16X96
 FIXED16X104
 FIXED16X112
 FIXED16X120
 FIXED16X128
 FIXED16X136
 FIXED16X144
 FIXED16X152
 FIXED16X160
 FIXED16X168
 FIXED16X176
 FIXED16X184
 FIXED16X192
 FIXED16X200
 FIXED16X208
 FIXED16X216
 FIXED16X224
 FIXED16X232
 FIXED16X240

 FIXED24X8
 FIXED24X16
 FIXED24X24
 FIXED24X32
 FIXED24X40
 FIXED24X48
 FIXED24X56
 FIXED24X64
 FIXED24X72
 FIXED24X80
 FIXED24X88
 FIXED24X96
 FIXED24X104
 FIXED24X112
 FIXED24X120
 FIXED24X128
 FIXED24X136
 FIXED24X144
 FIXED24X152
 FIXED24X160
 FIXED24X168
 FIXED24X176
 FIXED24X184
 FIXED24X192
 FIXED24X200
 FIXED24X208
 FIXED24X216
 FIXED24X224
 FIXED24X232

 FIXED32X8
 FIXED32X16
 FIXED32X24
 FIXED32X32
 FIXED32X40
 FIXED32X48
 FIXED32X56
 FIXED32X64
 FIXED32X72
 FIXED32X80
 FIXED32X88
 FIXED32X96
 FIXED32X104
 FIXED32X112
 FIXED32X120
 FIXED32X128
 FIXED32X136
 FIXED32X144
 FIXED32X152
 FIXED32X160
 FIXED32X168
 FIXED32X176
 FIXED32X184
 FIXED32X192
 FIXED32X200
 FIXED32X208
 FIXED32X216
 FIXED32X224

 FIXED40X8
 FIXED40X16
 FIXED40X24
 FIXED40X32
 FIXED40X40
 FIXED40X48
 FIXED40X56
 FIXED40X64
 FIXED40X72
 FIXED40X80
 FIXED40X88
 FIXED40X96
 FIXED40X104
 FIXED40X112
 FIXED40X120
 FIXED40X128
 FIXED40X136
 FIXED40X144
 FIXED40X152
 FIXED40X160
 FIXED40X168
 FIXED40X176
 FIXED40X184
 FIXED40X192
 FIXED40X200
 FIXED40X208
 FIXED40X216

 FIXED48X8
 FIXED48X16
 FIXED48X24
 FIXED48X32
 FIXED48X40
 FIXED48X48
 FIXED48X56
 FIXED48X64
 FIXED48X72
 FIXED48X80
 FIXED48X88
 FIXED48X96
 FIXED48X104
 FIXED48X112
 FIXED48X120
 FIXED48X128
 FIXED48X136
 FIXED48X144
 FIXED48X152
 FIXED48X160
 FIXED48X168
 FIXED48X176
 FIXED48X184
 FIXED48X192
 FIXED48X200
 FIXED48X208

 FIXED56X8
 FIXED56X16
 FIXED56X24
 FIXED56X32
 FIXED56X40
 FIXED56X48
 FIXED56X56
 FIXED56X64
 FIXED56X72
 FIXED56X80
 FIXED56X88
 FIXED56X96
 FIXED56X104
 FIXED56X112
 FIXED56X120
 FIXED56X128
 FIXED56X136
 FIXED56X144
 FIXED56X152
 FIXED56X160
 FIXED56X168
 FIXED56X176
 FIXED56X184
 FIXED56X192
 FIXED56X200

 FIXED64X8
 FIXED64X16
 FIXED64X24
 FIXED64X32
 FIXED64X40
 FIXED64X48
 FIXED64X56
 FIXED64X64
 FIXED64X72
 FIXED64X80
 FIXED64X88
 FIXED64X96
 FIXED64X104
 FIXED64X112
 FIXED64X120
 FIXED64X128
 FIXED64X136
 FIXED64X144
 FIXED64X152
 FIXED64X160
 FIXED64X168
 FIXED64X176
 FIXED64X184
 FIXED64X192

 FIXED72X8
 FIXED72X16
 FIXED72X24
 FIXED72X32
 FIXED72X40
 FIXED72X48
 FIXED72X56
 FIXED72X64
 FIXED72X72
 FIXED72X80
 FIXED72X88
 FIXED72X96
 FIXED72X104
 FIXED72X112
 FIXED72X120
 FIXED72X128
 FIXED72X136
 FIXED72X144
 FIXED72X152
 FIXED72X160
 FIXED72X168
 FIXED72X176
 FIXED72X184

 FIXED80X8
 FIXED80X16
 FIXED80X24
 FIXED80X32
 FIXED80X40
 FIXED80X48
 FIXED80X56
 FIXED80X64
 FIXED80X72
 FIXED80X80
 FIXED80X88
 FIXED80X96
 FIXED80X104
 FIXED80X112
 FIXED80X120
 FIXED80X128
 FIXED80X136
 FIXED80X144
 FIXED80X152
 FIXED80X160
 FIXED80X168
 FIXED80X176

 FIXED88X8
 FIXED88X16
 FIXED88X24
 FIXED88X32
 FIXED88X40
 FIXED88X48
 FIXED88X56
 FIXED88X64
 FIXED88X72
 FIXED88X80
 FIXED88X88
 FIXED88X96
 FIXED88X104
 FIXED88X112
 FIXED88X120
 FIXED88X128
 FIXED88X136
 FIXED88X144
 FIXED88X152
 FIXED88X160
 FIXED88X168

 FIXED96X8
 FIXED96X16
 FIXED96X24
 FIXED96X32
 FIXED96X40
 FIXED96X48
 FIXED96X56
 FIXED96X64
 FIXED96X72
 FIXED96X80
 FIXED96X88
 FIXED96X96
 FIXED96X104
 FIXED96X112
 FIXED96X120
 FIXED96X128
 FIXED96X136
 FIXED96X144
 FIXED96X152
 FIXED96X160

 FIXED104X8
 FIXED104X16
 FIXED104X24
 FIXED104X32
 FIXED104X40
 FIXED104X48
 FIXED104X56
 FIXED104X64
 FIXED104X72
 FIXED104X80
 FIXED104X88
 FIXED104X96
 FIXED104X104
 FIXED104X112
 FIXED104X120
 FIXED104X128
 FIXED104X136
 FIXED104X144
 FIXED104X152

 FIXED112X8
 FIXED112X16
 FIXED112X24
 FIXED112X32
 FIXED112X40
 FIXED112X48
 FIXED112X56
 FIXED112X64
 FIXED112X72
 FIXED112X80
 FIXED112X88
 FIXED112X96
 FIXED112X104
 FIXED112X112
 FIXED112X120
 FIXED112X128
 FIXED112X136
 FIXED112X144

 FIXED120X8
 FIXED120X16
 FIXED120X24
 FIXED120X32
 FIXED120X40
 FIXED120X48
 FIXED120X56
 FIXED120X64
 FIXED120X72
 FIXED120X80
 FIXED120X88
 FIXED120X96
 FIXED120X104
 FIXED120X112
 FIXED120X120
 FIXED120X128
 FIXED120X136

 FIXED128X8
 FIXED128X16
 FIXED128X24
 FIXED128X32
 FIXED128X40
 FIXED128X48
 FIXED128X56
 FIXED128X64
 FIXED128X72
 FIXED128X80
 FIXED128X88
 FIXED128X96
 FIXED128X104
 FIXED128X112
 FIXED128X120
 FIXED128X128

 FIXED136X8
 FIXED136X16
 FIXED136X24
 FIXED136X32
 FIXED136X40
 FIXED136X48
 FIXED136X56
 FIXED136X64
 FIXED136X72
 FIXED136X80
 FIXED136X88
 FIXED136X96
 FIXED136X104
 FIXED136X112
 FIXED136X120

 FIXED144X8
 FIXED144X16
 FIXED144X24
 FIXED144X32
 FIXED144X40
 FIXED144X48
 FIXED144X56
 FIXED144X64
 FIXED144X72
 FIXED144X80
 FIXED144X88
 FIXED144X96
 FIXED144X104
 FIXED144X112

 FIXED152X8
 FIXED152X16
 FIXED152X24
 FIXED152X32
 FIXED152X40
 FIXED152X48
 FIXED152X56
 FIXED152X64
 FIXED152X72
 FIXED152X80
 FIXED152X88
 FIXED152X96
 FIXED152X104

 FIXED160X8
 FIXED160X16
 FIXED160X24
 FIXED160X32
 FIXED160X40
 FIXED160X48
 FIXED160X56
 FIXED160X64
 FIXED160X72
 FIXED160X80
 FIXED160X88
 FIXED160X96

 FIXED168X8
 FIXED168X16
 FIXED168X24
 FIXED168X32
 FIXED168X40
 FIXED168X48
 FIXED168X56
 FIXED168X64
 FIXED168X72
 FIXED168X80
 FIXED168X88

 FIXED176X8
 FIXED176X16
 FIXED176X24
 FIXED176X32
 FIXED176X40
 FIXED176X48
 FIXED176X56
 FIXED176X64
 FIXED176X72
 FIXED176X80

 FIXED184X8
 FIXED184X16
 FIXED184X24
 FIXED184X32
 FIXED184X40
 FIXED184X48
 FIXED184X56
 FIXED184X64
 FIXED184X72

 FIXED192X8
 FIXED192X16
 FIXED192X24
 FIXED192X32
 FIXED192X40
 FIXED192X48
 FIXED192X56
 FIXED192X64

 FIXED200X8
 FIXED200X16
 FIXED200X24
 FIXED200X32
 FIXED200X40
 FIXED200X48
 FIXED200X56

 FIXED208X8
 FIXED208X16
 FIXED208X24
 FIXED208X32
 FIXED208X40
 FIXED208X48

 FIXED216X8
 FIXED216X16
 FIXED216X24
 FIXED216X32
 FIXED216X40

 FIXED224X8
 FIXED224X16
 FIXED224X24
 FIXED224X32

 FIXED232X8
 FIXED232X16
 FIXED232X24

 FIXED240X8
 FIXED240X16

 FIXED248X8

 FOR
 FROM
 FUNCTION
 HOURS
 IDENTIFIER
 IF
 IMPORT
 INDEXED
 INT
 INTERNAL
 INT8
 INT16
 INT24
 INT32
 INT40
 INT48
 INT56
 INT64
 INT72
 INT80
 INT88
 INT96
 INT104
 INT112
 INT120
 INT128
 INT136
 INT144
 INT152
 INT160
 INT168
 INT176
 INT184
 INT192
 INT200
 INT208
 INT216
 INT224
 INT232
 INT240
 INT248
 INT256
 IS
 LIBRARY
 MAPPING
 MEMORY
 MINUTES
 MODIFIER
 NEW
 NUMBER_LITERAL
 PRIVATE
 PUBLIC
 RETURN
 RETURNS
 SECONDS
 STORAGE
 STRING
 STRING_LITERAL
 STRUCT
 SZABO
 THROW
 TRUE
 UFIXED
 
 UFIXED0X8
 UFIXED0X16
 UFIXED0X24
 UFIXED0X32
 UFIXED0X40
 UFIXED0X48
 UFIXED0X56
 UFIXED0X64
 UFIXED0X72
 UFIXED0X80
 UFIXED0X88
 UFIXED0X96
 UFIXED0X104
 UFIXED0X112
 UFIXED0X120
 UFIXED0X128
 UFIXED0X136
 UFIXED0X144
 UFIXED0X152
 UFIXED0X160
 UFIXED0X168
 UFIXED0X176
 UFIXED0X184
 UFIXED0X192
 UFIXED0X200
 UFIXED0X208
 UFIXED0X216
 UFIXED0X224
 UFIXED0X232
 UFIXED0X240
 UFIXED0X248
 UFIXED0X256
 
 UFIXED8X8
 UFIXED8X16
 UFIXED8X24
 UFIXED8X32
 UFIXED8X40
 UFIXED8X48
 UFIXED8X56
 UFIXED8X64
 UFIXED8X72
 UFIXED8X80
 UFIXED8X88
 UFIXED8X96
 UFIXED8X104
 UFIXED8X112
 UFIXED8X120
 UFIXED8X128
 UFIXED8X136
 UFIXED8X144
 UFIXED8X152
 UFIXED8X160
 UFIXED8X168
 UFIXED8X176
 UFIXED8X184
 UFIXED8X192
 UFIXED8X200
 UFIXED8X208
 UFIXED8X216
 UFIXED8X224
 UFIXED8X232
 UFIXED8X240
 UFIXED8X248

 UFIXED16X8
 UFIXED16X16
 UFIXED16X24
 UFIXED16X32
 UFIXED16X40
 UFIXED16X48
 UFIXED16X56
 UFIXED16X64
 UFIXED16X72
 UFIXED16X80
 UFIXED16X88
 UFIXED16X96
 UFIXED16X104
 UFIXED16X112
 UFIXED16X120
 UFIXED16X128
 UFIXED16X136
 UFIXED16X144
 UFIXED16X152
 UFIXED16X160
 UFIXED16X168
 UFIXED16X176
 UFIXED16X184
 UFIXED16X192
 UFIXED16X200
 UFIXED16X208
 UFIXED16X216
 UFIXED16X224
 UFIXED16X232
 UFIXED16X240

 UFIXED24X8
 UFIXED24X16
 UFIXED24X24
 UFIXED24X32
 UFIXED24X40
 UFIXED24X48
 UFIXED24X56
 UFIXED24X64
 UFIXED24X72
 UFIXED24X80
 UFIXED24X88
 UFIXED24X96
 UFIXED24X104
 UFIXED24X112
 UFIXED24X120
 UFIXED24X128
 UFIXED24X136
 UFIXED24X144
 UFIXED24X152
 UFIXED24X160
 UFIXED24X168
 UFIXED24X176
 UFIXED24X184
 UFIXED24X192
 UFIXED24X200
 UFIXED24X208
 UFIXED24X216
 UFIXED24X224
 UFIXED24X232

 UFIXED32X8
 UFIXED32X16
 UFIXED32X24
 UFIXED32X32
 UFIXED32X40
 UFIXED32X48
 UFIXED32X56
 UFIXED32X64
 UFIXED32X72
 UFIXED32X80
 UFIXED32X88
 UFIXED32X96
 UFIXED32X104
 UFIXED32X112
 UFIXED32X120
 UFIXED32X128
 UFIXED32X136
 UFIXED32X144
 UFIXED32X152
 UFIXED32X160
 UFIXED32X168
 UFIXED32X176
 UFIXED32X184
 UFIXED32X192
 UFIXED32X200
 UFIXED32X208
 UFIXED32X216
 UFIXED32X224

 UFIXED40X8
 UFIXED40X16
 UFIXED40X24
 UFIXED40X32
 UFIXED40X40
 UFIXED40X48
 UFIXED40X56
 UFIXED40X64
 UFIXED40X72
 UFIXED40X80
 UFIXED40X88
 UFIXED40X96
 UFIXED40X104
 UFIXED40X112
 UFIXED40X120
 UFIXED40X128
 UFIXED40X136
 UFIXED40X144
 UFIXED40X152
 UFIXED40X160
 UFIXED40X168
 UFIXED40X176
 UFIXED40X184
 UFIXED40X192
 UFIXED40X200
 UFIXED40X208
 UFIXED40X216

 UFIXED48X8
 UFIXED48X16
 UFIXED48X24
 UFIXED48X32
 UFIXED48X40
 UFIXED48X48
 UFIXED48X56
 UFIXED48X64
 UFIXED48X72
 UFIXED48X80
 UFIXED48X88
 UFIXED48X96
 UFIXED48X104
 UFIXED48X112
 UFIXED48X120
 UFIXED48X128
 UFIXED48X136
 UFIXED48X144
 UFIXED48X152
 UFIXED48X160
 UFIXED48X168
 UFIXED48X176
 UFIXED48X184
 UFIXED48X192
 UFIXED48X200
 UFIXED48X208

 UFIXED56X8
 UFIXED56X16
 UFIXED56X24
 UFIXED56X32
 UFIXED56X40
 UFIXED56X48
 UFIXED56X56
 UFIXED56X64
 UFIXED56X72
 UFIXED56X80
 UFIXED56X88
 UFIXED56X96
 UFIXED56X104
 UFIXED56X112
 UFIXED56X120
 UFIXED56X128
 UFIXED56X136
 UFIXED56X144
 UFIXED56X152
 UFIXED56X160
 UFIXED56X168
 UFIXED56X176
 UFIXED56X184
 UFIXED56X192
 UFIXED56X200

 UFIXED64X8
 UFIXED64X16
 UFIXED64X24
 UFIXED64X32
 UFIXED64X40
 UFIXED64X48
 UFIXED64X56
 UFIXED64X64
 UFIXED64X72
 UFIXED64X80
 UFIXED64X88
 UFIXED64X96
 UFIXED64X104
 UFIXED64X112
 UFIXED64X120
 UFIXED64X128
 UFIXED64X136
 UFIXED64X144
 UFIXED64X152
 UFIXED64X160
 UFIXED64X168
 UFIXED64X176
 UFIXED64X184
 UFIXED64X192

 UFIXED72X8
 UFIXED72X16
 UFIXED72X24
 UFIXED72X32
 UFIXED72X40
 UFIXED72X48
 UFIXED72X56
 UFIXED72X64
 UFIXED72X72
 UFIXED72X80
 UFIXED72X88
 UFIXED72X96
 UFIXED72X104
 UFIXED72X112
 UFIXED72X120
 UFIXED72X128
 UFIXED72X136
 UFIXED72X144
 UFIXED72X152
 UFIXED72X160
 UFIXED72X168
 UFIXED72X176
 UFIXED72X184

 UFIXED80X8
 UFIXED80X16
 UFIXED80X24
 UFIXED80X32
 UFIXED80X40
 UFIXED80X48
 UFIXED80X56
 UFIXED80X64
 UFIXED80X72
 UFIXED80X80
 UFIXED80X88
 UFIXED80X96
 UFIXED80X104
 UFIXED80X112
 UFIXED80X120
 UFIXED80X128
 UFIXED80X136
 UFIXED80X144
 UFIXED80X152
 UFIXED80X160
 UFIXED80X168
 UFIXED80X176

 UFIXED88X8
 UFIXED88X16
 UFIXED88X24
 UFIXED88X32
 UFIXED88X40
 UFIXED88X48
 UFIXED88X56
 UFIXED88X64
 UFIXED88X72
 UFIXED88X80
 UFIXED88X88
 UFIXED88X96
 UFIXED88X104
 UFIXED88X112
 UFIXED88X120
 UFIXED88X128
 UFIXED88X136
 UFIXED88X144
 UFIXED88X152
 UFIXED88X160
 UFIXED88X168

 UFIXED96X8
 UFIXED96X16
 UFIXED96X24
 UFIXED96X32
 UFIXED96X40
 UFIXED96X48
 UFIXED96X56
 UFIXED96X64
 UFIXED96X72
 UFIXED96X80
 UFIXED96X88
 UFIXED96X96
 UFIXED96X104
 UFIXED96X112
 UFIXED96X120
 UFIXED96X128
 UFIXED96X136
 UFIXED96X144
 UFIXED96X152
 UFIXED96X160

 UFIXED104X8
 UFIXED104X16
 UFIXED104X24
 UFIXED104X32
 UFIXED104X40
 UFIXED104X48
 UFIXED104X56
 UFIXED104X64
 UFIXED104X72
 UFIXED104X80
 UFIXED104X88
 UFIXED104X96
 UFIXED104X104
 UFIXED104X112
 UFIXED104X120
 UFIXED104X128
 UFIXED104X136
 UFIXED104X144
 UFIXED104X152

 UFIXED112X8
 UFIXED112X16
 UFIXED112X24
 UFIXED112X32
 UFIXED112X40
 UFIXED112X48
 UFIXED112X56
 UFIXED112X64
 UFIXED112X72
 UFIXED112X80
 UFIXED112X88
 UFIXED112X96
 UFIXED112X104
 UFIXED112X112
 UFIXED112X120
 UFIXED112X128
 UFIXED112X136
 UFIXED112X144

 UFIXED120X8
 UFIXED120X16
 UFIXED120X24
 UFIXED120X32
 UFIXED120X40
 UFIXED120X48
 UFIXED120X56
 UFIXED120X64
 UFIXED120X72
 UFIXED120X80
 UFIXED120X88
 UFIXED120X96
 UFIXED120X104
 UFIXED120X112
 UFIXED120X120
 UFIXED120X128
 UFIXED120X136

 UFIXED128X8
 UFIXED128X16
 UFIXED128X24
 UFIXED128X32
 UFIXED128X40
 UFIXED128X48
 UFIXED128X56
 UFIXED128X64
 UFIXED128X72
 UFIXED128X80
 UFIXED128X88
 UFIXED128X96
 UFIXED128X104
 UFIXED128X112
 UFIXED128X120
 UFIXED128X128

 UFIXED136X8
 UFIXED136X16
 UFIXED136X24
 UFIXED136X32
 UFIXED136X40
 UFIXED136X48
 UFIXED136X56
 UFIXED136X64
 UFIXED136X72
 UFIXED136X80
 UFIXED136X88
 UFIXED136X96
 UFIXED136X104
 UFIXED136X112
 UFIXED136X120

 UFIXED144X8
 UFIXED144X16
 UFIXED144X24
 UFIXED144X32
 UFIXED144X40
 UFIXED144X48
 UFIXED144X56
 UFIXED144X64
 UFIXED144X72
 UFIXED144X80
 UFIXED144X88
 UFIXED144X96
 UFIXED144X104
 UFIXED144X112

 UFIXED152X8
 UFIXED152X16
 UFIXED152X24
 UFIXED152X32
 UFIXED152X40
 UFIXED152X48
 UFIXED152X56
 UFIXED152X64
 UFIXED152X72
 UFIXED152X80
 UFIXED152X88
 UFIXED152X96
 UFIXED152X104

 UFIXED160X8
 UFIXED160X16
 UFIXED160X24
 UFIXED160X32
 UFIXED160X40
 UFIXED160X48
 UFIXED160X56
 UFIXED160X64
 UFIXED160X72
 UFIXED160X80
 UFIXED160X88
 UFIXED160X96

 UFIXED168X8
 UFIXED168X16
 UFIXED168X24
 UFIXED168X32
 UFIXED168X40
 UFIXED168X48
 UFIXED168X56
 UFIXED168X64
 UFIXED168X72
 UFIXED168X80
 UFIXED168X88

 UFIXED176X8
 UFIXED176X16
 UFIXED176X24
 UFIXED176X32
 UFIXED176X40
 UFIXED176X48
 UFIXED176X56
 UFIXED176X64
 UFIXED176X72
 UFIXED176X80

 UFIXED184X8
 UFIXED184X16
 UFIXED184X24
 UFIXED184X32
 UFIXED184X40
 UFIXED184X48
 UFIXED184X56
 UFIXED184X64
 UFIXED184X72

 UFIXED192X8
 UFIXED192X16
 UFIXED192X24
 UFIXED192X32
 UFIXED192X40
 UFIXED192X48
 UFIXED192X56
 UFIXED192X64

 UFIXED200X8
 UFIXED200X16
 UFIXED200X24
 UFIXED200X32
 UFIXED200X40
 UFIXED200X48
 UFIXED200X56

 UFIXED208X8
 UFIXED208X16
 UFIXED208X24
 UFIXED208X32
 UFIXED208X40
 UFIXED208X48

 UFIXED216X8
 UFIXED216X16
 UFIXED216X24
 UFIXED216X32
 UFIXED216X40

 UFIXED224X8
 UFIXED224X16
 UFIXED224X24
 UFIXED224X32

 UFIXED232X8
 UFIXED232X16
 UFIXED232X24

 UFIXED240X8
 UFIXED240X16

 UFIXED248X8

 UINT
 UINT8
 UINT16
 UINT24
 UINT32
 UINT40
 UINT48
 UINT56
 UINT64
 UINT72
 UINT80
 UINT88
 UINT96
 UINT104
 UINT112
 UINT120
 UINT128
 UINT136
 UINT144
 UINT152
 UINT160
 UINT168
 UINT176
 UINT184
 UINT192
 UINT200
 UINT208
 UINT216
 UINT224
 UINT232
 UINT240
 UINT248
 UINT256
 USING
 VAR
 WEEKS
 WEI
 WHILE
 YEARS
 ','
 '{'
 '}'
 '('
 ')'
 '_'
 ';'
 '=>'
 '['
 ']'
 '.'
 '='
 '|='
 '^='
 '&='
 '<<='
 '>>='
 '>>>='
 '+='
 '-='
 '*='
 '/='
 '%='
 '!'
 '~'
 '++'
 '--'
 '**'
 '*'
 '/'
 '%'
 '|'
 '^'
 '&'
 '<<'
 '>>'
 '>>>'
 '+'
 '-'
 '<='
 '>='
 '<'
 '>'
 '=='
 '!='
 '&&'
 '||'
 '?'
 ':'
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rootsymbol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 contract_definition.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Endsymbol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 '$end'.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Operator precedences.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nonassoc    100 '++' '--'.                              %% increment and decrement.
Nonassoc    110 '(' ')'.                                %% function-like call.
Nonassoc    120 '[' ']'.                                %% array subscripting.
Nonassoc    130 '.'.                                    %% member access.
%Unary      150 '+' '-'.                                %% unary plus and minus.
Nonassoc    160 '!'.                                    %% logical NOT.
Nonassoc    170 '~'.                                    %% bitwise NOT.
Left        200 '**'.                                   %% exponentation.
Left        210 '*' '/' '%'.                            %% multiplication, division and modulo. 
Left        220 '+' '-'.                                %% addition and subtraction. 
Left        300 '<<' '>>' '>>>'.                        %% bitwise shift operators.
Left        310 '&'.                                    %% bitwise AND.
Left        320 '^'.                                    %% bitwise XOR.
Left        330 '|'.                                    %% bitwise OR.
Nonassoc    400 '<' '>' '<=' '>='.                      %% inequality operators.
Nonassoc    410 '==' '!='.                              %% equality operators.
Left        500 '&&'.                                   %% logical AND.
Left        510 '||'.                                   %% logical OR.
Left        600 '?' ':'.                                %% tenary operator. 
Nonassoc    700 '=' '|=' '^=' '&=' '<<=' '>>=' '>>>=' '+=' '-=' '*=' '/=' '%='.     
                                                        %% assignment operators.
Nonassoc    800 ','.                                    %% comma operator.   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Grammar rules.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

contract_definition -> import_list_opt CONTRACT identifier inheritance_specifier_commalist_opt '{' contract_part_list_opt '}'
                                                                                                : {contractDefinition, '$1', '$2', '$3', '$4', '$6'}.
contract_definition -> import_list_opt LIBRARY  identifier inheritance_specifier_commalist_opt '{' contract_part_list_opt '}'
                                                                                                : {contractDefinition, '$1', '$2', '$3', '$4', '$6'}.

contract_definition -> expression                                                               : '$1'.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
import_list_opt -> '$empty'                                                                     : [].
import_list_opt -> import_list                                                                  : '$1'.

import_list -> import_list import                                                               : '$1' ++ ['$2'].
import_list -> import                                                                           : ['$1'].

inheritance_specifier_commalist_opt -> '$empty'                                                 : [].
inheritance_specifier_commalist_opt -> IS inheritance_specifier_commalist                       : '$1'.

inheritance_specifier_commalist -> inheritance_specifier                                        : ['$1'].
inheritance_specifier_commalist -> inheritance_specifier ',' inheritance_specifier_commalist    : ['$1' | '$3'].

contract_part_list_opt -> '$empty'                                                              : [].
contract_part_list_opt -> contract_part_list                                                    : '$1'.

contract_part_list -> contract_part_list contract_part                                          : '$1' ++ ['$2'].
contract_part_list -> contract_part                                                             : ['$1'].
%% =====================================================================================================================

import -> IMPORT imports ';'                                                                    : {import, '$2'}.

imports -> STRING_LITERAL as_identifier_opt                                                     : {imports, '$2'}.
imports -> '*' as_identifier_opt FROM STRING_LITERAL                                            : {imports, '$2', unwrap('$4'), "*"}.
imports -> identifier as_identifier_opt FROM STRING_LITERAL                                     : {imports, '$1', '$2', unwrap('$4')}.
imports -> '(' import_identifier_commalist ')' FROM STRING_LITERAL                              : {imports, '$2', unwrap('$4'), "("}.
 
%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
as_identifier_opt -> '$empty'                                                                   : [].
as_identifier_opt -> as_identifier                                                              : '$1'.

as_identifier -> AS identifier                                                                  : '$1'.

import_identifier_commalist -> import_identifier                                                : ['$1'].
import_identifier_commalist -> import_identifier ',' import_identifier_commalist                : ['$1' | '$3'].

import_identifier -> identifier as_identifier_opt                                               : {'$1', '$2'}.
%% =====================================================================================================================

inheritance_specifier -> identifier '(' expression_commalist ')'                                : {inheritanceSpecifier, '$1', '$3'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
expression_commalist -> expression                                                              : ['$1'].
expression_commalist -> expression ',' expression_commalist                                     : ['$1' | '$3'].
%% =====================================================================================================================

contract_part -> state_variable_declaration                                                     : {contractPart, '$1'}.
contract_part -> using_declaration                                                              : {contractPart, '$1'}.
contract_part -> struct_definition                                                              : {contractPart, '$1'}.
contract_part -> modifier_definition                                                            : {contractPart, '$1'}.
contract_part -> function_definition                                                            : {contractPart, '$1'}.
contract_part -> event_definition                                                               : {contractPart, '$1'}.
contract_part -> enum_definition                                                                : {contractPart, '$1'}.

state_variable_declaration -> type_name state_variable_declaration_visibility_opt identifier ';'
                                                                                                : {stateVariableDeclaration, '$1', '$2', '$3'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
state_variable_declaration_visibility_opt -> '$empty'                                           : [].
state_variable_declaration_visibility_opt -> state_variable_declaration_visibility              : '$1'.

state_variable_declaration_visibility -> PUBLIC                                                 : "public".
state_variable_declaration_visibility -> INTERNAL                                               : "internal".
state_variable_declaration_visibility -> PRIVATE                                                : "private".
%% =====================================================================================================================

using_declaration -> USING identifier FOR type_name ';'                                         : {usingDeclaratioon, '$2', '$4'}.

struct_definition -> STRUCT identifier '{' variable_declaration_semicolonlist_opt '}'           : {structDefinition, '$2', '$4'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
variable_declaration_semicolonlist_opt -> '$empty'                                              : [].
variable_declaration_semicolonlist_opt -> variable_declaration_semicolonlist                    : '$1'.

variable_declaration_semicolonlist -> variable_declaration                                      : ['$1'].
variable_declaration_semicolonlist -> variable_declaration ',' variable_declaration_semicolonlist
                                                                                                : ['$1' | '$3'].
%% =====================================================================================================================

modifier_definition -> MODIFIER identifier parameter_list_opt block                             : {modifierDefinition, '$2', '$3', '$4'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
parameter_list_opt -> '$empty'                                                                  : [].
parameter_list_opt -> parameter_list                                                            : '$1'.
%% =====================================================================================================================

function_definition -> FUNCTION identifier parameter_list function_definition_visibility_list_opt returns_opt block
                                                                                                : {functionDefinition, '$2', '$3', '$4', '$5', '$6'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
function_definition_visibility_list_opt -> '$empty'                                             : [].
function_definition_visibility_list_opt -> function_definition_visibility_list                  : '$1'.

function_definition_visibility_list -> function_definition_visibility_list function_definition_visibility
                                                                                                : '$1' ++ ['$2'].
function_definition_visibility_list -> function_definition_visibility                           : ['$1'].

function_definition_visibility -> function_call                                                 : '$1'.
function_definition_visibility -> identifier                                                    : '$1'.
function_definition_visibility -> CONSTANT                                                      : "constant".
function_definition_visibility -> EXTERNAL                                                      : "external".
function_definition_visibility -> PUBLIC                                                        : "public".
function_definition_visibility -> INTERNAL                                                      : "internal".
function_definition_visibility -> PRIVATE                                                       : "private".

returns_opt -> '$empty'                                                                         : [].
returns_opt -> RETURNS parameter_list                                                           : '$1'.
returns_opt -> RETURNS type_parameter_list                                                      : '$1'.
%% ---------------------------------------------------------------------------------------------------------------------

event_definition -> EVENT identifier parameter_list anonymous_opt ';'                           : {eventDefinition, '$2', '$3', '$4'}.
event_definition -> EVENT identifier type_parameter_list anonymous_opt ';'                      : {eventDefinition, '$2', '$3', '$4'}.
event_definition -> EVENT identifier indexed_type_parameter_list anonymous_opt ';'              : {eventDefinition, '$2', '$3', '$4'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
anonymous_opt -> '$empty'                                                                       : [].
anonymous_opt -> ANONYMOUS                                                                      : "anonymous".
%% ---------------------------------------------------------------------------------------------------------------------

enum_value -> identifier                                                                        : {enumValue, '$1'}.

enum_definition -> ENUM identifier '{' enum_value_commalist_opt '}'                             : {enumDefinition, '$2', '$4'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
enum_value_commalist_opt -> '$empty'                                                            : [].
enum_value_commalist_opt -> enum_value_commalist                                                : '$1'.

enum_value_commalist -> enum_value                                                              : ['$1'].
enum_value_commalist -> enum_value ',' enum_value_commalist                                     : ['$1' | '$3'].
%% ---------------------------------------------------------------------------------------------------------------------

indexed_type_parameter_list -> '(' indexed_type_parameter_commalist ')'                         : {indexedTypeParameterList, '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
indexed_type_parameter_commalist -> indexed_type_parameter                                      : ['$1'].
indexed_type_parameter_commalist -> indexed_type_parameter ',' indexed_type_parameter_commalist : ['$1' | '$3'].

% wwe reduce/reduce conflict.
% wwe indexed_type_parameter -> type_name                                                             : {'$1', [], []}.
% wwe indexed_type_parameter -> type_name identifier                                                  : {'$1', [], '$2'}.
indexed_type_parameter -> type_name INDEXED                                                     : {'$1', "indexed", []}.
indexed_type_parameter -> type_name INDEXED identifier                                          : {'$1', "indexed", '$3'}.
%% ---------------------------------------------------------------------------------------------------------------------

type_parameter_list -> '('                     ')'                                              : {typeParameterList, []}.
type_parameter_list -> '(' type_name_commalist ')'                                              : {typeParameterList, '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
type_name_commalist -> type_name                                                                : ['$1'].
type_name_commalist -> type_name ',' type_name_commalist                                        : ['$1' | '$3'].
%% ---------------------------------------------------------------------------------------------------------------------

parameter_list -> '(' variable_declaration_commalist_opt ')'                                          : {typeParameterList, '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
variable_declaration_commalist_opt -> '$empty'                                                  : [].
variable_declaration_commalist_opt -> variable_declaration_commalist                            : '$1'.

variable_declaration_commalist -> variable_declaration                                          : ['$1'].
variable_declaration_commalist -> variable_declaration ',' variable_declaration_commalist       : ['$1' | '$3'].
%% ---------------------------------------------------------------------------------------------------------------------

variable_declaration -> type_name identifier                                                    : {variableDeclaration, '$1', '$2'}.
variable_declaration -> VAR assignment                                                          : {variableDeclaration, '$2'}.

type_name -> elementary_type_name                                                               : {typeName, '$1'}.
type_name -> identifier                                                                         : {typeName, '$1', []}.
type_name -> identifier MEMORY                                                                  : {typeName, '$1', "memory"}.
type_name -> identifier STORAGE                                                                 : {typeName, '$1', "storage"}.
type_name -> mapping                                                                            : {typeName, '$1'}.
type_name -> array_type_name                                                                    : {typeName, '$1'}.

mapping -> MAPPING '(' elementary_type_name '=>' type_name ')'                                  : {mapping, '$3', '$5'}.

array_type_name -> type_name         '['            ']'                                         : {arrayTypeName, '$1', [],         []}.
array_type_name -> type_name         '[' expression ']'                                         : {arrayTypeName, '$1', [],         '$3'}.
array_type_name -> type_name MEMORY  '['            ']'                                         : {arrayTypeName, '$1', "memory",   []}.
array_type_name -> type_name STORAGE '['            ']'                                         : {arrayTypeName, '$1', "storagfe", []}.
array_type_name -> type_name MEMORY  '[' expression ']'                                         : {arrayTypeName, '$1', "memory",   '$4'}.
array_type_name -> type_name STORAGE '[' expression ']'                                         : {arrayTypeName, '$1', "storagfe", '$4'}.

block -> '{' statement_list_opt '}'                                                             : {block, '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
statement_list_opt -> '$empty'                                                                  : {}.
statement_list_opt -> statement_list                                                            : '$1'.

statement_list -> statement_list statement                                                      : '$1' ++ ['$2'].
statement_list -> statement                                                                     : ['$1'].
%% =====================================================================================================================

statement -> if_statement                                                                       : {statement, '$1'}.
statement -> while_statement                                                                    : {statement, '$1'}.
statement -> for_statement                                                                      : {statement, '$1'}.
statement -> block                                                                              : {statement, '$1'}.
statement -> place_holder_statement                                                             : {statement, '$1'}.
statement -> continue                                                                           : {statement, '$1'}.
statement -> break                                                                              : {statement, '$1'}.
statement -> return                                                                             : {statement, '$1'}.
statement -> throw                                                                              : {statement, '$1'}.
statement -> var_def_or_expr_stmt ';'                                                           : {statement, '$1'}.
statement -> expression_statement ';'                                                           : {statement, '$1'}.

expression_statement -> expression                                                              : {expressionStatement, '$1'}.

%% =====================================================================================================================
%% Helper definitions - reduce/reduce conflict.
%% ---------------------------------------------------------------------------------------------------------------------
% wwe expression_statement -> variable_definition                                                     : {expressionStatement, '$1'}.
%% =====================================================================================================================

expression_statement -> assignment                                                              : {expressionStatement, '$1'}.
expression_statement -> DELETE expression                                                       : {expressionStatement, "delete", '$2'}.

if_statement -> IF '(' expression ')' statement                                                 : {ifStatement, '$3', '$5', []}.
if_statement -> IF '(' expression ')' statement ELSE statement                                  : {ifStatement, '$3', '$5', '$6'}.

while_statement -> WHILE '(' expression ')' statement                                           : {whileStatement, '$3', '$5'}.

place_holder_statement -> '_'                                                                   : {placeHolderStatement, "_"}.

var_def_or_expr_stmt -> variable_definition                                                     : {vardefOrExprStmt, '$1'}.

%% =====================================================================================================================
%% Helper definitions - shift/reduce conflict.
%% ---------------------------------------------------------------------------------------------------------------------
% wwe var_def_or_expr_stmt -> expression_statement                                                    : {vardefOrExprStmt, '$1'}.
%% =====================================================================================================================

for_statement -> FOR '('                      ';'            ';'                      ')' statement
                                                                                                : {forStatement, [],   [],   [],   '$6'}.
for_statement -> FOR '('                      ';'            ';' expression_statement ')' statement
                                                                                                : {forStatement, [],   [],   '$5', '$7'}.
for_statement -> FOR '(' var_def_or_expr_stmt ';'            ';'                      ')' statement
                                                                                                : {forStatement, '$3', [],   [],   '$7'}.
for_statement -> FOR '(' var_def_or_expr_stmt ';'            ';' expression_statement ')' statement
                                                                                                : {forStatement, '$3', [],   '$6', '$8'}.
for_statement -> FOR '('                      ';' expression ';'                      ')' statement
                                                                                                : {forStatement, [],   '$4', [],   '$7'}.
for_statement -> FOR '('                      ';' expression ';' expression_statement ')' statement
                                                                                                : {forStatement, [],   '$4', '$6', '$8'}.
for_statement -> FOR '(' var_def_or_expr_stmt ';' expression ';'                      ')' statement
                                                                                                : {forStatement, '$3', '$5', [],   '$8'}.
for_statement -> FOR '(' var_def_or_expr_stmt ';' expression ';' expression_statement ')' statement
                                                                                                : {forStatement, '$3', '$5', '$7', '$9'}.

continue -> CONTINUE ';'                                                                        : {continue, "continue"}.

break -> BREAK ';'                                                                              : {break, "break"}.

return -> RETURN            ';'                                                                 : {return, []}.
return -> RETURN expression ';'                                                                 : {return, '$2'}.

throw -> THROW ';'                                                                              : {throw, "throw"}.

variable_definition -> variable_declaration initial_value_opt ';'                               : {variableDefinition, '$1', '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
initial_value_opt -> '$empty'                                                                   : [].
initial_value_opt -> '=' expression                                                             : '$2'.
%% ---------------------------------------------------------------------------------------------------------------------

assignment -> expression '=' expression                                                         : {assignment, '$1', "=", '$3'}.
assignment -> expression '|=' expression                                                        : {assignment, '$1', "|=", '$3'}.
assignment -> expression '^=' expression                                                        : {assignment, '$1', "^=", '$3'}.
assignment -> expression '&=' expression                                                        : {assignment, '$1', "&=", '$3'}.
assignment -> expression '<<=' expression                                                       : {assignment, '$1', "<<=", '$3'}.
assignment -> expression '>>=' expression                                                       : {assignment, '$1', ">>=", '$3'}.
assignment -> expression '>>>=' expression                                                      : {assignment, '$1', ">>>=", '$3'}.
assignment -> expression '+=' expression                                                        : {assignment, '$1', "+=", '$3'}.
assignment -> expression '-=' expression                                                        : {assignment, '$1', "-=", '$3'}.
assignment -> expression '*=' expression                                                        : {assignment, '$1', "*=", '$3'}.
assignment -> expression '/=' expression                                                        : {assignment, '$1', "/=", '$3'}.
assignment -> expression '%=' expression                                                        : {assignment, '$1', "%=", '$3'}.

expression -> '++'                                                                              : {expression, "++"}.
expression -> '--'                                                                              : {expression, "--"}.
expression -> function_call                                                                     : {expression, '$1'}.
expression -> index_access                                                                      : {expression, '$1'}.
expression -> member_access                                                                     : {expression, '$1'}.
expression -> '(' expression ')'                                                                : {expression, "(", '$2'}.

expression -> '++' expression                                                                   : {expression, "++", '$2'}.
expression -> '--' expression                                                                   : {expression, "--", '$2'}.
expression -> '+' expression                                                                    : {expression, "+", '$2'}.
expression -> '-' expression                                                                    : {expression, "-", '$2'}.
expression -> '!' expression                                                                    : {expression, "!", '$2'}.
expression -> '~' expression                                                                    : {expression, "~", '$2'}.

expression -> expression '**' expression                                                        : {expression, '$1', "**", '$3'}.

expression -> expression '*' expression                                                         : {expression, '$1', "*", '$3'}.
expression -> expression '/' expression                                                         : {expression, '$1', "/", '$3'}.
expression -> expression '%' expression                                                         : {expression, '$1', "%", '$3'}.

expression -> expression '+' expression                                                         : {expression, '$1', "+", '$3'}.
expression -> expression '-' expression                                                         : {expression, '$1', "-", '$3'}.

expression -> expression '<<' expression                                                        : {expression, '$1', "<<", '$3'}.
expression -> expression '>>' expression                                                        : {expression, '$1', ">>", '$3'}.
expression -> expression '>>>' expression                                                       : {expression, '$1', ">>>", '$3'}.

expression -> expression '&' expression                                                         : {expression, '$1', "&", '$3'}.

expression -> expression '^' expression                                                         : {expression, '$1', "^", '$3'}.

expression -> expression '|' expression                                                         : {expression, '$1', "|", '$3'}.

expression -> expression '<' expression                                                         : {expression, '$1', "<", '$3'}.
expression -> expression '>' expression                                                         : {expression, '$1', ">", '$3'}.
expression -> expression '<=' expression                                                        : {expression, '$1', "<=", '$3'}.
expression -> expression '>=' expression                                                        : {expression, '$1', ">=", '$3'}.

expression -> expression '==' expression                                                        : {expression, '$1', "==", '$3'}.
expression -> expression '!=' expression                                                        : {expression, '$1', "!=", '$3'}.

expression -> expression '&&' expression                                                        : {expression, '$1', "&&", '$3'}.
expression -> expression '||' expression                                                        : {expression, '$1', "||", '$3'}.

expression -> expression '?' expression ':' expression                                          : {expression, '$1', "?", '$3', '$5'}.

%% =====================================================================================================================
%% Helper definitions - reduce/reduce conflict.
%% ---------------------------------------------------------------------------------------------------------------------
% wwe expression -> expression                                                                        : {expression, '$1', ",", []}.
% wwe expression -> expression ',' expression                                                         : {expression, '$1', ",", '$3'}.
%% =====================================================================================================================

expression -> primary_expression                                                                : {expression, '$1'}.

%% =====================================================================================================================
%% Helper definitions - reduce/reduce conflict.
%% ---------------------------------------------------------------------------------------------------------------------
% wwe primary_expression -> identifier                                                                : {primaryExpression, '$1'}.
%% =====================================================================================================================
primary_expression -> boolean_literal                                                           : {primaryExpression, '$1'}.
primary_expression -> number_literal                                                            : {primaryExpression, '$1'}.
primary_expression -> string_literal                                                            : {primaryExpression, '$1'}.

%% =====================================================================================================================
%% Helper definitions - reduce/reduce conflict.
%% ---------------------------------------------------------------------------------------------------------------------
% wwe primary_expression -> function_call                                                             : {primaryExpression, '$1'}.
%% =====================================================================================================================

function_call -> identifier '(' expression_commalist_opt ')'                                    : {functionCall, '$1', '$3'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
expression_commalist_opt -> '$empty'                                                            : {}.
expression_commalist_opt -> expression_commalist                                                : '$1'.
%% =====================================================================================================================

new_expression -> NEW identifier                                                                : {newExpression, '$2'}.

member_access -> expression '.' identifier                                                      : {memberAccess, '$1', '$3'}.

index_access -> expression '['            ']'                                                   : {indexAccess, '$1', []}.
index_access -> expression '[' expression ']'                                                   : {indexAccess, '$1', '$3'}.

boolean_literal -> TRUE                                                                         : {booleanLiteral, "true"}.
boolean_literal -> FALSE                                                                        : {booleanLiteral, "false"}.

number_literal -> NUMBER_LITERAL number_unit_opt                                                : {numberLiteral, unwrap('$1'), '$2'}.

%% =====================================================================================================================
%% Helper definitions.
%% ---------------------------------------------------------------------------------------------------------------------
number_unit_opt -> '$empty'                                                                     : [].
number_unit_opt -> number_unit                                                                  : '$1'.
%% =====================================================================================================================

number_unit -> WEI                                                                              : {numberUnit, "wei"}.
number_unit -> SZABO                                                                            : {numberUnit, "szabo"}.
number_unit -> FINNEY                                                                           : {numberUnit, "finney"}.
number_unit -> ETHER                                                                            : {numberUnit, "ether"}.
number_unit -> SECONDS                                                                          : {numberUnit, "seconds"}.
number_unit -> MINUTES                                                                          : {numberUnit, "minutes"}.
number_unit -> HOURS                                                                            : {numberUnit, "hours"}.
number_unit -> DAYS                                                                             : {numberUnit, "days"}.
number_unit -> WEEKS                                                                            : {numberUnit, "weeks"}.
number_unit -> YEARS                                                                            : {numberUnit, "years"}.

string_literal -> STRING_LITERAL                                                                : {stringLiteral, unwrap('$1')}.

identifier -> IDENTIFIER                                                                        : {identifier, unwrap('$1')}.

elementary_type_name -> ADDRESS                                                                 : {elementaryTypeName, "address"}.
elementary_type_name -> BOOL                                                                    : {elementaryTypeName, "bool"}.
elementary_type_name -> STRING                                                                  : {elementaryTypeName, "string"}.

elementary_type_name -> INT                                                                     : {elementaryTypeName, "int"}.

elementary_type_name -> INT8                                                                    : {elementaryTypeName, "int8"}.
elementary_type_name -> INT16                                                                   : {elementaryTypeName, "int16"}.
elementary_type_name -> INT24                                                                   : {elementaryTypeName, "int24"}.
elementary_type_name -> INT32                                                                   : {elementaryTypeName, "int32"}.
elementary_type_name -> INT40                                                                   : {elementaryTypeName, "int40"}.
elementary_type_name -> INT48                                                                   : {elementaryTypeName, "int48"}.
elementary_type_name -> INT56                                                                   : {elementaryTypeName, "int56"}.
elementary_type_name -> INT64                                                                   : {elementaryTypeName, "int64"}.
elementary_type_name -> INT72                                                                   : {elementaryTypeName, "int72"}.
elementary_type_name -> INT80                                                                   : {elementaryTypeName, "int80"}.
elementary_type_name -> INT88                                                                   : {elementaryTypeName, "int88"}.
elementary_type_name -> INT96                                                                   : {elementaryTypeName, "int96"}.
elementary_type_name -> INT104                                                                  : {elementaryTypeName, "int104"}.
elementary_type_name -> INT112                                                                  : {elementaryTypeName, "int112"}.
elementary_type_name -> INT120                                                                  : {elementaryTypeName, "int120"}.
elementary_type_name -> INT128                                                                  : {elementaryTypeName, "int128"}.
elementary_type_name -> INT136                                                                  : {elementaryTypeName, "int136"}.
elementary_type_name -> INT144                                                                  : {elementaryTypeName, "int144"}.
elementary_type_name -> INT152                                                                  : {elementaryTypeName, "int152"}.
elementary_type_name -> INT160                                                                  : {elementaryTypeName, "int160"}.
elementary_type_name -> INT168                                                                  : {elementaryTypeName, "int168"}.
elementary_type_name -> INT176                                                                  : {elementaryTypeName, "int176"}.
elementary_type_name -> INT184                                                                  : {elementaryTypeName, "int184"}.
elementary_type_name -> INT192                                                                  : {elementaryTypeName, "int192"}.
elementary_type_name -> INT200                                                                  : {elementaryTypeName, "int200"}.
elementary_type_name -> INT208                                                                  : {elementaryTypeName, "int208"}.
elementary_type_name -> INT216                                                                  : {elementaryTypeName, "int216"}.
elementary_type_name -> INT224                                                                  : {elementaryTypeName, "int224"}.
elementary_type_name -> INT232                                                                  : {elementaryTypeName, "int232"}.
elementary_type_name -> INT240                                                                  : {elementaryTypeName, "int240"}.
elementary_type_name -> INT248                                                                  : {elementaryTypeName, "int248"}.
elementary_type_name -> INT256                                                                  : {elementaryTypeName, "int256"}.

elementary_type_name -> UINT                                                                    : {elementaryTypeName, "uint"}.

elementary_type_name -> UINT8                                                                   : {elementaryTypeName, "uint8"}.
elementary_type_name -> UINT16                                                                  : {elementaryTypeName, "uint16"}.
elementary_type_name -> UINT24                                                                  : {elementaryTypeName, "uint24"}.
elementary_type_name -> UINT32                                                                  : {elementaryTypeName, "uint32"}.
elementary_type_name -> UINT40                                                                  : {elementaryTypeName, "uint40"}.
elementary_type_name -> UINT48                                                                  : {elementaryTypeName, "uint48"}.
elementary_type_name -> UINT56                                                                  : {elementaryTypeName, "uint56"}.
elementary_type_name -> UINT64                                                                  : {elementaryTypeName, "uint64"}.
elementary_type_name -> UINT72                                                                  : {elementaryTypeName, "uint72"}.
elementary_type_name -> UINT80                                                                  : {elementaryTypeName, "uint80"}.
elementary_type_name -> UINT88                                                                  : {elementaryTypeName, "uint88"}.
elementary_type_name -> UINT96                                                                  : {elementaryTypeName, "uint96"}.
elementary_type_name -> UINT104                                                                 : {elementaryTypeName, "uint104"}.
elementary_type_name -> UINT112                                                                 : {elementaryTypeName, "uint112"}.
elementary_type_name -> UINT120                                                                 : {elementaryTypeName, "uint120"}.
elementary_type_name -> UINT128                                                                 : {elementaryTypeName, "uint128"}.
elementary_type_name -> UINT136                                                                 : {elementaryTypeName, "uint136"}.
elementary_type_name -> UINT144                                                                 : {elementaryTypeName, "uint144"}.
elementary_type_name -> UINT152                                                                 : {elementaryTypeName, "uint152"}.
elementary_type_name -> UINT160                                                                 : {elementaryTypeName, "uint160"}.
elementary_type_name -> UINT168                                                                 : {elementaryTypeName, "uint168"}.
elementary_type_name -> UINT176                                                                 : {elementaryTypeName, "uint176"}.
elementary_type_name -> UINT184                                                                 : {elementaryTypeName, "uint184"}.
elementary_type_name -> UINT192                                                                 : {elementaryTypeName, "uint192"}.
elementary_type_name -> UINT200                                                                 : {elementaryTypeName, "uint200"}.
elementary_type_name -> UINT208                                                                 : {elementaryTypeName, "uint208"}.
elementary_type_name -> UINT216                                                                 : {elementaryTypeName, "uint216"}.
elementary_type_name -> UINT224                                                                 : {elementaryTypeName, "uint224"}.
elementary_type_name -> UINT232                                                                 : {elementaryTypeName, "uint232"}.
elementary_type_name -> UINT240                                                                 : {elementaryTypeName, "uint240"}.
elementary_type_name -> UINT248                                                                 : {elementaryTypeName, "uint248"}.
elementary_type_name -> UINT256                                                                 : {elementaryTypeName, "uint256"}.

elementary_type_name -> BYTE                                                                    : {elementaryTypeName, "byte"}.
elementary_type_name -> BYTES                                                                   : {elementaryTypeName, "bytes"}.

elementary_type_name -> BYTES1                                                                  : {elementaryTypeName, "bytes1"}.
elementary_type_name -> BYTES2                                                                  : {elementaryTypeName, "bytes2"}.
elementary_type_name -> BYTES3                                                                  : {elementaryTypeName, "bytes3"}.
elementary_type_name -> BYTES4                                                                  : {elementaryTypeName, "bytes4"}.
elementary_type_name -> BYTES5                                                                  : {elementaryTypeName, "bytes5"}.
elementary_type_name -> BYTES6                                                                  : {elementaryTypeName, "bytes6"}.
elementary_type_name -> BYTES7                                                                  : {elementaryTypeName, "bytes7"}.
elementary_type_name -> BYTES8                                                                  : {elementaryTypeName, "bytes8"}.
elementary_type_name -> BYTES9                                                                  : {elementaryTypeName, "bytes9"}.
elementary_type_name -> BYTES10                                                                 : {elementaryTypeName, "bytes10"}.
elementary_type_name -> BYTES11                                                                 : {elementaryTypeName, "bytes11"}.
elementary_type_name -> BYTES12                                                                 : {elementaryTypeName, "bytes12"}.
elementary_type_name -> BYTES13                                                                 : {elementaryTypeName, "bytes13"}.
elementary_type_name -> BYTES14                                                                 : {elementaryTypeName, "bytes14"}.
elementary_type_name -> BYTES15                                                                 : {elementaryTypeName, "bytes15"}.
elementary_type_name -> BYTES16                                                                 : {elementaryTypeName, "bytes16"}.
elementary_type_name -> BYTES17                                                                 : {elementaryTypeName, "bytes17"}.
elementary_type_name -> BYTES18                                                                 : {elementaryTypeName, "bytes18"}.
elementary_type_name -> BYTES19                                                                 : {elementaryTypeName, "bytes19"}.
elementary_type_name -> BYTES20                                                                 : {elementaryTypeName, "bytes10"}.
elementary_type_name -> BYTES21                                                                 : {elementaryTypeName, "bytes21"}.
elementary_type_name -> BYTES22                                                                 : {elementaryTypeName, "bytes22"}.
elementary_type_name -> BYTES23                                                                 : {elementaryTypeName, "bytes23"}.
elementary_type_name -> BYTES24                                                                 : {elementaryTypeName, "bytes24"}.
elementary_type_name -> BYTES25                                                                 : {elementaryTypeName, "bytes25"}.
elementary_type_name -> BYTES26                                                                 : {elementaryTypeName, "bytes26"}.
elementary_type_name -> BYTES27                                                                 : {elementaryTypeName, "bytes27"}.
elementary_type_name -> BYTES28                                                                 : {elementaryTypeName, "bytes28"}.
elementary_type_name -> BYTES29                                                                 : {elementaryTypeName, "bytes29"}.
elementary_type_name -> BYTES30                                                                 : {elementaryTypeName, "bytes10"}.
elementary_type_name -> BYTES31                                                                 : {elementaryTypeName, "bytes31"}.
elementary_type_name -> BYTES32                                                                 : {elementaryTypeName, "bytes32"}.

elementary_type_name -> FIXED                                                                   : {elementaryTypeName, "fixed"}.

elementary_type_name -> FIXED0X8                                                                : {elementaryTypeName, "fixed0x8"}.
elementary_type_name -> FIXED0X16                                                               : {elementaryTypeName, "fixed0x16"}.
elementary_type_name -> FIXED0X24                                                               : {elementaryTypeName, "fixed0x24"}.
elementary_type_name -> FIXED0X32                                                               : {elementaryTypeName, "fixed0x32"}.
elementary_type_name -> FIXED0X40                                                               : {elementaryTypeName, "fixed0x40"}.
elementary_type_name -> FIXED0X48                                                               : {elementaryTypeName, "fixed0x48"}.
elementary_type_name -> FIXED0X56                                                               : {elementaryTypeName, "fixed0x56"}.
elementary_type_name -> FIXED0X64                                                               : {elementaryTypeName, "fixed0x64"}.
elementary_type_name -> FIXED0X72                                                               : {elementaryTypeName, "fixed0x72"}.
elementary_type_name -> FIXED0X80                                                               : {elementaryTypeName, "fixed0x80"}.
elementary_type_name -> FIXED0X88                                                               : {elementaryTypeName, "fixed0x88"}.
elementary_type_name -> FIXED0X96                                                               : {elementaryTypeName, "fixed0x96"}.
elementary_type_name -> FIXED0X104                                                              : {elementaryTypeName, "fixed0x104"}.
elementary_type_name -> FIXED0X112                                                              : {elementaryTypeName, "fixed0x112"}.
elementary_type_name -> FIXED0X120                                                              : {elementaryTypeName, "fixed0x120"}.
elementary_type_name -> FIXED0X128                                                              : {elementaryTypeName, "fixed0x128"}.
elementary_type_name -> FIXED0X136                                                              : {elementaryTypeName, "fixed0x136"}.
elementary_type_name -> FIXED0X144                                                              : {elementaryTypeName, "fixed0x144"}.
elementary_type_name -> FIXED0X152                                                              : {elementaryTypeName, "fixed0x152"}.
elementary_type_name -> FIXED0X160                                                              : {elementaryTypeName, "fixed0x160"}.
elementary_type_name -> FIXED0X168                                                              : {elementaryTypeName, "fixed0x168"}.
elementary_type_name -> FIXED0X176                                                              : {elementaryTypeName, "fixed0x176"}.
elementary_type_name -> FIXED0X184                                                              : {elementaryTypeName, "fixed0x184"}.
elementary_type_name -> FIXED0X192                                                              : {elementaryTypeName, "fixed0x192"}.
elementary_type_name -> FIXED0X200                                                              : {elementaryTypeName, "fixed0x200"}.
elementary_type_name -> FIXED0X208                                                              : {elementaryTypeName, "fixed0x208"}.
elementary_type_name -> FIXED0X216                                                              : {elementaryTypeName, "fixed0x216"}.
elementary_type_name -> FIXED0X224                                                              : {elementaryTypeName, "fixed0x224"}.
elementary_type_name -> FIXED0X232                                                              : {elementaryTypeName, "fixed0x232"}.
elementary_type_name -> FIXED0X240                                                              : {elementaryTypeName, "fixed0x240"}.
elementary_type_name -> FIXED0X248                                                              : {elementaryTypeName, "fixed0x248"}.
elementary_type_name -> FIXED0X256                                                              : {elementaryTypeName, "fixed0x256"}.

elementary_type_name -> FIXED8X8                                                                : {elementaryTypeName, "fixed8x8"}.
elementary_type_name -> FIXED8X16                                                               : {elementaryTypeName, "fixed8x16"}.
elementary_type_name -> FIXED8X24                                                               : {elementaryTypeName, "fixed8x24"}.
elementary_type_name -> FIXED8X32                                                               : {elementaryTypeName, "fixed8x32"}.
elementary_type_name -> FIXED8X40                                                               : {elementaryTypeName, "fixed8x40"}.
elementary_type_name -> FIXED8X48                                                               : {elementaryTypeName, "fixed8x48"}.
elementary_type_name -> FIXED8X56                                                               : {elementaryTypeName, "fixed8x56"}.
elementary_type_name -> FIXED8X64                                                               : {elementaryTypeName, "fixed8x64"}.
elementary_type_name -> FIXED8X72                                                               : {elementaryTypeName, "fixed8x72"}.
elementary_type_name -> FIXED8X80                                                               : {elementaryTypeName, "fixed8x80"}.
elementary_type_name -> FIXED8X88                                                               : {elementaryTypeName, "fixed8x88"}.
elementary_type_name -> FIXED8X96                                                               : {elementaryTypeName, "fixed8x96"}.
elementary_type_name -> FIXED8X104                                                              : {elementaryTypeName, "fixed8x104"}.
elementary_type_name -> FIXED8X112                                                              : {elementaryTypeName, "fixed8x112"}.
elementary_type_name -> FIXED8X120                                                              : {elementaryTypeName, "fixed8x120"}.
elementary_type_name -> FIXED8X128                                                              : {elementaryTypeName, "fixed8x128"}.
elementary_type_name -> FIXED8X136                                                              : {elementaryTypeName, "fixed8x136"}.
elementary_type_name -> FIXED8X144                                                              : {elementaryTypeName, "fixed8x144"}.
elementary_type_name -> FIXED8X152                                                              : {elementaryTypeName, "fixed8x152"}.
elementary_type_name -> FIXED8X160                                                              : {elementaryTypeName, "fixed8x160"}.
elementary_type_name -> FIXED8X168                                                              : {elementaryTypeName, "fixed8x168"}.
elementary_type_name -> FIXED8X176                                                              : {elementaryTypeName, "fixed8x176"}.
elementary_type_name -> FIXED8X184                                                              : {elementaryTypeName, "fixed8x184"}.
elementary_type_name -> FIXED8X192                                                              : {elementaryTypeName, "fixed8x192"}.
elementary_type_name -> FIXED8X200                                                              : {elementaryTypeName, "fixed8x200"}.
elementary_type_name -> FIXED8X208                                                              : {elementaryTypeName, "fixed8x208"}.
elementary_type_name -> FIXED8X216                                                              : {elementaryTypeName, "fixed8x216"}.
elementary_type_name -> FIXED8X224                                                              : {elementaryTypeName, "fixed8x224"}.
elementary_type_name -> FIXED8X232                                                              : {elementaryTypeName, "fixed8x232"}.
elementary_type_name -> FIXED8X240                                                              : {elementaryTypeName, "fixed8x240"}.
elementary_type_name -> FIXED8X248                                                              : {elementaryTypeName, "fixed8x248"}.

elementary_type_name -> FIXED16X8                                                               : {elementaryTypeName, "fixed16x8"}.
elementary_type_name -> FIXED16X16                                                              : {elementaryTypeName, "fixed16x16"}.
elementary_type_name -> FIXED16X24                                                              : {elementaryTypeName, "fixed16x24"}.
elementary_type_name -> FIXED16X32                                                              : {elementaryTypeName, "fixed16x32"}.
elementary_type_name -> FIXED16X40                                                              : {elementaryTypeName, "fixed16x40"}.
elementary_type_name -> FIXED16X48                                                              : {elementaryTypeName, "fixed16x48"}.
elementary_type_name -> FIXED16X56                                                              : {elementaryTypeName, "fixed16x56"}.
elementary_type_name -> FIXED16X64                                                              : {elementaryTypeName, "fixed16x64"}.
elementary_type_name -> FIXED16X72                                                              : {elementaryTypeName, "fixed16x72"}.
elementary_type_name -> FIXED16X80                                                              : {elementaryTypeName, "fixed16x80"}.
elementary_type_name -> FIXED16X88                                                              : {elementaryTypeName, "fixed16x88"}.
elementary_type_name -> FIXED16X96                                                              : {elementaryTypeName, "fixed16x96"}.
elementary_type_name -> FIXED16X104                                                             : {elementaryTypeName, "fixed16x104"}.
elementary_type_name -> FIXED16X112                                                             : {elementaryTypeName, "fixed16x112"}.
elementary_type_name -> FIXED16X120                                                             : {elementaryTypeName, "fixed16x120"}.
elementary_type_name -> FIXED16X128                                                             : {elementaryTypeName, "fixed16x128"}.
elementary_type_name -> FIXED16X136                                                             : {elementaryTypeName, "fixed16x136"}.
elementary_type_name -> FIXED16X144                                                             : {elementaryTypeName, "fixed16x144"}.
elementary_type_name -> FIXED16X152                                                             : {elementaryTypeName, "fixed16x152"}.
elementary_type_name -> FIXED16X160                                                             : {elementaryTypeName, "fixed16x160"}.
elementary_type_name -> FIXED16X168                                                             : {elementaryTypeName, "fixed16x168"}.
elementary_type_name -> FIXED16X176                                                             : {elementaryTypeName, "fixed16x176"}.
elementary_type_name -> FIXED16X184                                                             : {elementaryTypeName, "fixed16x184"}.
elementary_type_name -> FIXED16X192                                                             : {elementaryTypeName, "fixed16x192"}.
elementary_type_name -> FIXED16X200                                                             : {elementaryTypeName, "fixed16x200"}.
elementary_type_name -> FIXED16X208                                                             : {elementaryTypeName, "fixed16x208"}.
elementary_type_name -> FIXED16X216                                                             : {elementaryTypeName, "fixed16x216"}.
elementary_type_name -> FIXED16X224                                                             : {elementaryTypeName, "fixed16x224"}.
elementary_type_name -> FIXED16X232                                                             : {elementaryTypeName, "fixed16x232"}.
elementary_type_name -> FIXED16X240                                                             : {elementaryTypeName, "fixed16x240"}.

elementary_type_name -> FIXED24X8                                                               : {elementaryTypeName, "fixed24x8"}.
elementary_type_name -> FIXED24X16                                                              : {elementaryTypeName, "fixed24x16"}.
elementary_type_name -> FIXED24X24                                                              : {elementaryTypeName, "fixed24x24"}.
elementary_type_name -> FIXED24X32                                                              : {elementaryTypeName, "fixed24x32"}.
elementary_type_name -> FIXED24X40                                                              : {elementaryTypeName, "fixed24x40"}.
elementary_type_name -> FIXED24X48                                                              : {elementaryTypeName, "fixed24x48"}.
elementary_type_name -> FIXED24X56                                                              : {elementaryTypeName, "fixed24x56"}.
elementary_type_name -> FIXED24X64                                                              : {elementaryTypeName, "fixed24x64"}.
elementary_type_name -> FIXED24X72                                                              : {elementaryTypeName, "fixed24x72"}.
elementary_type_name -> FIXED24X80                                                              : {elementaryTypeName, "fixed24x80"}.
elementary_type_name -> FIXED24X88                                                              : {elementaryTypeName, "fixed24x88"}.
elementary_type_name -> FIXED24X96                                                              : {elementaryTypeName, "fixed24x96"}.
elementary_type_name -> FIXED24X104                                                             : {elementaryTypeName, "fixed24x104"}.
elementary_type_name -> FIXED24X112                                                             : {elementaryTypeName, "fixed24x112"}.
elementary_type_name -> FIXED24X120                                                             : {elementaryTypeName, "fixed24x120"}.
elementary_type_name -> FIXED24X128                                                             : {elementaryTypeName, "fixed24x128"}.
elementary_type_name -> FIXED24X136                                                             : {elementaryTypeName, "fixed24x136"}.
elementary_type_name -> FIXED24X144                                                             : {elementaryTypeName, "fixed24x144"}.
elementary_type_name -> FIXED24X152                                                             : {elementaryTypeName, "fixed24x152"}.
elementary_type_name -> FIXED24X160                                                             : {elementaryTypeName, "fixed24x160"}.
elementary_type_name -> FIXED24X168                                                             : {elementaryTypeName, "fixed24x168"}.
elementary_type_name -> FIXED24X176                                                             : {elementaryTypeName, "fixed24x176"}.
elementary_type_name -> FIXED24X184                                                             : {elementaryTypeName, "fixed24x184"}.
elementary_type_name -> FIXED24X192                                                             : {elementaryTypeName, "fixed24x192"}.
elementary_type_name -> FIXED24X200                                                             : {elementaryTypeName, "fixed24x200"}.
elementary_type_name -> FIXED24X208                                                             : {elementaryTypeName, "fixed24x208"}.
elementary_type_name -> FIXED24X216                                                             : {elementaryTypeName, "fixed24x216"}.
elementary_type_name -> FIXED24X224                                                             : {elementaryTypeName, "fixed24x224"}.
elementary_type_name -> FIXED24X232                                                             : {elementaryTypeName, "fixed24x232"}.

elementary_type_name -> FIXED32X8                                                               : {elementaryTypeName, "fixed32x8"}.
elementary_type_name -> FIXED32X16                                                              : {elementaryTypeName, "fixed32x16"}.
elementary_type_name -> FIXED32X24                                                              : {elementaryTypeName, "fixed32x24"}.
elementary_type_name -> FIXED32X32                                                              : {elementaryTypeName, "fixed32x32"}.
elementary_type_name -> FIXED32X40                                                              : {elementaryTypeName, "fixed32x40"}.
elementary_type_name -> FIXED32X48                                                              : {elementaryTypeName, "fixed32x48"}.
elementary_type_name -> FIXED32X56                                                              : {elementaryTypeName, "fixed32x56"}.
elementary_type_name -> FIXED32X64                                                              : {elementaryTypeName, "fixed32x64"}.
elementary_type_name -> FIXED32X72                                                              : {elementaryTypeName, "fixed32x72"}.
elementary_type_name -> FIXED32X80                                                              : {elementaryTypeName, "fixed32x80"}.
elementary_type_name -> FIXED32X88                                                              : {elementaryTypeName, "fixed32x88"}.
elementary_type_name -> FIXED32X96                                                              : {elementaryTypeName, "fixed32x96"}.
elementary_type_name -> FIXED32X104                                                             : {elementaryTypeName, "fixed32x104"}.
elementary_type_name -> FIXED32X112                                                             : {elementaryTypeName, "fixed32x112"}.
elementary_type_name -> FIXED32X120                                                             : {elementaryTypeName, "fixed32x120"}.
elementary_type_name -> FIXED32X128                                                             : {elementaryTypeName, "fixed32x128"}.
elementary_type_name -> FIXED32X136                                                             : {elementaryTypeName, "fixed32x136"}.
elementary_type_name -> FIXED32X144                                                             : {elementaryTypeName, "fixed32x144"}.
elementary_type_name -> FIXED32X152                                                             : {elementaryTypeName, "fixed32x152"}.
elementary_type_name -> FIXED32X160                                                             : {elementaryTypeName, "fixed32x160"}.
elementary_type_name -> FIXED32X168                                                             : {elementaryTypeName, "fixed32x168"}.
elementary_type_name -> FIXED32X176                                                             : {elementaryTypeName, "fixed32x176"}.
elementary_type_name -> FIXED32X184                                                             : {elementaryTypeName, "fixed32x184"}.
elementary_type_name -> FIXED32X192                                                             : {elementaryTypeName, "fixed32x192"}.
elementary_type_name -> FIXED32X200                                                             : {elementaryTypeName, "fixed32x200"}.
elementary_type_name -> FIXED32X208                                                             : {elementaryTypeName, "fixed32x208"}.
elementary_type_name -> FIXED32X216                                                             : {elementaryTypeName, "fixed32x216"}.
elementary_type_name -> FIXED32X224                                                             : {elementaryTypeName, "fixed32x224"}.

elementary_type_name -> FIXED40X8                                                               : {elementaryTypeName, "fixed40x8"}.
elementary_type_name -> FIXED40X16                                                              : {elementaryTypeName, "fixed40x16"}.
elementary_type_name -> FIXED40X24                                                              : {elementaryTypeName, "fixed40x24"}.
elementary_type_name -> FIXED40X32                                                              : {elementaryTypeName, "fixed40x32"}.
elementary_type_name -> FIXED40X40                                                              : {elementaryTypeName, "fixed40x40"}.
elementary_type_name -> FIXED40X48                                                              : {elementaryTypeName, "fixed40x48"}.
elementary_type_name -> FIXED40X56                                                              : {elementaryTypeName, "fixed40x56"}.
elementary_type_name -> FIXED40X64                                                              : {elementaryTypeName, "fixed40x64"}.
elementary_type_name -> FIXED40X72                                                              : {elementaryTypeName, "fixed40x72"}.
elementary_type_name -> FIXED40X80                                                              : {elementaryTypeName, "fixed40x80"}.
elementary_type_name -> FIXED40X88                                                              : {elementaryTypeName, "fixed40x88"}.
elementary_type_name -> FIXED40X96                                                              : {elementaryTypeName, "fixed40x96"}.
elementary_type_name -> FIXED40X104                                                             : {elementaryTypeName, "fixed40x104"}.
elementary_type_name -> FIXED40X112                                                             : {elementaryTypeName, "fixed40x112"}.
elementary_type_name -> FIXED40X120                                                             : {elementaryTypeName, "fixed40x120"}.
elementary_type_name -> FIXED40X128                                                             : {elementaryTypeName, "fixed40x128"}.
elementary_type_name -> FIXED40X136                                                             : {elementaryTypeName, "fixed40x136"}.
elementary_type_name -> FIXED40X144                                                             : {elementaryTypeName, "fixed40x144"}.
elementary_type_name -> FIXED40X152                                                             : {elementaryTypeName, "fixed40x152"}.
elementary_type_name -> FIXED40X160                                                             : {elementaryTypeName, "fixed40x160"}.
elementary_type_name -> FIXED40X168                                                             : {elementaryTypeName, "fixed40x168"}.
elementary_type_name -> FIXED40X176                                                             : {elementaryTypeName, "fixed40x176"}.
elementary_type_name -> FIXED40X184                                                             : {elementaryTypeName, "fixed40x184"}.
elementary_type_name -> FIXED40X192                                                             : {elementaryTypeName, "fixed40x192"}.
elementary_type_name -> FIXED40X200                                                             : {elementaryTypeName, "fixed40x200"}.
elementary_type_name -> FIXED40X208                                                             : {elementaryTypeName, "fixed40x208"}.
elementary_type_name -> FIXED40X216                                                             : {elementaryTypeName, "fixed40x216"}.

elementary_type_name -> FIXED48X8                                                               : {elementaryTypeName, "fixed48x8"}.
elementary_type_name -> FIXED48X16                                                              : {elementaryTypeName, "fixed48x16"}.
elementary_type_name -> FIXED48X24                                                              : {elementaryTypeName, "fixed48x24"}.
elementary_type_name -> FIXED48X32                                                              : {elementaryTypeName, "fixed48x32"}.
elementary_type_name -> FIXED48X40                                                              : {elementaryTypeName, "fixed48x40"}.
elementary_type_name -> FIXED48X48                                                              : {elementaryTypeName, "fixed48x48"}.
elementary_type_name -> FIXED48X56                                                              : {elementaryTypeName, "fixed48x56"}.
elementary_type_name -> FIXED48X64                                                              : {elementaryTypeName, "fixed48x64"}.
elementary_type_name -> FIXED48X72                                                              : {elementaryTypeName, "fixed48x72"}.
elementary_type_name -> FIXED48X80                                                              : {elementaryTypeName, "fixed48x80"}.
elementary_type_name -> FIXED48X88                                                              : {elementaryTypeName, "fixed48x88"}.
elementary_type_name -> FIXED48X96                                                              : {elementaryTypeName, "fixed48x96"}.
elementary_type_name -> FIXED48X104                                                             : {elementaryTypeName, "fixed48x104"}.
elementary_type_name -> FIXED48X112                                                             : {elementaryTypeName, "fixed48x112"}.
elementary_type_name -> FIXED48X120                                                             : {elementaryTypeName, "fixed48x120"}.
elementary_type_name -> FIXED48X128                                                             : {elementaryTypeName, "fixed48x128"}.
elementary_type_name -> FIXED48X136                                                             : {elementaryTypeName, "fixed48x136"}.
elementary_type_name -> FIXED48X144                                                             : {elementaryTypeName, "fixed48x144"}.
elementary_type_name -> FIXED48X152                                                             : {elementaryTypeName, "fixed48x152"}.
elementary_type_name -> FIXED48X160                                                             : {elementaryTypeName, "fixed48x160"}.
elementary_type_name -> FIXED48X168                                                             : {elementaryTypeName, "fixed48x168"}.
elementary_type_name -> FIXED48X176                                                             : {elementaryTypeName, "fixed48x176"}.
elementary_type_name -> FIXED48X184                                                             : {elementaryTypeName, "fixed48x184"}.
elementary_type_name -> FIXED48X192                                                             : {elementaryTypeName, "fixed48x192"}.
elementary_type_name -> FIXED48X200                                                             : {elementaryTypeName, "fixed48x200"}.
elementary_type_name -> FIXED48X208                                                             : {elementaryTypeName, "fixed48x208"}.

elementary_type_name -> FIXED56X8                                                               : {elementaryTypeName, "fixed56x8"}.
elementary_type_name -> FIXED56X16                                                              : {elementaryTypeName, "fixed56x16"}.
elementary_type_name -> FIXED56X24                                                              : {elementaryTypeName, "fixed56x24"}.
elementary_type_name -> FIXED56X32                                                              : {elementaryTypeName, "fixed56x32"}.
elementary_type_name -> FIXED56X40                                                              : {elementaryTypeName, "fixed56x40"}.
elementary_type_name -> FIXED56X48                                                              : {elementaryTypeName, "fixed56x48"}.
elementary_type_name -> FIXED56X56                                                              : {elementaryTypeName, "fixed56x56"}.
elementary_type_name -> FIXED56X64                                                              : {elementaryTypeName, "fixed56x64"}.
elementary_type_name -> FIXED56X72                                                              : {elementaryTypeName, "fixed56x72"}.
elementary_type_name -> FIXED56X80                                                              : {elementaryTypeName, "fixed56x80"}.
elementary_type_name -> FIXED56X88                                                              : {elementaryTypeName, "fixed56x88"}.
elementary_type_name -> FIXED56X96                                                              : {elementaryTypeName, "fixed56x96"}.
elementary_type_name -> FIXED56X104                                                             : {elementaryTypeName, "fixed56x104"}.
elementary_type_name -> FIXED56X112                                                             : {elementaryTypeName, "fixed56x112"}.
elementary_type_name -> FIXED56X120                                                             : {elementaryTypeName, "fixed56x120"}.
elementary_type_name -> FIXED56X128                                                             : {elementaryTypeName, "fixed56x128"}.
elementary_type_name -> FIXED56X136                                                             : {elementaryTypeName, "fixed56x136"}.
elementary_type_name -> FIXED56X144                                                             : {elementaryTypeName, "fixed56x144"}.
elementary_type_name -> FIXED56X152                                                             : {elementaryTypeName, "fixed56x152"}.
elementary_type_name -> FIXED56X160                                                             : {elementaryTypeName, "fixed56x160"}.
elementary_type_name -> FIXED56X168                                                             : {elementaryTypeName, "fixed56x168"}.
elementary_type_name -> FIXED56X176                                                             : {elementaryTypeName, "fixed56x176"}.
elementary_type_name -> FIXED56X184                                                             : {elementaryTypeName, "fixed56x184"}.
elementary_type_name -> FIXED56X192                                                             : {elementaryTypeName, "fixed56x192"}.
elementary_type_name -> FIXED56X200                                                             : {elementaryTypeName, "fixed56x200"}.

elementary_type_name -> FIXED64X8                                                               : {elementaryTypeName, "fixed64x8"}.
elementary_type_name -> FIXED64X16                                                              : {elementaryTypeName, "fixed64x16"}.
elementary_type_name -> FIXED64X24                                                              : {elementaryTypeName, "fixed64x24"}.
elementary_type_name -> FIXED64X32                                                              : {elementaryTypeName, "fixed64x32"}.
elementary_type_name -> FIXED64X40                                                              : {elementaryTypeName, "fixed64x40"}.
elementary_type_name -> FIXED64X48                                                              : {elementaryTypeName, "fixed64x48"}.
elementary_type_name -> FIXED64X56                                                              : {elementaryTypeName, "fixed64x56"}.
elementary_type_name -> FIXED64X64                                                              : {elementaryTypeName, "fixed64x64"}.
elementary_type_name -> FIXED64X72                                                              : {elementaryTypeName, "fixed64x72"}.
elementary_type_name -> FIXED64X80                                                              : {elementaryTypeName, "fixed64x80"}.
elementary_type_name -> FIXED64X88                                                              : {elementaryTypeName, "fixed64x88"}.
elementary_type_name -> FIXED64X96                                                              : {elementaryTypeName, "fixed64x96"}.
elementary_type_name -> FIXED64X104                                                             : {elementaryTypeName, "fixed64x104"}.
elementary_type_name -> FIXED64X112                                                             : {elementaryTypeName, "fixed64x112"}.
elementary_type_name -> FIXED64X120                                                             : {elementaryTypeName, "fixed64x120"}.
elementary_type_name -> FIXED64X128                                                             : {elementaryTypeName, "fixed64x128"}.
elementary_type_name -> FIXED64X136                                                             : {elementaryTypeName, "fixed64x136"}.
elementary_type_name -> FIXED64X144                                                             : {elementaryTypeName, "fixed64x144"}.
elementary_type_name -> FIXED64X152                                                             : {elementaryTypeName, "fixed64x152"}.
elementary_type_name -> FIXED64X160                                                             : {elementaryTypeName, "fixed64x160"}.
elementary_type_name -> FIXED64X168                                                             : {elementaryTypeName, "fixed64x168"}.
elementary_type_name -> FIXED64X176                                                             : {elementaryTypeName, "fixed64x176"}.
elementary_type_name -> FIXED64X184                                                             : {elementaryTypeName, "fixed64x184"}.
elementary_type_name -> FIXED64X192                                                             : {elementaryTypeName, "fixed64x192"}.

elementary_type_name -> FIXED72X8                                                               : {elementaryTypeName, "fixed72x8"}.
elementary_type_name -> FIXED72X16                                                              : {elementaryTypeName, "fixed72x16"}.
elementary_type_name -> FIXED72X24                                                              : {elementaryTypeName, "fixed72x24"}.
elementary_type_name -> FIXED72X32                                                              : {elementaryTypeName, "fixed72x32"}.
elementary_type_name -> FIXED72X40                                                              : {elementaryTypeName, "fixed72x40"}.
elementary_type_name -> FIXED72X48                                                              : {elementaryTypeName, "fixed72x48"}.
elementary_type_name -> FIXED72X56                                                              : {elementaryTypeName, "fixed72x56"}.
elementary_type_name -> FIXED72X64                                                              : {elementaryTypeName, "fixed72x64"}.
elementary_type_name -> FIXED72X72                                                              : {elementaryTypeName, "fixed72x72"}.
elementary_type_name -> FIXED72X80                                                              : {elementaryTypeName, "fixed72x80"}.
elementary_type_name -> FIXED72X88                                                              : {elementaryTypeName, "fixed72x88"}.
elementary_type_name -> FIXED72X96                                                              : {elementaryTypeName, "fixed72x96"}.
elementary_type_name -> FIXED72X104                                                             : {elementaryTypeName, "fixed72x104"}.
elementary_type_name -> FIXED72X112                                                             : {elementaryTypeName, "fixed72x112"}.
elementary_type_name -> FIXED72X120                                                             : {elementaryTypeName, "fixed72x120"}.
elementary_type_name -> FIXED72X128                                                             : {elementaryTypeName, "fixed72x128"}.
elementary_type_name -> FIXED72X136                                                             : {elementaryTypeName, "fixed72x136"}.
elementary_type_name -> FIXED72X144                                                             : {elementaryTypeName, "fixed72x144"}.
elementary_type_name -> FIXED72X152                                                             : {elementaryTypeName, "fixed72x152"}.
elementary_type_name -> FIXED72X160                                                             : {elementaryTypeName, "fixed72x160"}.
elementary_type_name -> FIXED72X168                                                             : {elementaryTypeName, "fixed72x168"}.
elementary_type_name -> FIXED72X176                                                             : {elementaryTypeName, "fixed72x176"}.
elementary_type_name -> FIXED72X184                                                             : {elementaryTypeName, "fixed72x184"}.

elementary_type_name -> FIXED80X8                                                               : {elementaryTypeName, "fixed80x8"}.
elementary_type_name -> FIXED80X16                                                              : {elementaryTypeName, "fixed80x16"}.
elementary_type_name -> FIXED80X24                                                              : {elementaryTypeName, "fixed80x24"}.
elementary_type_name -> FIXED80X32                                                              : {elementaryTypeName, "fixed80x32"}.
elementary_type_name -> FIXED80X40                                                              : {elementaryTypeName, "fixed80x40"}.
elementary_type_name -> FIXED80X48                                                              : {elementaryTypeName, "fixed80x48"}.
elementary_type_name -> FIXED80X56                                                              : {elementaryTypeName, "fixed80x56"}.
elementary_type_name -> FIXED80X64                                                              : {elementaryTypeName, "fixed80x64"}.
elementary_type_name -> FIXED80X72                                                              : {elementaryTypeName, "fixed80x72"}.
elementary_type_name -> FIXED80X80                                                              : {elementaryTypeName, "fixed80x80"}.
elementary_type_name -> FIXED80X88                                                              : {elementaryTypeName, "fixed80x88"}.
elementary_type_name -> FIXED80X96                                                              : {elementaryTypeName, "fixed80x96"}.
elementary_type_name -> FIXED80X104                                                             : {elementaryTypeName, "fixed80x104"}.
elementary_type_name -> FIXED80X112                                                             : {elementaryTypeName, "fixed80x112"}.
elementary_type_name -> FIXED80X120                                                             : {elementaryTypeName, "fixed80x120"}.
elementary_type_name -> FIXED80X128                                                             : {elementaryTypeName, "fixed80x128"}.
elementary_type_name -> FIXED80X136                                                             : {elementaryTypeName, "fixed80x136"}.
elementary_type_name -> FIXED80X144                                                             : {elementaryTypeName, "fixed80x144"}.
elementary_type_name -> FIXED80X152                                                             : {elementaryTypeName, "fixed80x152"}.
elementary_type_name -> FIXED80X160                                                             : {elementaryTypeName, "fixed80x160"}.
elementary_type_name -> FIXED80X168                                                             : {elementaryTypeName, "fixed80x168"}.
elementary_type_name -> FIXED80X176                                                             : {elementaryTypeName, "fixed80x176"}.

elementary_type_name -> FIXED88X8                                                               : {elementaryTypeName, "fixed88x8"}.
elementary_type_name -> FIXED88X16                                                              : {elementaryTypeName, "fixed88x16"}.
elementary_type_name -> FIXED88X24                                                              : {elementaryTypeName, "fixed88x24"}.
elementary_type_name -> FIXED88X32                                                              : {elementaryTypeName, "fixed88x32"}.
elementary_type_name -> FIXED88X40                                                              : {elementaryTypeName, "fixed88x40"}.
elementary_type_name -> FIXED88X48                                                              : {elementaryTypeName, "fixed88x48"}.
elementary_type_name -> FIXED88X56                                                              : {elementaryTypeName, "fixed88x56"}.
elementary_type_name -> FIXED88X64                                                              : {elementaryTypeName, "fixed88x64"}.
elementary_type_name -> FIXED88X72                                                              : {elementaryTypeName, "fixed88x72"}.
elementary_type_name -> FIXED88X80                                                              : {elementaryTypeName, "fixed88x80"}.
elementary_type_name -> FIXED88X88                                                              : {elementaryTypeName, "fixed88x88"}.
elementary_type_name -> FIXED88X96                                                              : {elementaryTypeName, "fixed88x96"}.
elementary_type_name -> FIXED88X104                                                             : {elementaryTypeName, "fixed88x104"}.
elementary_type_name -> FIXED88X112                                                             : {elementaryTypeName, "fixed88x112"}.
elementary_type_name -> FIXED88X120                                                             : {elementaryTypeName, "fixed88x120"}.
elementary_type_name -> FIXED88X128                                                             : {elementaryTypeName, "fixed88x128"}.
elementary_type_name -> FIXED88X136                                                             : {elementaryTypeName, "fixed88x136"}.
elementary_type_name -> FIXED88X144                                                             : {elementaryTypeName, "fixed88x144"}.
elementary_type_name -> FIXED88X152                                                             : {elementaryTypeName, "fixed88x152"}.
elementary_type_name -> FIXED88X160                                                             : {elementaryTypeName, "fixed88x160"}.
elementary_type_name -> FIXED88X168                                                             : {elementaryTypeName, "fixed88x168"}.

elementary_type_name -> FIXED96X8                                                               : {elementaryTypeName, "fixed96x8"}.
elementary_type_name -> FIXED96X16                                                              : {elementaryTypeName, "fixed96x16"}.
elementary_type_name -> FIXED96X24                                                              : {elementaryTypeName, "fixed96x24"}.
elementary_type_name -> FIXED96X32                                                              : {elementaryTypeName, "fixed96x32"}.
elementary_type_name -> FIXED96X40                                                              : {elementaryTypeName, "fixed96x40"}.
elementary_type_name -> FIXED96X48                                                              : {elementaryTypeName, "fixed96x48"}.
elementary_type_name -> FIXED96X56                                                              : {elementaryTypeName, "fixed96x56"}.
elementary_type_name -> FIXED96X64                                                              : {elementaryTypeName, "fixed96x64"}.
elementary_type_name -> FIXED96X72                                                              : {elementaryTypeName, "fixed96x72"}.
elementary_type_name -> FIXED96X80                                                              : {elementaryTypeName, "fixed96x80"}.
elementary_type_name -> FIXED96X88                                                              : {elementaryTypeName, "fixed96x88"}.
elementary_type_name -> FIXED96X96                                                              : {elementaryTypeName, "fixed96x96"}.
elementary_type_name -> FIXED96X104                                                             : {elementaryTypeName, "fixed96x104"}.
elementary_type_name -> FIXED96X112                                                             : {elementaryTypeName, "fixed96x112"}.
elementary_type_name -> FIXED96X120                                                             : {elementaryTypeName, "fixed96x120"}.
elementary_type_name -> FIXED96X128                                                             : {elementaryTypeName, "fixed96x128"}.
elementary_type_name -> FIXED96X136                                                             : {elementaryTypeName, "fixed96x136"}.
elementary_type_name -> FIXED96X144                                                             : {elementaryTypeName, "fixed96x144"}.
elementary_type_name -> FIXED96X152                                                             : {elementaryTypeName, "fixed96x152"}.
elementary_type_name -> FIXED96X160                                                             : {elementaryTypeName, "fixed96x160"}.

elementary_type_name -> FIXED104X8                                                              : {elementaryTypeName, "fixed104x8"}.
elementary_type_name -> FIXED104X16                                                             : {elementaryTypeName, "fixed104x16"}.
elementary_type_name -> FIXED104X24                                                             : {elementaryTypeName, "fixed104x24"}.
elementary_type_name -> FIXED104X32                                                             : {elementaryTypeName, "fixed104x32"}.
elementary_type_name -> FIXED104X40                                                             : {elementaryTypeName, "fixed104x40"}.
elementary_type_name -> FIXED104X48                                                             : {elementaryTypeName, "fixed104x48"}.
elementary_type_name -> FIXED104X56                                                             : {elementaryTypeName, "fixed104x56"}.
elementary_type_name -> FIXED104X64                                                             : {elementaryTypeName, "fixed104x64"}.
elementary_type_name -> FIXED104X72                                                             : {elementaryTypeName, "fixed104x72"}.
elementary_type_name -> FIXED104X80                                                             : {elementaryTypeName, "fixed104x80"}.
elementary_type_name -> FIXED104X88                                                             : {elementaryTypeName, "fixed104x88"}.
elementary_type_name -> FIXED104X96                                                             : {elementaryTypeName, "fixed104x96"}.
elementary_type_name -> FIXED104X104                                                            : {elementaryTypeName, "fixed104x104"}.
elementary_type_name -> FIXED104X112                                                            : {elementaryTypeName, "fixed104x112"}.
elementary_type_name -> FIXED104X120                                                            : {elementaryTypeName, "fixed104x120"}.
elementary_type_name -> FIXED104X128                                                            : {elementaryTypeName, "fixed104x128"}.
elementary_type_name -> FIXED104X136                                                            : {elementaryTypeName, "fixed104x136"}.
elementary_type_name -> FIXED104X144                                                            : {elementaryTypeName, "fixed104x144"}.
elementary_type_name -> FIXED104X152                                                            : {elementaryTypeName, "fixed104x152"}.

elementary_type_name -> FIXED112X8                                                              : {elementaryTypeName, "fixed112x8"}.
elementary_type_name -> FIXED112X16                                                             : {elementaryTypeName, "fixed112x16"}.
elementary_type_name -> FIXED112X24                                                             : {elementaryTypeName, "fixed112x24"}.
elementary_type_name -> FIXED112X32                                                             : {elementaryTypeName, "fixed112x32"}.
elementary_type_name -> FIXED112X40                                                             : {elementaryTypeName, "fixed112x40"}.
elementary_type_name -> FIXED112X48                                                             : {elementaryTypeName, "fixed112x48"}.
elementary_type_name -> FIXED112X56                                                             : {elementaryTypeName, "fixed112x56"}.
elementary_type_name -> FIXED112X64                                                             : {elementaryTypeName, "fixed112x64"}.
elementary_type_name -> FIXED112X72                                                             : {elementaryTypeName, "fixed112x72"}.
elementary_type_name -> FIXED112X80                                                             : {elementaryTypeName, "fixed112x80"}.
elementary_type_name -> FIXED112X88                                                             : {elementaryTypeName, "fixed112x88"}.
elementary_type_name -> FIXED112X96                                                             : {elementaryTypeName, "fixed112x96"}.
elementary_type_name -> FIXED112X104                                                            : {elementaryTypeName, "fixed112x104"}.
elementary_type_name -> FIXED112X112                                                            : {elementaryTypeName, "fixed112x112"}.
elementary_type_name -> FIXED112X120                                                            : {elementaryTypeName, "fixed112x120"}.
elementary_type_name -> FIXED112X128                                                            : {elementaryTypeName, "fixed112x128"}.
elementary_type_name -> FIXED112X136                                                            : {elementaryTypeName, "fixed112x136"}.
elementary_type_name -> FIXED112X144                                                            : {elementaryTypeName, "fixed112x144"}.

elementary_type_name -> FIXED120X8                                                              : {elementaryTypeName, "fixed120x8"}.
elementary_type_name -> FIXED120X16                                                             : {elementaryTypeName, "fixed120x16"}.
elementary_type_name -> FIXED120X24                                                             : {elementaryTypeName, "fixed120x24"}.
elementary_type_name -> FIXED120X32                                                             : {elementaryTypeName, "fixed120x32"}.
elementary_type_name -> FIXED120X40                                                             : {elementaryTypeName, "fixed120x40"}.
elementary_type_name -> FIXED120X48                                                             : {elementaryTypeName, "fixed120x48"}.
elementary_type_name -> FIXED120X56                                                             : {elementaryTypeName, "fixed120x56"}.
elementary_type_name -> FIXED120X64                                                             : {elementaryTypeName, "fixed120x64"}.
elementary_type_name -> FIXED120X72                                                             : {elementaryTypeName, "fixed120x72"}.
elementary_type_name -> FIXED120X80                                                             : {elementaryTypeName, "fixed120x80"}.
elementary_type_name -> FIXED120X88                                                             : {elementaryTypeName, "fixed120x88"}.
elementary_type_name -> FIXED120X96                                                             : {elementaryTypeName, "fixed120x96"}.
elementary_type_name -> FIXED120X104                                                            : {elementaryTypeName, "fixed120x104"}.
elementary_type_name -> FIXED120X112                                                            : {elementaryTypeName, "fixed120x112"}.
elementary_type_name -> FIXED120X120                                                            : {elementaryTypeName, "fixed120x120"}.
elementary_type_name -> FIXED120X128                                                            : {elementaryTypeName, "fixed120x128"}.
elementary_type_name -> FIXED120X136                                                            : {elementaryTypeName, "fixed120x136"}.

elementary_type_name -> FIXED128X8                                                              : {elementaryTypeName, "fixed128x8"}.
elementary_type_name -> FIXED128X16                                                             : {elementaryTypeName, "fixed128x16"}.
elementary_type_name -> FIXED128X24                                                             : {elementaryTypeName, "fixed128x24"}.
elementary_type_name -> FIXED128X32                                                             : {elementaryTypeName, "fixed128x32"}.
elementary_type_name -> FIXED128X40                                                             : {elementaryTypeName, "fixed128x40"}.
elementary_type_name -> FIXED128X48                                                             : {elementaryTypeName, "fixed128x48"}.
elementary_type_name -> FIXED128X56                                                             : {elementaryTypeName, "fixed128x56"}.
elementary_type_name -> FIXED128X64                                                             : {elementaryTypeName, "fixed128x64"}.
elementary_type_name -> FIXED128X72                                                             : {elementaryTypeName, "fixed128x72"}.
elementary_type_name -> FIXED128X80                                                             : {elementaryTypeName, "fixed128x80"}.
elementary_type_name -> FIXED128X88                                                             : {elementaryTypeName, "fixed128x88"}.
elementary_type_name -> FIXED128X96                                                             : {elementaryTypeName, "fixed128x96"}.
elementary_type_name -> FIXED128X104                                                            : {elementaryTypeName, "fixed128x104"}.
elementary_type_name -> FIXED128X112                                                            : {elementaryTypeName, "fixed128x112"}.
elementary_type_name -> FIXED128X120                                                            : {elementaryTypeName, "fixed128x120"}.
elementary_type_name -> FIXED128X128                                                            : {elementaryTypeName, "fixed128x128"}.

elementary_type_name -> FIXED136X8                                                              : {elementaryTypeName, "fixed136x8"}.
elementary_type_name -> FIXED136X16                                                             : {elementaryTypeName, "fixed136x16"}.
elementary_type_name -> FIXED136X24                                                             : {elementaryTypeName, "fixed136x24"}.
elementary_type_name -> FIXED136X32                                                             : {elementaryTypeName, "fixed136x32"}.
elementary_type_name -> FIXED136X40                                                             : {elementaryTypeName, "fixed136x40"}.
elementary_type_name -> FIXED136X48                                                             : {elementaryTypeName, "fixed136x48"}.
elementary_type_name -> FIXED136X56                                                             : {elementaryTypeName, "fixed136x56"}.
elementary_type_name -> FIXED136X64                                                             : {elementaryTypeName, "fixed136x64"}.
elementary_type_name -> FIXED136X72                                                             : {elementaryTypeName, "fixed136x72"}.
elementary_type_name -> FIXED136X80                                                             : {elementaryTypeName, "fixed136x80"}.
elementary_type_name -> FIXED136X88                                                             : {elementaryTypeName, "fixed136x88"}.
elementary_type_name -> FIXED136X96                                                             : {elementaryTypeName, "fixed136x96"}.
elementary_type_name -> FIXED136X104                                                            : {elementaryTypeName, "fixed136x104"}.
elementary_type_name -> FIXED136X112                                                            : {elementaryTypeName, "fixed136x112"}.
elementary_type_name -> FIXED136X120                                                            : {elementaryTypeName, "fixed136x120"}.

elementary_type_name -> FIXED144X8                                                              : {elementaryTypeName, "fixed144x8"}.
elementary_type_name -> FIXED144X16                                                             : {elementaryTypeName, "fixed144x16"}.
elementary_type_name -> FIXED144X24                                                             : {elementaryTypeName, "fixed144x24"}.
elementary_type_name -> FIXED144X32                                                             : {elementaryTypeName, "fixed144x32"}.
elementary_type_name -> FIXED144X40                                                             : {elementaryTypeName, "fixed144x40"}.
elementary_type_name -> FIXED144X48                                                             : {elementaryTypeName, "fixed144x48"}.
elementary_type_name -> FIXED144X56                                                             : {elementaryTypeName, "fixed144x56"}.
elementary_type_name -> FIXED144X64                                                             : {elementaryTypeName, "fixed144x64"}.
elementary_type_name -> FIXED144X72                                                             : {elementaryTypeName, "fixed144x72"}.
elementary_type_name -> FIXED144X80                                                             : {elementaryTypeName, "fixed144x80"}.
elementary_type_name -> FIXED144X88                                                             : {elementaryTypeName, "fixed144x88"}.
elementary_type_name -> FIXED144X96                                                             : {elementaryTypeName, "fixed144x96"}.
elementary_type_name -> FIXED144X104                                                            : {elementaryTypeName, "fixed144x104"}.
elementary_type_name -> FIXED144X112                                                            : {elementaryTypeName, "fixed144x112"}.

elementary_type_name -> FIXED152X8                                                              : {elementaryTypeName, "fixed152x8"}.
elementary_type_name -> FIXED152X16                                                             : {elementaryTypeName, "fixed152x16"}.
elementary_type_name -> FIXED152X24                                                             : {elementaryTypeName, "fixed152x24"}.
elementary_type_name -> FIXED152X32                                                             : {elementaryTypeName, "fixed152x32"}.
elementary_type_name -> FIXED152X40                                                             : {elementaryTypeName, "fixed152x40"}.
elementary_type_name -> FIXED152X48                                                             : {elementaryTypeName, "fixed152x48"}.
elementary_type_name -> FIXED152X56                                                             : {elementaryTypeName, "fixed152x56"}.
elementary_type_name -> FIXED152X64                                                             : {elementaryTypeName, "fixed152x64"}.
elementary_type_name -> FIXED152X72                                                             : {elementaryTypeName, "fixed152x72"}.
elementary_type_name -> FIXED152X80                                                             : {elementaryTypeName, "fixed152x80"}.
elementary_type_name -> FIXED152X88                                                             : {elementaryTypeName, "fixed152x88"}.
elementary_type_name -> FIXED152X96                                                             : {elementaryTypeName, "fixed152x96"}.
elementary_type_name -> FIXED152X104                                                            : {elementaryTypeName, "fixed152x104"}.

elementary_type_name -> FIXED160X8                                                              : {elementaryTypeName, "fixed160x8"}.
elementary_type_name -> FIXED160X16                                                             : {elementaryTypeName, "fixed160x16"}.
elementary_type_name -> FIXED160X24                                                             : {elementaryTypeName, "fixed160x24"}.
elementary_type_name -> FIXED160X32                                                             : {elementaryTypeName, "fixed160x32"}.
elementary_type_name -> FIXED160X40                                                             : {elementaryTypeName, "fixed160x40"}.
elementary_type_name -> FIXED160X48                                                             : {elementaryTypeName, "fixed160x48"}.
elementary_type_name -> FIXED160X56                                                             : {elementaryTypeName, "fixed160x56"}.
elementary_type_name -> FIXED160X64                                                             : {elementaryTypeName, "fixed160x64"}.
elementary_type_name -> FIXED160X72                                                             : {elementaryTypeName, "fixed160x72"}.
elementary_type_name -> FIXED160X80                                                             : {elementaryTypeName, "fixed160x80"}.
elementary_type_name -> FIXED160X88                                                             : {elementaryTypeName, "fixed160x88"}.
elementary_type_name -> FIXED160X96                                                             : {elementaryTypeName, "fixed160x96"}.

elementary_type_name -> FIXED168X8                                                              : {elementaryTypeName, "fixed168x8"}.
elementary_type_name -> FIXED168X16                                                             : {elementaryTypeName, "fixed168x16"}.
elementary_type_name -> FIXED168X24                                                             : {elementaryTypeName, "fixed168x24"}.
elementary_type_name -> FIXED168X32                                                             : {elementaryTypeName, "fixed168x32"}.
elementary_type_name -> FIXED168X40                                                             : {elementaryTypeName, "fixed168x40"}.
elementary_type_name -> FIXED168X48                                                             : {elementaryTypeName, "fixed168x48"}.
elementary_type_name -> FIXED168X56                                                             : {elementaryTypeName, "fixed168x56"}.
elementary_type_name -> FIXED168X64                                                             : {elementaryTypeName, "fixed168x64"}.
elementary_type_name -> FIXED168X72                                                             : {elementaryTypeName, "fixed168x72"}.
elementary_type_name -> FIXED168X80                                                             : {elementaryTypeName, "fixed168x80"}.
elementary_type_name -> FIXED168X88                                                             : {elementaryTypeName, "fixed168x88"}.

elementary_type_name -> FIXED176X8                                                              : {elementaryTypeName, "fixed176x8"}.
elementary_type_name -> FIXED176X16                                                             : {elementaryTypeName, "fixed176x16"}.
elementary_type_name -> FIXED176X24                                                             : {elementaryTypeName, "fixed176x24"}.
elementary_type_name -> FIXED176X32                                                             : {elementaryTypeName, "fixed176x32"}.
elementary_type_name -> FIXED176X40                                                             : {elementaryTypeName, "fixed176x40"}.
elementary_type_name -> FIXED176X48                                                             : {elementaryTypeName, "fixed176x48"}.
elementary_type_name -> FIXED176X56                                                             : {elementaryTypeName, "fixed176x56"}.
elementary_type_name -> FIXED176X64                                                             : {elementaryTypeName, "fixed176x64"}.
elementary_type_name -> FIXED176X72                                                             : {elementaryTypeName, "fixed176x72"}.
elementary_type_name -> FIXED176X80                                                             : {elementaryTypeName, "fixed176x80"}.

elementary_type_name -> FIXED184X8                                                              : {elementaryTypeName, "fixed184x8"}.
elementary_type_name -> FIXED184X16                                                             : {elementaryTypeName, "fixed184x16"}.
elementary_type_name -> FIXED184X24                                                             : {elementaryTypeName, "fixed184x24"}.
elementary_type_name -> FIXED184X32                                                             : {elementaryTypeName, "fixed184x32"}.
elementary_type_name -> FIXED184X40                                                             : {elementaryTypeName, "fixed184x40"}.
elementary_type_name -> FIXED184X48                                                             : {elementaryTypeName, "fixed184x48"}.
elementary_type_name -> FIXED184X56                                                             : {elementaryTypeName, "fixed184x56"}.
elementary_type_name -> FIXED184X64                                                             : {elementaryTypeName, "fixed184x64"}.
elementary_type_name -> FIXED184X72                                                             : {elementaryTypeName, "fixed184x72"}.

elementary_type_name -> FIXED192X8                                                              : {elementaryTypeName, "fixed192x8"}.
elementary_type_name -> FIXED192X16                                                             : {elementaryTypeName, "fixed192x16"}.
elementary_type_name -> FIXED192X24                                                             : {elementaryTypeName, "fixed192x24"}.
elementary_type_name -> FIXED192X32                                                             : {elementaryTypeName, "fixed192x32"}.
elementary_type_name -> FIXED192X40                                                             : {elementaryTypeName, "fixed192x40"}.
elementary_type_name -> FIXED192X48                                                             : {elementaryTypeName, "fixed192x48"}.
elementary_type_name -> FIXED192X56                                                             : {elementaryTypeName, "fixed192x56"}.
elementary_type_name -> FIXED192X64                                                             : {elementaryTypeName, "fixed192x64"}.

elementary_type_name -> FIXED200X8                                                              : {elementaryTypeName, "fixed200x8"}.
elementary_type_name -> FIXED200X16                                                             : {elementaryTypeName, "fixed200x16"}.
elementary_type_name -> FIXED200X24                                                             : {elementaryTypeName, "fixed200x24"}.
elementary_type_name -> FIXED200X32                                                             : {elementaryTypeName, "fixed200x32"}.
elementary_type_name -> FIXED200X40                                                             : {elementaryTypeName, "fixed200x40"}.
elementary_type_name -> FIXED200X48                                                             : {elementaryTypeName, "fixed200x48"}.
elementary_type_name -> FIXED200X56                                                             : {elementaryTypeName, "fixed200x56"}.

elementary_type_name -> FIXED208X8                                                              : {elementaryTypeName, "fixed208x8"}.
elementary_type_name -> FIXED208X16                                                             : {elementaryTypeName, "fixed208x16"}.
elementary_type_name -> FIXED208X24                                                             : {elementaryTypeName, "fixed208x24"}.
elementary_type_name -> FIXED208X32                                                             : {elementaryTypeName, "fixed208x32"}.
elementary_type_name -> FIXED208X40                                                             : {elementaryTypeName, "fixed208x40"}.
elementary_type_name -> FIXED208X48                                                             : {elementaryTypeName, "fixed208x48"}.

elementary_type_name -> FIXED216X8                                                              : {elementaryTypeName, "fixed216x8"}.
elementary_type_name -> FIXED216X16                                                             : {elementaryTypeName, "fixed216x16"}.
elementary_type_name -> FIXED216X24                                                             : {elementaryTypeName, "fixed216x24"}.
elementary_type_name -> FIXED216X32                                                             : {elementaryTypeName, "fixed216x32"}.
elementary_type_name -> FIXED216X40                                                             : {elementaryTypeName, "fixed216x40"}.

elementary_type_name -> FIXED224X8                                                              : {elementaryTypeName, "fixed224x8"}.
elementary_type_name -> FIXED224X16                                                             : {elementaryTypeName, "fixed224x16"}.
elementary_type_name -> FIXED224X24                                                             : {elementaryTypeName, "fixed224x24"}.
elementary_type_name -> FIXED224X32                                                             : {elementaryTypeName, "fixed224x32"}.

elementary_type_name -> FIXED232X8                                                              : {elementaryTypeName, "fixed232x8"}.
elementary_type_name -> FIXED232X16                                                             : {elementaryTypeName, "fixed232x16"}.
elementary_type_name -> FIXED232X24                                                             : {elementaryTypeName, "fixed232x24"}.

elementary_type_name -> FIXED240X8                                                              : {elementaryTypeName, "fixed240x8"}.
elementary_type_name -> FIXED240X16                                                             : {elementaryTypeName, "fixed240x16"}.

elementary_type_name -> FIXED248X8                                                              : {elementaryTypeName, "fixed248x8"}.

elementary_type_name -> UFIXED                                                                  : {elementaryTypeName, "ufixed"}.

elementary_type_name -> UFIXED0X8                                                               : {elementaryTypeName, "ufixed0x8"}.
elementary_type_name -> UFIXED0X16                                                              : {elementaryTypeName, "ufixed0x16"}.
elementary_type_name -> UFIXED0X24                                                              : {elementaryTypeName, "ufixed0x24"}.
elementary_type_name -> UFIXED0X32                                                              : {elementaryTypeName, "ufixed0x32"}.
elementary_type_name -> UFIXED0X40                                                              : {elementaryTypeName, "ufixed0x40"}.
elementary_type_name -> UFIXED0X48                                                              : {elementaryTypeName, "ufixed0x48"}.
elementary_type_name -> UFIXED0X56                                                              : {elementaryTypeName, "ufixed0x56"}.
elementary_type_name -> UFIXED0X64                                                              : {elementaryTypeName, "ufixed0x64"}.
elementary_type_name -> UFIXED0X72                                                              : {elementaryTypeName, "ufixed0x72"}.
elementary_type_name -> UFIXED0X80                                                              : {elementaryTypeName, "ufixed0x80"}.
elementary_type_name -> UFIXED0X88                                                              : {elementaryTypeName, "ufixed0x88"}.
elementary_type_name -> UFIXED0X96                                                              : {elementaryTypeName, "ufixed0x96"}.
elementary_type_name -> UFIXED0X104                                                             : {elementaryTypeName, "ufixed0x104"}.
elementary_type_name -> UFIXED0X112                                                             : {elementaryTypeName, "ufixed0x112"}.
elementary_type_name -> UFIXED0X120                                                             : {elementaryTypeName, "ufixed0x120"}.
elementary_type_name -> UFIXED0X128                                                             : {elementaryTypeName, "ufixed0x128"}.
elementary_type_name -> UFIXED0X136                                                             : {elementaryTypeName, "ufixed0x136"}.
elementary_type_name -> UFIXED0X144                                                             : {elementaryTypeName, "ufixed0x144"}.
elementary_type_name -> UFIXED0X152                                                             : {elementaryTypeName, "ufixed0x152"}.
elementary_type_name -> UFIXED0X160                                                             : {elementaryTypeName, "ufixed0x160"}.
elementary_type_name -> UFIXED0X168                                                             : {elementaryTypeName, "ufixed0x168"}.
elementary_type_name -> UFIXED0X176                                                             : {elementaryTypeName, "ufixed0x176"}.
elementary_type_name -> UFIXED0X184                                                             : {elementaryTypeName, "ufixed0x184"}.
elementary_type_name -> UFIXED0X192                                                             : {elementaryTypeName, "ufixed0x192"}.
elementary_type_name -> UFIXED0X200                                                             : {elementaryTypeName, "ufixed0x200"}.
elementary_type_name -> UFIXED0X208                                                             : {elementaryTypeName, "ufixed0x208"}.
elementary_type_name -> UFIXED0X216                                                             : {elementaryTypeName, "ufixed0x216"}.
elementary_type_name -> UFIXED0X224                                                             : {elementaryTypeName, "ufixed0x224"}.
elementary_type_name -> UFIXED0X232                                                             : {elementaryTypeName, "ufixed0x232"}.
elementary_type_name -> UFIXED0X240                                                             : {elementaryTypeName, "ufixed0x240"}.
elementary_type_name -> UFIXED0X248                                                             : {elementaryTypeName, "ufixed0x248"}.
elementary_type_name -> UFIXED0X256                                                             : {elementaryTypeName, "ufixed0x256"}.

elementary_type_name -> UFIXED8X8                                                               : {elementaryTypeName, "ufixed8x8"}.
elementary_type_name -> UFIXED8X16                                                              : {elementaryTypeName, "ufixed8x16"}.
elementary_type_name -> UFIXED8X24                                                              : {elementaryTypeName, "ufixed8x24"}.
elementary_type_name -> UFIXED8X32                                                              : {elementaryTypeName, "ufixed8x32"}.
elementary_type_name -> UFIXED8X40                                                              : {elementaryTypeName, "ufixed8x40"}.
elementary_type_name -> UFIXED8X48                                                              : {elementaryTypeName, "ufixed8x48"}.
elementary_type_name -> UFIXED8X56                                                              : {elementaryTypeName, "ufixed8x56"}.
elementary_type_name -> UFIXED8X64                                                              : {elementaryTypeName, "ufixed8x64"}.
elementary_type_name -> UFIXED8X72                                                              : {elementaryTypeName, "ufixed8x72"}.
elementary_type_name -> UFIXED8X80                                                              : {elementaryTypeName, "ufixed8x80"}.
elementary_type_name -> UFIXED8X88                                                              : {elementaryTypeName, "ufixed8x88"}.
elementary_type_name -> UFIXED8X96                                                              : {elementaryTypeName, "ufixed8x96"}.
elementary_type_name -> UFIXED8X104                                                             : {elementaryTypeName, "ufixed8x104"}.
elementary_type_name -> UFIXED8X112                                                             : {elementaryTypeName, "ufixed8x112"}.
elementary_type_name -> UFIXED8X120                                                             : {elementaryTypeName, "ufixed8x120"}.
elementary_type_name -> UFIXED8X128                                                             : {elementaryTypeName, "ufixed8x128"}.
elementary_type_name -> UFIXED8X136                                                             : {elementaryTypeName, "ufixed8x136"}.
elementary_type_name -> UFIXED8X144                                                             : {elementaryTypeName, "ufixed8x144"}.
elementary_type_name -> UFIXED8X152                                                             : {elementaryTypeName, "ufixed8x152"}.
elementary_type_name -> UFIXED8X160                                                             : {elementaryTypeName, "ufixed8x160"}.
elementary_type_name -> UFIXED8X168                                                             : {elementaryTypeName, "ufixed8x168"}.
elementary_type_name -> UFIXED8X176                                                             : {elementaryTypeName, "ufixed8x176"}.
elementary_type_name -> UFIXED8X184                                                             : {elementaryTypeName, "ufixed8x184"}.
elementary_type_name -> UFIXED8X192                                                             : {elementaryTypeName, "ufixed8x192"}.
elementary_type_name -> UFIXED8X200                                                             : {elementaryTypeName, "ufixed8x200"}.
elementary_type_name -> UFIXED8X208                                                             : {elementaryTypeName, "ufixed8x208"}.
elementary_type_name -> UFIXED8X216                                                             : {elementaryTypeName, "ufixed8x216"}.
elementary_type_name -> UFIXED8X224                                                             : {elementaryTypeName, "ufixed8x224"}.
elementary_type_name -> UFIXED8X232                                                             : {elementaryTypeName, "ufixed8x232"}.
elementary_type_name -> UFIXED8X240                                                             : {elementaryTypeName, "ufixed8x240"}.
elementary_type_name -> UFIXED8X248                                                             : {elementaryTypeName, "ufixed8x248"}.

elementary_type_name -> UFIXED16X8                                                              : {elementaryTypeName, "ufixed16x8"}.
elementary_type_name -> UFIXED16X16                                                             : {elementaryTypeName, "ufixed16x16"}.
elementary_type_name -> UFIXED16X24                                                             : {elementaryTypeName, "ufixed16x24"}.
elementary_type_name -> UFIXED16X32                                                             : {elementaryTypeName, "ufixed16x32"}.
elementary_type_name -> UFIXED16X40                                                             : {elementaryTypeName, "ufixed16x40"}.
elementary_type_name -> UFIXED16X48                                                             : {elementaryTypeName, "ufixed16x48"}.
elementary_type_name -> UFIXED16X56                                                             : {elementaryTypeName, "ufixed16x56"}.
elementary_type_name -> UFIXED16X64                                                             : {elementaryTypeName, "ufixed16x64"}.
elementary_type_name -> UFIXED16X72                                                             : {elementaryTypeName, "ufixed16x72"}.
elementary_type_name -> UFIXED16X80                                                             : {elementaryTypeName, "ufixed16x80"}.
elementary_type_name -> UFIXED16X88                                                             : {elementaryTypeName, "ufixed16x88"}.
elementary_type_name -> UFIXED16X96                                                             : {elementaryTypeName, "ufixed16x96"}.
elementary_type_name -> UFIXED16X104                                                            : {elementaryTypeName, "ufixed16x104"}.
elementary_type_name -> UFIXED16X112                                                            : {elementaryTypeName, "ufixed16x112"}.
elementary_type_name -> UFIXED16X120                                                            : {elementaryTypeName, "ufixed16x120"}.
elementary_type_name -> UFIXED16X128                                                            : {elementaryTypeName, "ufixed16x128"}.
elementary_type_name -> UFIXED16X136                                                            : {elementaryTypeName, "ufixed16x136"}.
elementary_type_name -> UFIXED16X144                                                            : {elementaryTypeName, "ufixed16x144"}.
elementary_type_name -> UFIXED16X152                                                            : {elementaryTypeName, "ufixed16x152"}.
elementary_type_name -> UFIXED16X160                                                            : {elementaryTypeName, "ufixed16x160"}.
elementary_type_name -> UFIXED16X168                                                            : {elementaryTypeName, "ufixed16x168"}.
elementary_type_name -> UFIXED16X176                                                            : {elementaryTypeName, "ufixed16x176"}.
elementary_type_name -> UFIXED16X184                                                            : {elementaryTypeName, "ufixed16x184"}.
elementary_type_name -> UFIXED16X192                                                            : {elementaryTypeName, "ufixed16x192"}.
elementary_type_name -> UFIXED16X200                                                            : {elementaryTypeName, "ufixed16x200"}.
elementary_type_name -> UFIXED16X208                                                            : {elementaryTypeName, "ufixed16x208"}.
elementary_type_name -> UFIXED16X216                                                            : {elementaryTypeName, "ufixed16x216"}.
elementary_type_name -> UFIXED16X224                                                            : {elementaryTypeName, "ufixed16x224"}.
elementary_type_name -> UFIXED16X232                                                            : {elementaryTypeName, "ufixed16x232"}.
elementary_type_name -> UFIXED16X240                                                            : {elementaryTypeName, "ufixed16x240"}.

elementary_type_name -> UFIXED24X8                                                              : {elementaryTypeName, "ufixed24x8"}.
elementary_type_name -> UFIXED24X16                                                             : {elementaryTypeName, "ufixed24x16"}.
elementary_type_name -> UFIXED24X24                                                             : {elementaryTypeName, "ufixed24x24"}.
elementary_type_name -> UFIXED24X32                                                             : {elementaryTypeName, "ufixed24x32"}.
elementary_type_name -> UFIXED24X40                                                             : {elementaryTypeName, "ufixed24x40"}.
elementary_type_name -> UFIXED24X48                                                             : {elementaryTypeName, "ufixed24x48"}.
elementary_type_name -> UFIXED24X56                                                             : {elementaryTypeName, "ufixed24x56"}.
elementary_type_name -> UFIXED24X64                                                             : {elementaryTypeName, "ufixed24x64"}.
elementary_type_name -> UFIXED24X72                                                             : {elementaryTypeName, "ufixed24x72"}.
elementary_type_name -> UFIXED24X80                                                             : {elementaryTypeName, "ufixed24x80"}.
elementary_type_name -> UFIXED24X88                                                             : {elementaryTypeName, "ufixed24x88"}.
elementary_type_name -> UFIXED24X96                                                             : {elementaryTypeName, "ufixed24x96"}.
elementary_type_name -> UFIXED24X104                                                            : {elementaryTypeName, "ufixed24x104"}.
elementary_type_name -> UFIXED24X112                                                            : {elementaryTypeName, "ufixed24x112"}.
elementary_type_name -> UFIXED24X120                                                            : {elementaryTypeName, "ufixed24x120"}.
elementary_type_name -> UFIXED24X128                                                            : {elementaryTypeName, "ufixed24x128"}.
elementary_type_name -> UFIXED24X136                                                            : {elementaryTypeName, "ufixed24x136"}.
elementary_type_name -> UFIXED24X144                                                            : {elementaryTypeName, "ufixed24x144"}.
elementary_type_name -> UFIXED24X152                                                            : {elementaryTypeName, "ufixed24x152"}.
elementary_type_name -> UFIXED24X160                                                            : {elementaryTypeName, "ufixed24x160"}.
elementary_type_name -> UFIXED24X168                                                            : {elementaryTypeName, "ufixed24x168"}.
elementary_type_name -> UFIXED24X176                                                            : {elementaryTypeName, "ufixed24x176"}.
elementary_type_name -> UFIXED24X184                                                            : {elementaryTypeName, "ufixed24x184"}.
elementary_type_name -> UFIXED24X192                                                            : {elementaryTypeName, "ufixed24x192"}.
elementary_type_name -> UFIXED24X200                                                            : {elementaryTypeName, "ufixed24x200"}.
elementary_type_name -> UFIXED24X208                                                            : {elementaryTypeName, "ufixed24x208"}.
elementary_type_name -> UFIXED24X216                                                            : {elementaryTypeName, "ufixed24x216"}.
elementary_type_name -> UFIXED24X224                                                            : {elementaryTypeName, "ufixed24x224"}.
elementary_type_name -> UFIXED24X232                                                            : {elementaryTypeName, "ufixed24x232"}.

elementary_type_name -> UFIXED32X8                                                              : {elementaryTypeName, "ufixed32x8"}.
elementary_type_name -> UFIXED32X16                                                             : {elementaryTypeName, "ufixed32x16"}.
elementary_type_name -> UFIXED32X24                                                             : {elementaryTypeName, "ufixed32x24"}.
elementary_type_name -> UFIXED32X32                                                             : {elementaryTypeName, "ufixed32x32"}.
elementary_type_name -> UFIXED32X40                                                             : {elementaryTypeName, "ufixed32x40"}.
elementary_type_name -> UFIXED32X48                                                             : {elementaryTypeName, "ufixed32x48"}.
elementary_type_name -> UFIXED32X56                                                             : {elementaryTypeName, "ufixed32x56"}.
elementary_type_name -> UFIXED32X64                                                             : {elementaryTypeName, "ufixed32x64"}.
elementary_type_name -> UFIXED32X72                                                             : {elementaryTypeName, "ufixed32x72"}.
elementary_type_name -> UFIXED32X80                                                             : {elementaryTypeName, "ufixed32x80"}.
elementary_type_name -> UFIXED32X88                                                             : {elementaryTypeName, "ufixed32x88"}.
elementary_type_name -> UFIXED32X96                                                             : {elementaryTypeName, "ufixed32x96"}.
elementary_type_name -> UFIXED32X104                                                            : {elementaryTypeName, "ufixed32x104"}.
elementary_type_name -> UFIXED32X112                                                            : {elementaryTypeName, "ufixed32x112"}.
elementary_type_name -> UFIXED32X120                                                            : {elementaryTypeName, "ufixed32x120"}.
elementary_type_name -> UFIXED32X128                                                            : {elementaryTypeName, "ufixed32x128"}.
elementary_type_name -> UFIXED32X136                                                            : {elementaryTypeName, "ufixed32x136"}.
elementary_type_name -> UFIXED32X144                                                            : {elementaryTypeName, "ufixed32x144"}.
elementary_type_name -> UFIXED32X152                                                            : {elementaryTypeName, "ufixed32x152"}.
elementary_type_name -> UFIXED32X160                                                            : {elementaryTypeName, "ufixed32x160"}.
elementary_type_name -> UFIXED32X168                                                            : {elementaryTypeName, "ufixed32x168"}.
elementary_type_name -> UFIXED32X176                                                            : {elementaryTypeName, "ufixed32x176"}.
elementary_type_name -> UFIXED32X184                                                            : {elementaryTypeName, "ufixed32x184"}.
elementary_type_name -> UFIXED32X192                                                            : {elementaryTypeName, "ufixed32x192"}.
elementary_type_name -> UFIXED32X200                                                            : {elementaryTypeName, "ufixed32x200"}.
elementary_type_name -> UFIXED32X208                                                            : {elementaryTypeName, "ufixed32x208"}.
elementary_type_name -> UFIXED32X216                                                            : {elementaryTypeName, "ufixed32x216"}.
elementary_type_name -> UFIXED32X224                                                            : {elementaryTypeName, "ufixed32x224"}.

elementary_type_name -> UFIXED40X8                                                              : {elementaryTypeName, "ufixed40x8"}.
elementary_type_name -> UFIXED40X16                                                             : {elementaryTypeName, "ufixed40x16"}.
elementary_type_name -> UFIXED40X24                                                             : {elementaryTypeName, "ufixed40x24"}.
elementary_type_name -> UFIXED40X32                                                             : {elementaryTypeName, "ufixed40x32"}.
elementary_type_name -> UFIXED40X40                                                             : {elementaryTypeName, "ufixed40x40"}.
elementary_type_name -> UFIXED40X48                                                             : {elementaryTypeName, "ufixed40x48"}.
elementary_type_name -> UFIXED40X56                                                             : {elementaryTypeName, "ufixed40x56"}.
elementary_type_name -> UFIXED40X64                                                             : {elementaryTypeName, "ufixed40x64"}.
elementary_type_name -> UFIXED40X72                                                             : {elementaryTypeName, "ufixed40x72"}.
elementary_type_name -> UFIXED40X80                                                             : {elementaryTypeName, "ufixed40x80"}.
elementary_type_name -> UFIXED40X88                                                             : {elementaryTypeName, "ufixed40x88"}.
elementary_type_name -> UFIXED40X96                                                             : {elementaryTypeName, "ufixed40x96"}.
elementary_type_name -> UFIXED40X104                                                            : {elementaryTypeName, "ufixed40x104"}.
elementary_type_name -> UFIXED40X112                                                            : {elementaryTypeName, "ufixed40x112"}.
elementary_type_name -> UFIXED40X120                                                            : {elementaryTypeName, "ufixed40x120"}.
elementary_type_name -> UFIXED40X128                                                            : {elementaryTypeName, "ufixed40x128"}.
elementary_type_name -> UFIXED40X136                                                            : {elementaryTypeName, "ufixed40x136"}.
elementary_type_name -> UFIXED40X144                                                            : {elementaryTypeName, "ufixed40x144"}.
elementary_type_name -> UFIXED40X152                                                            : {elementaryTypeName, "ufixed40x152"}.
elementary_type_name -> UFIXED40X160                                                            : {elementaryTypeName, "ufixed40x160"}.
elementary_type_name -> UFIXED40X168                                                            : {elementaryTypeName, "ufixed40x168"}.
elementary_type_name -> UFIXED40X176                                                            : {elementaryTypeName, "ufixed40x176"}.
elementary_type_name -> UFIXED40X184                                                            : {elementaryTypeName, "ufixed40x184"}.
elementary_type_name -> UFIXED40X192                                                            : {elementaryTypeName, "ufixed40x192"}.
elementary_type_name -> UFIXED40X200                                                            : {elementaryTypeName, "ufixed40x200"}.
elementary_type_name -> UFIXED40X208                                                            : {elementaryTypeName, "ufixed40x208"}.
elementary_type_name -> UFIXED40X216                                                            : {elementaryTypeName, "ufixed40x216"}.

elementary_type_name -> UFIXED48X8                                                              : {elementaryTypeName, "ufixed48x8"}.
elementary_type_name -> UFIXED48X16                                                             : {elementaryTypeName, "ufixed48x16"}.
elementary_type_name -> UFIXED48X24                                                             : {elementaryTypeName, "ufixed48x24"}.
elementary_type_name -> UFIXED48X32                                                             : {elementaryTypeName, "ufixed48x32"}.
elementary_type_name -> UFIXED48X40                                                             : {elementaryTypeName, "ufixed48x40"}.
elementary_type_name -> UFIXED48X48                                                             : {elementaryTypeName, "ufixed48x48"}.
elementary_type_name -> UFIXED48X56                                                             : {elementaryTypeName, "ufixed48x56"}.
elementary_type_name -> UFIXED48X64                                                             : {elementaryTypeName, "ufixed48x64"}.
elementary_type_name -> UFIXED48X72                                                             : {elementaryTypeName, "ufixed48x72"}.
elementary_type_name -> UFIXED48X80                                                             : {elementaryTypeName, "ufixed48x80"}.
elementary_type_name -> UFIXED48X88                                                             : {elementaryTypeName, "ufixed48x88"}.
elementary_type_name -> UFIXED48X96                                                             : {elementaryTypeName, "ufixed48x96"}.
elementary_type_name -> UFIXED48X104                                                            : {elementaryTypeName, "ufixed48x104"}.
elementary_type_name -> UFIXED48X112                                                            : {elementaryTypeName, "ufixed48x112"}.
elementary_type_name -> UFIXED48X120                                                            : {elementaryTypeName, "ufixed48x120"}.
elementary_type_name -> UFIXED48X128                                                            : {elementaryTypeName, "ufixed48x128"}.
elementary_type_name -> UFIXED48X136                                                            : {elementaryTypeName, "ufixed48x136"}.
elementary_type_name -> UFIXED48X144                                                            : {elementaryTypeName, "ufixed48x144"}.
elementary_type_name -> UFIXED48X152                                                            : {elementaryTypeName, "ufixed48x152"}.
elementary_type_name -> UFIXED48X160                                                            : {elementaryTypeName, "ufixed48x160"}.
elementary_type_name -> UFIXED48X168                                                            : {elementaryTypeName, "ufixed48x168"}.
elementary_type_name -> UFIXED48X176                                                            : {elementaryTypeName, "ufixed48x176"}.
elementary_type_name -> UFIXED48X184                                                            : {elementaryTypeName, "ufixed48x184"}.
elementary_type_name -> UFIXED48X192                                                            : {elementaryTypeName, "ufixed48x192"}.
elementary_type_name -> UFIXED48X200                                                            : {elementaryTypeName, "ufixed48x200"}.
elementary_type_name -> UFIXED48X208                                                            : {elementaryTypeName, "ufixed48x208"}.

elementary_type_name -> UFIXED56X8                                                              : {elementaryTypeName, "ufixed56x8"}.
elementary_type_name -> UFIXED56X16                                                             : {elementaryTypeName, "ufixed56x16"}.
elementary_type_name -> UFIXED56X24                                                             : {elementaryTypeName, "ufixed56x24"}.
elementary_type_name -> UFIXED56X32                                                             : {elementaryTypeName, "ufixed56x32"}.
elementary_type_name -> UFIXED56X40                                                             : {elementaryTypeName, "ufixed56x40"}.
elementary_type_name -> UFIXED56X48                                                             : {elementaryTypeName, "ufixed56x48"}.
elementary_type_name -> UFIXED56X56                                                             : {elementaryTypeName, "ufixed56x56"}.
elementary_type_name -> UFIXED56X64                                                             : {elementaryTypeName, "ufixed56x64"}.
elementary_type_name -> UFIXED56X72                                                             : {elementaryTypeName, "ufixed56x72"}.
elementary_type_name -> UFIXED56X80                                                             : {elementaryTypeName, "ufixed56x80"}.
elementary_type_name -> UFIXED56X88                                                             : {elementaryTypeName, "ufixed56x88"}.
elementary_type_name -> UFIXED56X96                                                             : {elementaryTypeName, "ufixed56x96"}.
elementary_type_name -> UFIXED56X104                                                            : {elementaryTypeName, "ufixed56x104"}.
elementary_type_name -> UFIXED56X112                                                            : {elementaryTypeName, "ufixed56x112"}.
elementary_type_name -> UFIXED56X120                                                            : {elementaryTypeName, "ufixed56x120"}.
elementary_type_name -> UFIXED56X128                                                            : {elementaryTypeName, "ufixed56x128"}.
elementary_type_name -> UFIXED56X136                                                            : {elementaryTypeName, "ufixed56x136"}.
elementary_type_name -> UFIXED56X144                                                            : {elementaryTypeName, "ufixed56x144"}.
elementary_type_name -> UFIXED56X152                                                            : {elementaryTypeName, "ufixed56x152"}.
elementary_type_name -> UFIXED56X160                                                            : {elementaryTypeName, "ufixed56x160"}.
elementary_type_name -> UFIXED56X168                                                            : {elementaryTypeName, "ufixed56x168"}.
elementary_type_name -> UFIXED56X176                                                            : {elementaryTypeName, "ufixed56x176"}.
elementary_type_name -> UFIXED56X184                                                            : {elementaryTypeName, "ufixed56x184"}.
elementary_type_name -> UFIXED56X192                                                            : {elementaryTypeName, "ufixed56x192"}.
elementary_type_name -> UFIXED56X200                                                            : {elementaryTypeName, "ufixed56x200"}.

elementary_type_name -> UFIXED64X8                                                              : {elementaryTypeName, "ufixed64x8"}.
elementary_type_name -> UFIXED64X16                                                             : {elementaryTypeName, "ufixed64x16"}.
elementary_type_name -> UFIXED64X24                                                             : {elementaryTypeName, "ufixed64x24"}.
elementary_type_name -> UFIXED64X32                                                             : {elementaryTypeName, "ufixed64x32"}.
elementary_type_name -> UFIXED64X40                                                             : {elementaryTypeName, "ufixed64x40"}.
elementary_type_name -> UFIXED64X48                                                             : {elementaryTypeName, "ufixed64x48"}.
elementary_type_name -> UFIXED64X56                                                             : {elementaryTypeName, "ufixed64x56"}.
elementary_type_name -> UFIXED64X64                                                             : {elementaryTypeName, "ufixed64x64"}.
elementary_type_name -> UFIXED64X72                                                             : {elementaryTypeName, "ufixed64x72"}.
elementary_type_name -> UFIXED64X80                                                             : {elementaryTypeName, "ufixed64x80"}.
elementary_type_name -> UFIXED64X88                                                             : {elementaryTypeName, "ufixed64x88"}.
elementary_type_name -> UFIXED64X96                                                             : {elementaryTypeName, "ufixed64x96"}.
elementary_type_name -> UFIXED64X104                                                            : {elementaryTypeName, "ufixed64x104"}.
elementary_type_name -> UFIXED64X112                                                            : {elementaryTypeName, "ufixed64x112"}.
elementary_type_name -> UFIXED64X120                                                            : {elementaryTypeName, "ufixed64x120"}.
elementary_type_name -> UFIXED64X128                                                            : {elementaryTypeName, "ufixed64x128"}.
elementary_type_name -> UFIXED64X136                                                            : {elementaryTypeName, "ufixed64x136"}.
elementary_type_name -> UFIXED64X144                                                            : {elementaryTypeName, "ufixed64x144"}.
elementary_type_name -> UFIXED64X152                                                            : {elementaryTypeName, "ufixed64x152"}.
elementary_type_name -> UFIXED64X160                                                            : {elementaryTypeName, "ufixed64x160"}.
elementary_type_name -> UFIXED64X168                                                            : {elementaryTypeName, "ufixed64x168"}.
elementary_type_name -> UFIXED64X176                                                            : {elementaryTypeName, "ufixed64x176"}.
elementary_type_name -> UFIXED64X184                                                            : {elementaryTypeName, "ufixed64x184"}.
elementary_type_name -> UFIXED64X192                                                            : {elementaryTypeName, "ufixed64x192"}.

elementary_type_name -> UFIXED72X8                                                              : {elementaryTypeName, "ufixed72x8"}.
elementary_type_name -> UFIXED72X16                                                             : {elementaryTypeName, "ufixed72x16"}.
elementary_type_name -> UFIXED72X24                                                             : {elementaryTypeName, "ufixed72x24"}.
elementary_type_name -> UFIXED72X32                                                             : {elementaryTypeName, "ufixed72x32"}.
elementary_type_name -> UFIXED72X40                                                             : {elementaryTypeName, "ufixed72x40"}.
elementary_type_name -> UFIXED72X48                                                             : {elementaryTypeName, "ufixed72x48"}.
elementary_type_name -> UFIXED72X56                                                             : {elementaryTypeName, "ufixed72x56"}.
elementary_type_name -> UFIXED72X64                                                             : {elementaryTypeName, "ufixed72x64"}.
elementary_type_name -> UFIXED72X72                                                             : {elementaryTypeName, "ufixed72x72"}.
elementary_type_name -> UFIXED72X80                                                             : {elementaryTypeName, "ufixed72x80"}.
elementary_type_name -> UFIXED72X88                                                             : {elementaryTypeName, "ufixed72x88"}.
elementary_type_name -> UFIXED72X96                                                             : {elementaryTypeName, "ufixed72x96"}.
elementary_type_name -> UFIXED72X104                                                            : {elementaryTypeName, "ufixed72x104"}.
elementary_type_name -> UFIXED72X112                                                            : {elementaryTypeName, "ufixed72x112"}.
elementary_type_name -> UFIXED72X120                                                            : {elementaryTypeName, "ufixed72x120"}.
elementary_type_name -> UFIXED72X128                                                            : {elementaryTypeName, "ufixed72x128"}.
elementary_type_name -> UFIXED72X136                                                            : {elementaryTypeName, "ufixed72x136"}.
elementary_type_name -> UFIXED72X144                                                            : {elementaryTypeName, "ufixed72x144"}.
elementary_type_name -> UFIXED72X152                                                            : {elementaryTypeName, "ufixed72x152"}.
elementary_type_name -> UFIXED72X160                                                            : {elementaryTypeName, "ufixed72x160"}.
elementary_type_name -> UFIXED72X168                                                            : {elementaryTypeName, "ufixed72x168"}.
elementary_type_name -> UFIXED72X176                                                            : {elementaryTypeName, "ufixed72x176"}.
elementary_type_name -> UFIXED72X184                                                            : {elementaryTypeName, "ufixed72x184"}.

elementary_type_name -> UFIXED80X8                                                              : {elementaryTypeName, "ufixed80x8"}.
elementary_type_name -> UFIXED80X16                                                             : {elementaryTypeName, "ufixed80x16"}.
elementary_type_name -> UFIXED80X24                                                             : {elementaryTypeName, "ufixed80x24"}.
elementary_type_name -> UFIXED80X32                                                             : {elementaryTypeName, "ufixed80x32"}.
elementary_type_name -> UFIXED80X40                                                             : {elementaryTypeName, "ufixed80x40"}.
elementary_type_name -> UFIXED80X48                                                             : {elementaryTypeName, "ufixed80x48"}.
elementary_type_name -> UFIXED80X56                                                             : {elementaryTypeName, "ufixed80x56"}.
elementary_type_name -> UFIXED80X64                                                             : {elementaryTypeName, "ufixed80x64"}.
elementary_type_name -> UFIXED80X72                                                             : {elementaryTypeName, "ufixed80x72"}.
elementary_type_name -> UFIXED80X80                                                             : {elementaryTypeName, "ufixed80x80"}.
elementary_type_name -> UFIXED80X88                                                             : {elementaryTypeName, "ufixed80x88"}.
elementary_type_name -> UFIXED80X96                                                             : {elementaryTypeName, "ufixed80x96"}.
elementary_type_name -> UFIXED80X104                                                            : {elementaryTypeName, "ufixed80x104"}.
elementary_type_name -> UFIXED80X112                                                            : {elementaryTypeName, "ufixed80x112"}.
elementary_type_name -> UFIXED80X120                                                            : {elementaryTypeName, "ufixed80x120"}.
elementary_type_name -> UFIXED80X128                                                            : {elementaryTypeName, "ufixed80x128"}.
elementary_type_name -> UFIXED80X136                                                            : {elementaryTypeName, "ufixed80x136"}.
elementary_type_name -> UFIXED80X144                                                            : {elementaryTypeName, "ufixed80x144"}.
elementary_type_name -> UFIXED80X152                                                            : {elementaryTypeName, "ufixed80x152"}.
elementary_type_name -> UFIXED80X160                                                            : {elementaryTypeName, "ufixed80x160"}.
elementary_type_name -> UFIXED80X168                                                            : {elementaryTypeName, "ufixed80x168"}.
elementary_type_name -> UFIXED80X176                                                            : {elementaryTypeName, "ufixed80x176"}.

elementary_type_name -> UFIXED88X8                                                              : {elementaryTypeName, "ufixed88x8"}.
elementary_type_name -> UFIXED88X16                                                             : {elementaryTypeName, "ufixed88x16"}.
elementary_type_name -> UFIXED88X24                                                             : {elementaryTypeName, "ufixed88x24"}.
elementary_type_name -> UFIXED88X32                                                             : {elementaryTypeName, "ufixed88x32"}.
elementary_type_name -> UFIXED88X40                                                             : {elementaryTypeName, "ufixed88x40"}.
elementary_type_name -> UFIXED88X48                                                             : {elementaryTypeName, "ufixed88x48"}.
elementary_type_name -> UFIXED88X56                                                             : {elementaryTypeName, "ufixed88x56"}.
elementary_type_name -> UFIXED88X64                                                             : {elementaryTypeName, "ufixed88x64"}.
elementary_type_name -> UFIXED88X72                                                             : {elementaryTypeName, "ufixed88x72"}.
elementary_type_name -> UFIXED88X80                                                             : {elementaryTypeName, "ufixed88x80"}.
elementary_type_name -> UFIXED88X88                                                             : {elementaryTypeName, "ufixed88x88"}.
elementary_type_name -> UFIXED88X96                                                             : {elementaryTypeName, "ufixed88x96"}.
elementary_type_name -> UFIXED88X104                                                            : {elementaryTypeName, "ufixed88x104"}.
elementary_type_name -> UFIXED88X112                                                            : {elementaryTypeName, "ufixed88x112"}.
elementary_type_name -> UFIXED88X120                                                            : {elementaryTypeName, "ufixed88x120"}.
elementary_type_name -> UFIXED88X128                                                            : {elementaryTypeName, "ufixed88x128"}.
elementary_type_name -> UFIXED88X136                                                            : {elementaryTypeName, "ufixed88x136"}.
elementary_type_name -> UFIXED88X144                                                            : {elementaryTypeName, "ufixed88x144"}.
elementary_type_name -> UFIXED88X152                                                            : {elementaryTypeName, "ufixed88x152"}.
elementary_type_name -> UFIXED88X160                                                            : {elementaryTypeName, "ufixed88x160"}.
elementary_type_name -> UFIXED88X168                                                            : {elementaryTypeName, "ufixed88x168"}.

elementary_type_name -> UFIXED96X8                                                              : {elementaryTypeName, "ufixed96x8"}.
elementary_type_name -> UFIXED96X16                                                             : {elementaryTypeName, "ufixed96x16"}.
elementary_type_name -> UFIXED96X24                                                             : {elementaryTypeName, "ufixed96x24"}.
elementary_type_name -> UFIXED96X32                                                             : {elementaryTypeName, "ufixed96x32"}.
elementary_type_name -> UFIXED96X40                                                             : {elementaryTypeName, "ufixed96x40"}.
elementary_type_name -> UFIXED96X48                                                             : {elementaryTypeName, "ufixed96x48"}.
elementary_type_name -> UFIXED96X56                                                             : {elementaryTypeName, "ufixed96x56"}.
elementary_type_name -> UFIXED96X64                                                             : {elementaryTypeName, "ufixed96x64"}.
elementary_type_name -> UFIXED96X72                                                             : {elementaryTypeName, "ufixed96x72"}.
elementary_type_name -> UFIXED96X80                                                             : {elementaryTypeName, "ufixed96x80"}.
elementary_type_name -> UFIXED96X88                                                             : {elementaryTypeName, "ufixed96x88"}.
elementary_type_name -> UFIXED96X96                                                             : {elementaryTypeName, "ufixed96x96"}.
elementary_type_name -> UFIXED96X104                                                            : {elementaryTypeName, "ufixed96x104"}.
elementary_type_name -> UFIXED96X112                                                            : {elementaryTypeName, "ufixed96x112"}.
elementary_type_name -> UFIXED96X120                                                            : {elementaryTypeName, "ufixed96x120"}.
elementary_type_name -> UFIXED96X128                                                            : {elementaryTypeName, "ufixed96x128"}.
elementary_type_name -> UFIXED96X136                                                            : {elementaryTypeName, "ufixed96x136"}.
elementary_type_name -> UFIXED96X144                                                            : {elementaryTypeName, "ufixed96x144"}.
elementary_type_name -> UFIXED96X152                                                            : {elementaryTypeName, "ufixed96x152"}.
elementary_type_name -> UFIXED96X160                                                            : {elementaryTypeName, "ufixed96x160"}.

elementary_type_name -> UFIXED104X8                                                             : {elementaryTypeName, "ufixed104x8"}.
elementary_type_name -> UFIXED104X16                                                            : {elementaryTypeName, "ufixed104x16"}.
elementary_type_name -> UFIXED104X24                                                            : {elementaryTypeName, "ufixed104x24"}.
elementary_type_name -> UFIXED104X32                                                            : {elementaryTypeName, "ufixed104x32"}.
elementary_type_name -> UFIXED104X40                                                            : {elementaryTypeName, "ufixed104x40"}.
elementary_type_name -> UFIXED104X48                                                            : {elementaryTypeName, "ufixed104x48"}.
elementary_type_name -> UFIXED104X56                                                            : {elementaryTypeName, "ufixed104x56"}.
elementary_type_name -> UFIXED104X64                                                            : {elementaryTypeName, "ufixed104x64"}.
elementary_type_name -> UFIXED104X72                                                            : {elementaryTypeName, "ufixed104x72"}.
elementary_type_name -> UFIXED104X80                                                            : {elementaryTypeName, "ufixed104x80"}.
elementary_type_name -> UFIXED104X88                                                            : {elementaryTypeName, "ufixed104x88"}.
elementary_type_name -> UFIXED104X96                                                            : {elementaryTypeName, "ufixed104x96"}.
elementary_type_name -> UFIXED104X104                                                           : {elementaryTypeName, "ufixed104x104"}.
elementary_type_name -> UFIXED104X112                                                           : {elementaryTypeName, "ufixed104x112"}.
elementary_type_name -> UFIXED104X120                                                           : {elementaryTypeName, "ufixed104x120"}.
elementary_type_name -> UFIXED104X128                                                           : {elementaryTypeName, "ufixed104x128"}.
elementary_type_name -> UFIXED104X136                                                           : {elementaryTypeName, "ufixed104x136"}.
elementary_type_name -> UFIXED104X144                                                           : {elementaryTypeName, "ufixed104x144"}.
elementary_type_name -> UFIXED104X152                                                           : {elementaryTypeName, "ufixed104x152"}.

elementary_type_name -> UFIXED112X8                                                             : {elementaryTypeName, "ufixed112x8"}.
elementary_type_name -> UFIXED112X16                                                            : {elementaryTypeName, "ufixed112x16"}.
elementary_type_name -> UFIXED112X24                                                            : {elementaryTypeName, "ufixed112x24"}.
elementary_type_name -> UFIXED112X32                                                            : {elementaryTypeName, "ufixed112x32"}.
elementary_type_name -> UFIXED112X40                                                            : {elementaryTypeName, "ufixed112x40"}.
elementary_type_name -> UFIXED112X48                                                            : {elementaryTypeName, "ufixed112x48"}.
elementary_type_name -> UFIXED112X56                                                            : {elementaryTypeName, "ufixed112x56"}.
elementary_type_name -> UFIXED112X64                                                            : {elementaryTypeName, "ufixed112x64"}.
elementary_type_name -> UFIXED112X72                                                            : {elementaryTypeName, "ufixed112x72"}.
elementary_type_name -> UFIXED112X80                                                            : {elementaryTypeName, "ufixed112x80"}.
elementary_type_name -> UFIXED112X88                                                            : {elementaryTypeName, "ufixed112x88"}.
elementary_type_name -> UFIXED112X96                                                            : {elementaryTypeName, "ufixed112x96"}.
elementary_type_name -> UFIXED112X104                                                           : {elementaryTypeName, "ufixed112x104"}.
elementary_type_name -> UFIXED112X112                                                           : {elementaryTypeName, "ufixed112x112"}.
elementary_type_name -> UFIXED112X120                                                           : {elementaryTypeName, "ufixed112x120"}.
elementary_type_name -> UFIXED112X128                                                           : {elementaryTypeName, "ufixed112x128"}.
elementary_type_name -> UFIXED112X136                                                           : {elementaryTypeName, "ufixed112x136"}.
elementary_type_name -> UFIXED112X144                                                           : {elementaryTypeName, "ufixed112x144"}.

elementary_type_name -> UFIXED120X8                                                             : {elementaryTypeName, "ufixed120x8"}.
elementary_type_name -> UFIXED120X16                                                            : {elementaryTypeName, "ufixed120x16"}.
elementary_type_name -> UFIXED120X24                                                            : {elementaryTypeName, "ufixed120x24"}.
elementary_type_name -> UFIXED120X32                                                            : {elementaryTypeName, "ufixed120x32"}.
elementary_type_name -> UFIXED120X40                                                            : {elementaryTypeName, "ufixed120x40"}.
elementary_type_name -> UFIXED120X48                                                            : {elementaryTypeName, "ufixed120x48"}.
elementary_type_name -> UFIXED120X56                                                            : {elementaryTypeName, "ufixed120x56"}.
elementary_type_name -> UFIXED120X64                                                            : {elementaryTypeName, "ufixed120x64"}.
elementary_type_name -> UFIXED120X72                                                            : {elementaryTypeName, "ufixed120x72"}.
elementary_type_name -> UFIXED120X80                                                            : {elementaryTypeName, "ufixed120x80"}.
elementary_type_name -> UFIXED120X88                                                            : {elementaryTypeName, "ufixed120x88"}.
elementary_type_name -> UFIXED120X96                                                            : {elementaryTypeName, "ufixed120x96"}.
elementary_type_name -> UFIXED120X104                                                           : {elementaryTypeName, "ufixed120x104"}.
elementary_type_name -> UFIXED120X112                                                           : {elementaryTypeName, "ufixed120x112"}.
elementary_type_name -> UFIXED120X120                                                           : {elementaryTypeName, "ufixed120x120"}.
elementary_type_name -> UFIXED120X128                                                           : {elementaryTypeName, "ufixed120x128"}.
elementary_type_name -> UFIXED120X136                                                           : {elementaryTypeName, "ufixed120x136"}.

elementary_type_name -> UFIXED128X8                                                             : {elementaryTypeName, "ufixed128x8"}.
elementary_type_name -> UFIXED128X16                                                            : {elementaryTypeName, "ufixed128x16"}.
elementary_type_name -> UFIXED128X24                                                            : {elementaryTypeName, "ufixed128x24"}.
elementary_type_name -> UFIXED128X32                                                            : {elementaryTypeName, "ufixed128x32"}.
elementary_type_name -> UFIXED128X40                                                            : {elementaryTypeName, "ufixed128x40"}.
elementary_type_name -> UFIXED128X48                                                            : {elementaryTypeName, "ufixed128x48"}.
elementary_type_name -> UFIXED128X56                                                            : {elementaryTypeName, "ufixed128x56"}.
elementary_type_name -> UFIXED128X64                                                            : {elementaryTypeName, "ufixed128x64"}.
elementary_type_name -> UFIXED128X72                                                            : {elementaryTypeName, "ufixed128x72"}.
elementary_type_name -> UFIXED128X80                                                            : {elementaryTypeName, "ufixed128x80"}.
elementary_type_name -> UFIXED128X88                                                            : {elementaryTypeName, "ufixed128x88"}.
elementary_type_name -> UFIXED128X96                                                            : {elementaryTypeName, "ufixed128x96"}.
elementary_type_name -> UFIXED128X104                                                           : {elementaryTypeName, "ufixed128x104"}.
elementary_type_name -> UFIXED128X112                                                           : {elementaryTypeName, "ufixed128x112"}.
elementary_type_name -> UFIXED128X120                                                           : {elementaryTypeName, "ufixed128x120"}.
elementary_type_name -> UFIXED128X128                                                           : {elementaryTypeName, "ufixed128x128"}.

elementary_type_name -> UFIXED136X8                                                             : {elementaryTypeName, "ufixed136x8"}.
elementary_type_name -> UFIXED136X16                                                            : {elementaryTypeName, "ufixed136x16"}.
elementary_type_name -> UFIXED136X24                                                            : {elementaryTypeName, "ufixed136x24"}.
elementary_type_name -> UFIXED136X32                                                            : {elementaryTypeName, "ufixed136x32"}.
elementary_type_name -> UFIXED136X40                                                            : {elementaryTypeName, "ufixed136x40"}.
elementary_type_name -> UFIXED136X48                                                            : {elementaryTypeName, "ufixed136x48"}.
elementary_type_name -> UFIXED136X56                                                            : {elementaryTypeName, "ufixed136x56"}.
elementary_type_name -> UFIXED136X64                                                            : {elementaryTypeName, "ufixed136x64"}.
elementary_type_name -> UFIXED136X72                                                            : {elementaryTypeName, "ufixed136x72"}.
elementary_type_name -> UFIXED136X80                                                            : {elementaryTypeName, "ufixed136x80"}.
elementary_type_name -> UFIXED136X88                                                            : {elementaryTypeName, "ufixed136x88"}.
elementary_type_name -> UFIXED136X96                                                            : {elementaryTypeName, "ufixed136x96"}.
elementary_type_name -> UFIXED136X104                                                           : {elementaryTypeName, "ufixed136x104"}.
elementary_type_name -> UFIXED136X112                                                           : {elementaryTypeName, "ufixed136x112"}.
elementary_type_name -> UFIXED136X120                                                           : {elementaryTypeName, "ufixed136x120"}.

elementary_type_name -> UFIXED144X8                                                             : {elementaryTypeName, "ufixed144x8"}.
elementary_type_name -> UFIXED144X16                                                            : {elementaryTypeName, "ufixed144x16"}.
elementary_type_name -> UFIXED144X24                                                            : {elementaryTypeName, "ufixed144x24"}.
elementary_type_name -> UFIXED144X32                                                            : {elementaryTypeName, "ufixed144x32"}.
elementary_type_name -> UFIXED144X40                                                            : {elementaryTypeName, "ufixed144x40"}.
elementary_type_name -> UFIXED144X48                                                            : {elementaryTypeName, "ufixed144x48"}.
elementary_type_name -> UFIXED144X56                                                            : {elementaryTypeName, "ufixed144x56"}.
elementary_type_name -> UFIXED144X64                                                            : {elementaryTypeName, "ufixed144x64"}.
elementary_type_name -> UFIXED144X72                                                            : {elementaryTypeName, "ufixed144x72"}.
elementary_type_name -> UFIXED144X80                                                            : {elementaryTypeName, "ufixed144x80"}.
elementary_type_name -> UFIXED144X88                                                            : {elementaryTypeName, "ufixed144x88"}.
elementary_type_name -> UFIXED144X96                                                            : {elementaryTypeName, "ufixed144x96"}.
elementary_type_name -> UFIXED144X104                                                           : {elementaryTypeName, "ufixed144x104"}.
elementary_type_name -> UFIXED144X112                                                           : {elementaryTypeName, "ufixed144x112"}.

elementary_type_name -> UFIXED152X8                                                             : {elementaryTypeName, "ufixed152x8"}.
elementary_type_name -> UFIXED152X16                                                            : {elementaryTypeName, "ufixed152x16"}.
elementary_type_name -> UFIXED152X24                                                            : {elementaryTypeName, "ufixed152x24"}.
elementary_type_name -> UFIXED152X32                                                            : {elementaryTypeName, "ufixed152x32"}.
elementary_type_name -> UFIXED152X40                                                            : {elementaryTypeName, "ufixed152x40"}.
elementary_type_name -> UFIXED152X48                                                            : {elementaryTypeName, "ufixed152x48"}.
elementary_type_name -> UFIXED152X56                                                            : {elementaryTypeName, "ufixed152x56"}.
elementary_type_name -> UFIXED152X64                                                            : {elementaryTypeName, "ufixed152x64"}.
elementary_type_name -> UFIXED152X72                                                            : {elementaryTypeName, "ufixed152x72"}.
elementary_type_name -> UFIXED152X80                                                            : {elementaryTypeName, "ufixed152x80"}.
elementary_type_name -> UFIXED152X88                                                            : {elementaryTypeName, "ufixed152x88"}.
elementary_type_name -> UFIXED152X96                                                            : {elementaryTypeName, "ufixed152x96"}.
elementary_type_name -> UFIXED152X104                                                           : {elementaryTypeName, "ufixed152x104"}.

elementary_type_name -> UFIXED160X8                                                             : {elementaryTypeName, "ufixed160x8"}.
elementary_type_name -> UFIXED160X16                                                            : {elementaryTypeName, "ufixed160x16"}.
elementary_type_name -> UFIXED160X24                                                            : {elementaryTypeName, "ufixed160x24"}.
elementary_type_name -> UFIXED160X32                                                            : {elementaryTypeName, "ufixed160x32"}.
elementary_type_name -> UFIXED160X40                                                            : {elementaryTypeName, "ufixed160x40"}.
elementary_type_name -> UFIXED160X48                                                            : {elementaryTypeName, "ufixed160x48"}.
elementary_type_name -> UFIXED160X56                                                            : {elementaryTypeName, "ufixed160x56"}.
elementary_type_name -> UFIXED160X64                                                            : {elementaryTypeName, "ufixed160x64"}.
elementary_type_name -> UFIXED160X72                                                            : {elementaryTypeName, "ufixed160x72"}.
elementary_type_name -> UFIXED160X80                                                            : {elementaryTypeName, "ufixed160x80"}.
elementary_type_name -> UFIXED160X88                                                            : {elementaryTypeName, "ufixed160x88"}.
elementary_type_name -> UFIXED160X96                                                            : {elementaryTypeName, "ufixed160x96"}.

elementary_type_name -> UFIXED168X8                                                             : {elementaryTypeName, "ufixed168x8"}.
elementary_type_name -> UFIXED168X16                                                            : {elementaryTypeName, "ufixed168x16"}.
elementary_type_name -> UFIXED168X24                                                            : {elementaryTypeName, "ufixed168x24"}.
elementary_type_name -> UFIXED168X32                                                            : {elementaryTypeName, "ufixed168x32"}.
elementary_type_name -> UFIXED168X40                                                            : {elementaryTypeName, "ufixed168x40"}.
elementary_type_name -> UFIXED168X48                                                            : {elementaryTypeName, "ufixed168x48"}.
elementary_type_name -> UFIXED168X56                                                            : {elementaryTypeName, "ufixed168x56"}.
elementary_type_name -> UFIXED168X64                                                            : {elementaryTypeName, "ufixed168x64"}.
elementary_type_name -> UFIXED168X72                                                            : {elementaryTypeName, "ufixed168x72"}.
elementary_type_name -> UFIXED168X80                                                            : {elementaryTypeName, "ufixed168x80"}.
elementary_type_name -> UFIXED168X88                                                            : {elementaryTypeName, "ufixed168x88"}.

elementary_type_name -> UFIXED176X8                                                             : {elementaryTypeName, "ufixed176x8"}.
elementary_type_name -> UFIXED176X16                                                            : {elementaryTypeName, "ufixed176x16"}.
elementary_type_name -> UFIXED176X24                                                            : {elementaryTypeName, "ufixed176x24"}.
elementary_type_name -> UFIXED176X32                                                            : {elementaryTypeName, "ufixed176x32"}.
elementary_type_name -> UFIXED176X40                                                            : {elementaryTypeName, "ufixed176x40"}.
elementary_type_name -> UFIXED176X48                                                            : {elementaryTypeName, "ufixed176x48"}.
elementary_type_name -> UFIXED176X56                                                            : {elementaryTypeName, "ufixed176x56"}.
elementary_type_name -> UFIXED176X64                                                            : {elementaryTypeName, "ufixed176x64"}.
elementary_type_name -> UFIXED176X72                                                            : {elementaryTypeName, "ufixed176x72"}.
elementary_type_name -> UFIXED176X80                                                            : {elementaryTypeName, "ufixed176x80"}.

elementary_type_name -> UFIXED184X8                                                             : {elementaryTypeName, "ufixed184x8"}.
elementary_type_name -> UFIXED184X16                                                            : {elementaryTypeName, "ufixed184x16"}.
elementary_type_name -> UFIXED184X24                                                            : {elementaryTypeName, "ufixed184x24"}.
elementary_type_name -> UFIXED184X32                                                            : {elementaryTypeName, "ufixed184x32"}.
elementary_type_name -> UFIXED184X40                                                            : {elementaryTypeName, "ufixed184x40"}.
elementary_type_name -> UFIXED184X48                                                            : {elementaryTypeName, "ufixed184x48"}.
elementary_type_name -> UFIXED184X56                                                            : {elementaryTypeName, "ufixed184x56"}.
elementary_type_name -> UFIXED184X64                                                            : {elementaryTypeName, "ufixed184x64"}.
elementary_type_name -> UFIXED184X72                                                            : {elementaryTypeName, "ufixed184x72"}.

elementary_type_name -> UFIXED192X8                                                             : {elementaryTypeName, "ufixed192x8"}.
elementary_type_name -> UFIXED192X16                                                            : {elementaryTypeName, "ufixed192x16"}.
elementary_type_name -> UFIXED192X24                                                            : {elementaryTypeName, "ufixed192x24"}.
elementary_type_name -> UFIXED192X32                                                            : {elementaryTypeName, "ufixed192x32"}.
elementary_type_name -> UFIXED192X40                                                            : {elementaryTypeName, "ufixed192x40"}.
elementary_type_name -> UFIXED192X48                                                            : {elementaryTypeName, "ufixed192x48"}.
elementary_type_name -> UFIXED192X56                                                            : {elementaryTypeName, "ufixed192x56"}.
elementary_type_name -> UFIXED192X64                                                            : {elementaryTypeName, "ufixed192x64"}.

elementary_type_name -> UFIXED200X8                                                             : {elementaryTypeName, "ufixed200x8"}.
elementary_type_name -> UFIXED200X16                                                            : {elementaryTypeName, "ufixed200x16"}.
elementary_type_name -> UFIXED200X24                                                            : {elementaryTypeName, "ufixed200x24"}.
elementary_type_name -> UFIXED200X32                                                            : {elementaryTypeName, "ufixed200x32"}.
elementary_type_name -> UFIXED200X40                                                            : {elementaryTypeName, "ufixed200x40"}.
elementary_type_name -> UFIXED200X48                                                            : {elementaryTypeName, "ufixed200x48"}.
elementary_type_name -> UFIXED200X56                                                            : {elementaryTypeName, "ufixed200x56"}.

elementary_type_name -> UFIXED208X8                                                             : {elementaryTypeName, "ufixed208x8"}.
elementary_type_name -> UFIXED208X16                                                            : {elementaryTypeName, "ufixed208x16"}.
elementary_type_name -> UFIXED208X24                                                            : {elementaryTypeName, "ufixed208x24"}.
elementary_type_name -> UFIXED208X32                                                            : {elementaryTypeName, "ufixed208x32"}.
elementary_type_name -> UFIXED208X40                                                            : {elementaryTypeName, "ufixed208x40"}.
elementary_type_name -> UFIXED208X48                                                            : {elementaryTypeName, "ufixed208x48"}.

elementary_type_name -> UFIXED216X8                                                             : {elementaryTypeName, "ufixed216x8"}.
elementary_type_name -> UFIXED216X16                                                            : {elementaryTypeName, "ufixed216x16"}.
elementary_type_name -> UFIXED216X24                                                            : {elementaryTypeName, "ufixed216x24"}.
elementary_type_name -> UFIXED216X32                                                            : {elementaryTypeName, "ufixed216x32"}.
elementary_type_name -> UFIXED216X40                                                            : {elementaryTypeName, "ufixed216x40"}.

elementary_type_name -> UFIXED224X8                                                             : {elementaryTypeName, "ufixed224x8"}.
elementary_type_name -> UFIXED224X16                                                            : {elementaryTypeName, "ufixed224x16"}.
elementary_type_name -> UFIXED224X24                                                            : {elementaryTypeName, "ufixed224x24"}.
elementary_type_name -> UFIXED224X32                                                            : {elementaryTypeName, "ufixed224x32"}.

elementary_type_name -> UFIXED232X8                                                             : {elementaryTypeName, "ufixed232x8"}.
elementary_type_name -> UFIXED232X16                                                            : {elementaryTypeName, "ufixed232x16"}.
elementary_type_name -> UFIXED232X24                                                            : {elementaryTypeName, "ufixed232x24"}.

elementary_type_name -> UFIXED240X8                                                             : {elementaryTypeName, "ufixed240x8"}.
elementary_type_name -> UFIXED240X16                                                            : {elementaryTypeName, "ufixed240x16"}.

elementary_type_name -> UFIXED248X8                                                             : {elementaryTypeName, "ufixed248x8"}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Expect 2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Erlang code.

-behaviour(application).
-behaviour(supervisor).

% application callbacks
-export([start/0, start/2, stop/1, stop/0]).

% Supervisor callbacks
-export([init/1]).

% parser and compiler interface
-export([fold/3,
         fold_bu/3,
         fold_td/3,
         is_reserved/1,
         parsetree/1,
         parsetree_to_string/1,
         parsetree_to_string_bu/1,
         parsetree_to_string_td/1,
         parsetree_with_tokens/1
        ]).

% -define(NODEBUG, true).
-include_lib("eunit/include/eunit.hrl").

-define(Dbg(__Rule, __Production),
begin
    io:format(user, "__ "??__Rule" (~p)~n", [__Production]),
    __Production
end).

%%-----------------------------------------------------------------------------
%%                          dummy application interface
%%-----------------------------------------------------------------------------

start() ->
    application:start(?MODULE).
stop() ->
    application:stop(?MODULE).

start(_Type, _Args) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).
stop(_State) ->
    ok.

init([]) ->
     {ok, { {one_for_one, 5, 10}, []} }.

%%-----------------------------------------------------------------------------
%%                          parser helper functions
%%-----------------------------------------------------------------------------

unwrap({_,_,X}) ->
    X.

%%-----------------------------------------------------------------------------

%%-----------------------------------------------------------------------------
%%                                  PARSER
%%-----------------------------------------------------------------------------
-spec parsetree(binary()|list()) ->
    {parse_error, term()} | {lex_error, term()} | {ok, [tuple()]}.
parsetree(Cypher) ->
   case parsetree_with_tokens(Cypher) of
       {ok, {ParseTree, _Tokens}} -> {ok, ParseTree};
       Error -> Error
   end.

-spec parsetree_with_tokens(binary()|list()) ->
    {parse_error, term()} | {lex_error, term()} | {ok, {[tuple()], list()}}.
parsetree_with_tokens([]) -> {parse_error, invalid_string};
parsetree_with_tokens(<<>>) -> {parse_error, invalid_string};
parsetree_with_tokens(Cypher0) ->
    Cypher = re:replace(Cypher0, "(^[ \r\n]+)|([ \r\n]+$)", "",
                     [global, {return, list}]),
    [C|_] = lists:reverse(Cypher),
    NCypher = if C =:= $; -> Cypher; true -> string:strip(Cypher) end,
    case sylexer:string(NCypher) of
        {ok, Toks, _} ->
            case syparse:parse(Toks) of
                {ok, PTree} -> {ok, {PTree, Toks}};
                {error,{N,?MODULE,ErrorTerms}} ->
                    {parse_error, {lists:flatten([integer_to_list(N), ": ", ErrorTerms]), Toks}};
                {error,Error} -> {parse_error, {Error, Toks}}
            end;
        {error,Error,_} -> {lex_error, Error}
    end.

-spec is_reserved(binary() | atom() | list()) ->
    true | false.
is_reserved(Word) when is_binary(Word) ->
    is_reserved(erlang:binary_to_list(Word));
is_reserved(Word) when is_atom(Word) ->
    is_reserved(erlang:atom_to_list(Word));
is_reserved(Word) when is_list(Word) ->
    lists:member(erlang:list_to_atom(string:to_upper(Word)),
                 sylexer:reserved_keywords()).

%%-----------------------------------------------------------------------------

%%-----------------------------------------------------------------------------
%%                                  COMPILER
%%-----------------------------------------------------------------------------

-spec parsetree_to_string(tuple()| list()) ->
    {error, term()} | binary().
parsetree_to_string(PTree) ->
    parsetree_to_string_td(PTree).

-spec parsetree_to_string_bu(tuple()| list()) ->
    {error, term()} | binary().
parsetree_to_string_bu(PTree) ->
    fold_bu(fun(_,_) -> null_fun end, null_fun, PTree).

-spec parsetree_to_string_td(tuple()| list()) ->
    {error, term()} | binary().
parsetree_to_string_td(PTree) ->
    fold_td(fun(_,_) -> null_fun end, null_fun, PTree).

-spec fold(fun(), term(), tuple()) ->
    {error, term()} | binary().
fold(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    fold_td(Fun, Ctx, PTree).

-spec fold_bu(fun(), term(), tuple()) ->
    {error, term()} | binary().
fold_bu(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    try syparse_fold:fold(bottom_up, Fun, Ctx, 0, PTree) of
        {error,_} = Error -> Error;
        {Cypher, null_fun = Ctx} -> list_to_binary(string:strip(Cypher));
        {_Output, NewCtx} -> NewCtx
    catch
        _:Error -> {error, Error}
    end.

-spec fold_td(fun(), term(), tuple() | list()) ->
    {error, term()} | binary().
fold_td(Fun, Ctx, PTree) when is_function(Fun, 2) ->
    try syparse_fold:fold(top_down, Fun, Ctx, 0, PTree) of
        {error,_} = Error -> Error;
        {Cypher, null_fun = Ctx} ->
            list_to_binary(string:strip(Cypher));
        {_Output, NewCtx} ->
            NewCtx
    catch
        _:Error -> {error, Error}
    end.
