CLASS zcl_lms_users DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: gv_username TYPE string.
    DATA: gv_credits TYPE i.
    
    METHODS: constructor IMPORTING iv_username TYPE string
                                   iv_credits TYPE i
                                   io_out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.

CLASS zcl_lms_users IMPLEMENTATION.
    METHOD constructor.
        gv_username = iv_username.
        gv_credits = iv_credits.
        io_out->write( |User Created: { gv_username } with { gv_credits } credits| ).
    ENDMETHOD.
ENDCLASS.