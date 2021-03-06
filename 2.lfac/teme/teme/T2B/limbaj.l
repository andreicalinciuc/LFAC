%{
#include <stdio.h>
#include "y.tab.h"
%}
%x comment
%x comment_linie
%%

"//" {BEGIN comment_linie;}
<comment_linie>\n {BEGIN 0;}
<comment_linie>. ;
"/*" {BEGIN comment;} 
<comment>"*/" {BEGIN 0;}
<comment>. ;

"const"|"int"|"float"|"char"|"string" {return TYPE;}
"vid" 				{return VOID_TYPE;}
"clasa" 			{return TYPE_CLASS;}
\'.\' 				{return CHAR;}
\".*\" 				{return STRING_CHAR;}
"START_POINT"	 		{return INIT;}
"END_POINT" 			{return END;}
"GO_FUNC" 			{return INIT_FCN;}
"STOP_FUNC" 			{return END_FCN;}
"GO_CLASS" 			{return INIT_CLASS;}
"STOP_CLASS" 			{return END_CLASS;}
"IF" 				{return IF;}
"THEN" 				{return THEN;}
"STOP_THEN" 			{return END_THEN;}
"ELSE" 				{return ELSE;}
"STOP_ELSE" 			{return END_ELSE;}
"WHILE" 			{return WHILE;}
"EXECUTE" 			{return EXEC;};
"STOP_WHILE" 			{return END_WHILE;}
"FOR" 				{return FOR;}
"STOP_FOR" 			{return END_FOR;}
"GIVE" 				{return RET;}
"ONE"|"ZERO" 			{return VAL_BOOL;}
"AND"|"ORR" 			{return BOOL;}
"<"|">"|"<="|"=>" 		{return OP_COMP;}
"="|"!=" 			{return OP_INEG;}
"===" 				{return ASSIGN;}
[_a-zA-Z][_a-zA-Z0-9]*  	{return ID;}
0|[1-9][0-9]* 			{return UNSGN_INT_NO;}
-?0|([1-9][0-9]*) 		{return INT_NO;}
-?(0|[1-9][0-9]*)","[0-9]* 	{return FLOAT_NO;}
[0-9]+ 				{return NO;}
[ \t] ;
\n {yylineno++;}
. {return yytext[0];}

 

