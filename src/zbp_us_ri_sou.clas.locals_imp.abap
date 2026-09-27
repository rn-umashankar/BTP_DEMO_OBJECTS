CLASS lhc_ZUS_RI_SOU DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zus_ri_sou RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zus_ri_sou RESULT result.

    METHODS create FOR MODIFY
       entities FOR CREATE zus_ri_sou.

    METHODS update FOR MODIFY
       entities FOR UPDATE zus_ri_sou.

    METHODS delete FOR MODIFY
       keys FOR DELETE zus_ri_sou.

    METHODS read FOR READ
       keys FOR READ zus_ri_sou RESULT result.

    METHODS lock FOR LOCK
       keys FOR LOCK zus_ri_sou.

    METHODS rba_Item FOR READ
       keys_rba FOR READ zus_ri_sou\_Item FULL result_requested RESULT result LINK association_links.

    METHODS cba_Item FOR MODIFY
       entities_cba FOR CREATE zus_ri_sou\_Item.

ENDCLASS.

CLASS lhc_ZUS_RI_SOU IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.

    zcl_us_api_classs=>update(
      EXPORTING
        i_entities = entities
      CHANGING
        c_mapped   = mapped
        c_failed   = failed
        c_reported = reported
    ).
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Item.
  ENDMETHOD.

  METHOD cba_Item.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZUS_IE_SOITU DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
       entities FOR UPDATE zus_ie_soitu.

    METHODS delete FOR MODIFY
       keys FOR DELETE zus_ie_soitu.

    METHODS read FOR READ
       keys FOR READ zus_ie_soitu RESULT result.

    METHODS rba_Header FOR READ
       keys_rba FOR READ zus_ie_soitu\_Header FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZUS_IE_SOITU IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Header.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZUS_RI_SOU DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUS_RI_SOU IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.

    zcl_us_api_classs=>save(
      CHANGING
        c_reported = reported
    ).

  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
