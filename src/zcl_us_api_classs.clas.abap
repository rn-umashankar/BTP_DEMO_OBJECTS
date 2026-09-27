CLASS zcl_us_api_classs DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
        tt_entites type table for update zus_ri_sou ,
        tt_mapped  type response for mapped early zus_ri_sou ,
        tt_failed  type response for failed early zus_ri_sou  ,
        tt_reported type response for reported early zus_ri_sou ,
        tt_reported_late type response for reported late zus_ri_sou .

    CLASS-METHODS:
        update
            IMPORTING
                i_entities type tt_entites
            changing
                C_mapped TYPE tt_mapped
                C_failed type tt_failed
                C_reported TYPE tt_reported,

        save
            changing
                C_reported type tt_reported_late .

        CLASS-DATA:
            gt_so TYPE TABLE of zvkfeb01_dt_so.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_us_api_classs IMPLEMENTATION.
  METHOD update.
    gt_so = CORRESPONDING #(  i_entities mapping from entity ).
  ENDMETHOD.

  METHOD save.
    if gt_so IS NOT INITIAL.
        MODIFY zvkfeb01_dt_so FROM TABLE @gt_so.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
