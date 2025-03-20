CLASS zcl_lms_course DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: gv_selected_course TYPE string.
    
    METHODS: display_course IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out,
             enroll_course IMPORTING io_user TYPE REF TO zcl_lms_users
             io_out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.



CLASS zcl_lms_course IMPLEMENTATION.
  METHOD display_course.
    io_out->write( |Available courses:| ).
    io_out->write( '1. ABAP Basics (Cost: 50 credits)' ).
    io_out->write( '2. Advanced Java (Cost: 75 credits)' ).
  ENDMETHOD.

  METHOD enroll_course.
    DATA lv_course_cost TYPE i.
    
    gv_selected_course = 'ABAP Basics'.
    lv_course_cost = 50.
    
    io_out->write( |Selected Course: { gv_selected_course }| ).
    
    IF io_user->gv_credits >= lv_course_cost.
        io_user->gv_credits = io_user->gv_credits - lv_ourse_cost.
        io_out->write( |Enrollment Successful!| ).
    ELSE.
        RAISE EXCEPTION TYPE cx_dynamic_check
            EXPORTING text = 'Not enough credits to enroll'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.