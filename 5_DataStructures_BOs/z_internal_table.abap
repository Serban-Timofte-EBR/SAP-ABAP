CLASS z_internal_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES IF_OO_ADT_CLASSRUN.

  PRIVATE SECTION.
    TYPES: BEGIN OF st_connection,
             carrier_id      TYPE /dmo/carrier_id,
             connection_id   TYPE /dmo/connection_id,
             airport_from_id TYPE /dmo/airport_from_id,
             airport_to_id   TYPE /dmo/airport_to_id,
             carrier_name    TYPE /dmo/carrier_name,
           END OF st_connection.

    TYPES: tt_connections TYPE SORTED TABLE OF st_connection
                              WITH UNIQUE KEY carrier_id
                                              connection_id.
ENDCLASS.



CLASS z_internal_table IMPLEMENTATION.
  METHOD IF_OO_ADT_CLASSRUN~main.

  " Extra data from Using the Entity Manipulation Language Chapter
    DATA input_keys TYPE TABLE FOR READ IMPORT /DMO/I_AgencyTP.
    DATA result_tab TYPE TABLE FOR READ RESULT /DMO/I_AgencyTP.

    input_keys = VALUE #( ( agencyID = '070050' ) ).
    out->write( |INPUT KEY VALUE FROM EXTRA CHAPTER:| ).
    out->write( input_keys ).

    READ ENTITIES OF /DMO/I_AgencyTP
            ENTITY /DMO/Agency
            ALL FIELDS WITH input_keys
            RESULT result_tab.
    out->write( |READ ACTION Result| ).
    out->write( result_tab ).

   DATA agencies_upd TYPE TABLE FOR UPDATE /dmo/i_agencytp.

    agencies_upd = VALUE #( ( agencyid = '0700##' name = 'Some fancy new name' ) ).

    MODIFY ENTITIES OF /dmo/i_agencytp
      ENTITY /dmo/agency
      UPDATE FIELDS ( name )
        WITH agencies_upd.

    COMMIT ENTITIES.

    out->write( `Method execution finished!`  ).

* Example 1 : Simple and Complex Internal Table
**********************************************************************

    " simple table (scalar row type)
    DATA numbers TYPE TABLE OF i.
    " complex table (structured row type)
    DATA connections TYPE TABLE OF st_connection.

    out->write(  `--------------------------------------------` ).
    out->write(  `Example 1: Simple and Complex Internal Table` ).
    out->write( data = numbers
                name = `Simple Table NUMBERS:`).
    out->write( data = connections
                name = `Complex Table CONNECTIONS:`).

* Example 2 : Complex Internal Tables
**********************************************************************

    " standard table with non-unique standard key (short form)
    DATA connections_1 TYPE TABLE OF st_connection.

    " standard table with non-unique standard key (explicit form)
    DATA connections_2 TYPE STANDARD TABLE OF st_connection
                            WITH NON-UNIQUE DEFAULT KEY.

    " sorted table with non-unique explicit key
    DATA connections_3  TYPE SORTED TABLE OF st_connection
                             WITH NON-UNIQUE KEY airport_from_id
                                                 airport_to_id.

    " sorted hashed with unique explicit key
    DATA connections_4  TYPE HASHED TABLE OF st_connection
                             WITH UNIQUE KEY carrier_id
                                             connection_id.

* Example 3 : Local Table Type
**********************************************************************

    TYPES tt_connections TYPE SORTED TABLE OF st_connection
                              WITH UNIQUE KEY carrier_id
                                              connection_id.

    DATA connections_5 TYPE tt_connections.

* Example 4 : Global Table Type
**********************************************************************

    DATA flights  TYPE /dmo/t_flight.

    out->write(  `------------------------------------------` ).
    out->write(  `Example 4: Global Table TYpe /DMO/T_FLIGHT` ).
    out->write(  data = flights
                 name = `Internal Table FLIGHTS:` ).

  ENDMETHOD.

ENDCLASS.