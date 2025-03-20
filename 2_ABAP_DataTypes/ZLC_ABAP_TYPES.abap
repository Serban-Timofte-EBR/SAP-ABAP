CLASS zcl_abap_types DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    DATA: gv_public_var TYPE string. "Can be accessed outside of the class"
    DATA number1 TYPE i.
    DATA number2 TYPE i.
    METHODS: display_values IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out. " Pass out as a parameter

  PROTECTED SECTION.
    DATA: gv_protected_var TYPE i. "Can be accessed only inside the class and subclasses"

  PRIVATE SECTION.
    DATA: gv_private_var TYPE f. "Can be accessed only inside the class"
ENDCLASS.



CLASS zcl_abap_types IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    number1 = -8.
    number2 = 3.

    DATA(result) = number1 / number2.
    DATA(output) = |{ number1 } / { number2 } = { result }|.

    out->write( output ).

    display_values( out ).  " Call the display method
  ENDMETHOD.

   METHOD display_values.
    DATA lv_local_var TYPE string.

    gv_public_var = 'Hello, ABAP Cloud!'.
    gv_protected_var = 42.
    gv_private_var = 3.
    lv_local_var = 'Local variable'.

    io_out->write( |Public: { gv_public_var }| ).
    io_out->write( |Protected: { gv_protected_var }| ).
    io_out->write( |Private: { gv_private_var }| ).
    io_out->write( |Local: { lv_local_var }| ).
  ENDMETHOD.

ENDCLASS.