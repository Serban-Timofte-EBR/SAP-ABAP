CLASS zcl_hello_world_buc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.  "Inteface to print to console"
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_hello_world_buc IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( |Hello, World! ({ cl_abap_context_info=>get_user_alias(  ) })| ).
  ENDMETHOD.

ENDCLASS.