CLASS lcl_translit DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create_instance
      RETURNING VALUE(ro_translit) TYPE REF TO lcl_translit.

    METHODS translit_polish
      IMPORTING iv_string        TYPE string
      RETURNING VALUE(rv_string) TYPE string
      RAISING   cx_static_check.

  PRIVATE SECTION.
    CLASS-DATA lo_translit TYPE REF TO lcl_translit.

ENDCLASS.


CLASS lcl_translit IMPLEMENTATION.
  METHOD create_instance.
    ro_translit = COND #( WHEN lo_translit IS BOUND
                          THEN lo_translit
                          ELSE NEW lcl_translit( )  ).
    lo_translit = ro_translit.
  ENDMETHOD.

  METHOD translit_polish.
    TYPES:
      BEGIN OF ls_polish_trans,
        psymbol TYPE string,
        usimbol TYPE string,
      END OF ls_polish_trans.

    DATA lt_translit TYPE HASHED TABLE OF ls_polish_trans WITH UNIQUE KEY psymbol.

    lt_translit = VALUE #( ( psymbol   = 'ą' usimbol = 'a' )
                           ( psymbol   = 'Ą' usimbol = 'A' )
                           ( psymbol   = 'ć' usimbol = 'c' )
                           ( psymbol   = 'Ć' usimbol = 'C' )
                           ( psymbol   = 'ę' usimbol = 'e' )
                           ( psymbol   = 'Ę' usimbol = 'E' )
                           ( psymbol   = 'ł' usimbol = 'l' )
                           ( psymbol   = 'Ł' usimbol = 'L' )
                           ( psymbol   = 'ń' usimbol = 'n' )
                           ( psymbol   = 'Ń' usimbol = 'N' )
                           ( psymbol   = 'ó' usimbol = 'o' )
                           ( psymbol   = 'Ó' usimbol = 'O' )
                           ( psymbol   = 'ś' usimbol = 's' )
                           ( psymbol   = 'Ś' usimbol = 'S' )
                           ( psymbol   = 'ż' usimbol = 'z' )
                           ( psymbol   = 'Ż' usimbol = 'Z' )
                           ( psymbol   = 'ź' usimbol = 'z' )
                           ( psymbol   = 'Ź' usimbol = 'Z' ) ).

    DATA(lv_string) = iv_string.
    DATA lv_index    TYPE i.
    DATA lv_char     TYPE c LENGTH 1.
    DATA lv_new_char TYPE c LENGTH 1.
    DATA(lv_length) = strlen( lv_string ).

    WHILE lv_index < lv_length.
      lv_char = lv_string+lv_index(1).
      IF line_exists( lt_translit[ psymbol = lv_char ] ).
        lv_new_char = lt_translit[ psymbol = lv_char ]-usimbol.
        REPLACE lv_char WITH lv_new_char INTO lv_string.
      ENDIF.
      lv_index += 1.
    ENDWHILE.

    rv_string = lv_string.
  ENDMETHOD.
ENDCLASS.
