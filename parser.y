%include {
    #include <assert.h>
}

%token_type { char * }
%token_destructor { free($$); }
%default_type { struct node * }
%start_symbol translation_unit

translation_unit ::= IDENTIFIER.
