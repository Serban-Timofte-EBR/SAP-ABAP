CLASS zcl_lms_progress DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS: show_progress IMPORTING io_user TYPE REF TO zcl_lms_users
                                      io_course TYPE REF TO zcl_lms_course
                                      io_out TYPE REF TO if_oo_adt_classrun_out.

ENDCLASS.

CLASS zcl_lms_progress IMPLEMENTATION.

  METHOD show_progress.
    io_out->write( |User: { io_user->gv_username }| ).
    io_out->write( |Course: { io_course->gv_selected_course }| ).
    io_out->write( |Remaining Credits: { io_user->gv_credits }| ).
  ENDMETHOD.

ENDCLASS.
