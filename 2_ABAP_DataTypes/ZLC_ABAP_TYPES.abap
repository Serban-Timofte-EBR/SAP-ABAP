CLASS zcl_abap_types DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    DATA: gv_public_var TYPE string. "Can be accessed outside of the class"
    METHODS: display_values.
  
  PROTECTED SECTION.
    DATA: gv_protected_var TYPE i. "Can be accessed only inside the class and subclasses"
  
  PRIVATE SECTION.
    DATA: gv_private_var TYPE f. "Can be accessed only inside the class"
ENDCLASS.



CLASS zcl_abap_types IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    display_values( ).  " Call the display method
  ENDMETHOD.
    
  METHOD display_values.
    DATA lv_local_var TYPE string. "Local variable"
    
    gv_public_var = 'Hello, ABAP!'.
    gv_protected_var = 42.
    gv_private_var = 3.
    lv_local_var = 'Local variable'.
    
    out->write( |Public: { gv_public_var }| ).
    out->write( |Protected: { gv_protected_var }| ).
    out->write( |Private: { gv_private_var }| ).
    out->write( |Local: { lv_local_var }| ).
  ENDMETHOD.

ENDCLASS.