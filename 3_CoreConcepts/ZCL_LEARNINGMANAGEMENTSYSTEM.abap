CLASS zcl_learningmanagementsystem DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

ENDCLASS.

CLASS zcl_learningmanagementsystem IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(lo_user) = NEW zcl_lms_users(
                iv_username = 'John Doe'
                iv_credits = 100
                io_out = out ).


        DATA(lo_course) = NEW zcl_lms_course( ).
        DATA(lo_progress) = NEW zcl_lms_progress( ).

        out->write( 'Welcome to the ABAP Learning System!' ).

        lo_course->display_course( out ). 
        lo_course->enroll_course( lo_user, out ).  
        lo_progress->show_progress( lo_user, lo_course, out ).  

      CATCH cx_root INTO DATA(lx_error).
        out->write( |Error: { lx_error->get_text( ) }| ).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.