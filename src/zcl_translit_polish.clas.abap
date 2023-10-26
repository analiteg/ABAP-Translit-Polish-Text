CLASS zcl_translit_polish DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_translit_polish IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " Step 1 - Create Instance (singleton)
    DATA(mo_route) = lcl_translit=>create_instance( ).
    " Step 2 - Get Text
    DATA polish_text TYPE string.
    polish_text = 'Szkoła Podstawowa Nr 47 im. Jana Klemensa Branickiego w Białymstoku'.

    TRY.
        out->write( mo_route->translit_polish( polish_text ) ).
      CATCH cx_root INTO DATA(exc).
        out->write( exc->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
