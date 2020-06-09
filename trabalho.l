%{
    #include<stdio.h>

    int Mai=0,Min=0,Keyword=0,Relac=0;
    int Parent=0,Colch=0,Pntvrg=0,Coment=0;
    int Total=0;
    
%}

%%

"if"     printf("Estrutura de decisao");Keyword++;
"else"   printf("Estrutura de decisao");Keyword++;
"do"     printf("Estrutura de repeticao");Keyword++;
"while"  printf("Estrutura de repeticao");Keyword++;
"for"    printf("Estrutura de repeticao");Keyword++;
"to"     printf("Estrutura de repeticao");Keyword++;
"then"   printf("Outros");Keyword++;
"print"  printf("Funcao para saida de dados");Keyword++;
"printf" printf("Funcao para saida de dados");Keyword++;
"scanf"  printf("Funcao para entrada de dados");Keyword++;

">" printf("Maior que");Relac++;
"<" printf("Menor que");Relac++;
"=" printf("Igual - Atribuicao");Relac++;
"==" printf("Igual - Comparacao");Relac++;
"!="|"<>" printf("Diferente de");Relac++;
"<=" printf("Menor ou igual a");Relac++;
">=" printf("Maior ou igual a");Relac++;
"$" printf("Contido");Relac++;

"("|")" printf("Parenteses");Parent++;
"["|"]" printf("Colchetes");Colch++;
";" printf("Ponto e virgula");Pntvrg++;
"//" printf("Comentarios");Coment++;

[A-Z]+ printf("Identificador maiusculo");Mai++;
[a-z]+ printf("Identificador minusculo \t");Min++;

"///" printf("\n\n\n Saindo do codigo... \n\n\n");return 0;

%%

void resultado(){
    printf("Identificadores maiusculos %i \n\n",Mai);
    printf("Identificadores minusculos %i \n\n",Min);
    printf("Total de palavras reservadas %i \n\n",Keyword);
    printf("Operadores relacionais %i \n\n",Relac);
    printf("Parenteses %i \n\n",Parent);
    printf("Colchetes %i \n\n",Colch);
    printf("Ponto e virgula %i \n\n",Pntvrg);
    printf("Comentarios %i \n\n",Coment);

    printf("Total tokens %i \n\n",soma());
}

int soma(){

    Total = Mai+Min+Keyword+Relac+Parent+Colch+Pntvrg+Coment;

    return Total;
}

int main(){

    yylex();
    resultado();
}

int yywrap(){

    return 1;
}
