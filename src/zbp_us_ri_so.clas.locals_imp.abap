CLASS lhc_zus_RI_SO DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zus_RI_SO RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zus_RI_SO RESULT result.
    METHODS validatesalesdats FOR VALIDATE ON SAVE
      keys FOR zus_RI_SO~validatesalesdats.
    METHODS determineappdata FOR DETERMINE ON SAVE
      keys FOR zus_RI_SO~determineappdata.
    METHODS get_instance_features FOR INSTANCE FEATURES
      keys REQUEST requested_features FOR zus_RI_SO RESULT result.

    METHODS customaction FOR MODIFY
      keys FOR ACTION zus_RI_SO~customaction RESULT result.
*    METHODS setbuyer FOR VALIDATE ON SAVE
*      keys FOR zus_RI_SO~setbuyer.

ENDCLASS.

CLASS lhc_zus_RI_SO IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validatesalesdats.
    READ ENTITIES OF ZUS_RI_SO IN LOCAL MODE
        ENTITY ZUS_RI_SO
        FIELDS ( SalesTimestamp )
        WITH CORRESPONDING #( Keys )
        RESULT DATA(li_result)
        FAILED DATA(li_failed).

    LOOP AT li_result INTO DATA(ls_result).
        CONVERT TIME STAMP ls_result-SalesTimestamp TIME ZONE sy-zonlo
            INTO DATE DATA(lv_date) TIME DATA(lv_time).

        IF  lv_date < sy-datum.
            APPEND VALUE #(
                    %Key = ls_result-%key
                    %msg = new_message_with_text(
                        severity = if_abap_behv_message=>severity-error
                        text     = 'Date is in the past'
                    )

            ) TO reported-zus_ri_so.
        ENDIF.
    ENDLOOP.


  ENDMETHOD.

  METHOD determineappdata.

    READ ENTITIES OF ZUS_RI_SO IN LOCAL MODE
        ENTITY ZUS_RI_SO
        ALL FIELDS
        WITH CORRESPONDING #( Keys )
        RESULT DATA(li_result) .

    LOOP AT li_result INTO DATA(ls_result).

        CONVERT TIME STAMP ls_result-SalesTimestamp TIME ZONE sy-zonlo
            INTO DATE DATA(lv_date) TIME DATA(lv_time).

        lv_date = lv_date + 3.

        CONVERT DATE lv_date TIME sy-timlo INTO TIME STAMP DATA(lv_timestamp)
            TIME ZONE sy-zonlo.

        MODIFY ENTITIES OF zus_ri_so IN LOCAL MODE
            ENTITY zus_ri_so
            UPDATE FIELDS ( ApprovalTimestamp )
            WITH VALUE #(
                        ( %key = ls_result-%key ApprovalTimestamp = lv_timestamp )
                        ).

    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF zus_ri_so IN LOCAL MODE
        ENTITY zus_ri_so
        FIELDS ( ApprovalTimestamp )
        WITH CORRESPONDING #(  keys )
        RESULT DATA(li_output).

    result = VALUE #(
                        FOR ls_output IN li_output
                        LET localvariable =
                            COND #(
                                    WHEN ls_output-ApprovalTimestamp IS INITIAL
                                        Then '00'
                                    ELSE
                                        '01'
                                  )
                        IN ( %key = ls_output-%key %action-customaction = localvariable )
                      ).
  ENDMETHOD.

  METHOD customaction.
    MODIFY ENTITIES OF zus_ri_so IN LOCAL MODE
        ENTITY zus_ri_so
        UPDATE FIELDS ( ApprovalTimestamp )
        WITH VALUE #( FOR ls_keys IN keys
                        ( %key = ls_keys-%key ApprovalTimestamp = 010101000001 )
        ) .

    READ ENTITIES OF zus_ri_so IN LOCAL MODE
        ENTITY zus_ri_so
        ALL FIELDS
        WITH CORRESPONDING #(  keys )
        RESULT DATA(li_output).

    result = VALUE #( FOR ls_output IN li_output
                        ( %key = ls_output-%key %param = ls_output )
                       ).
  ENDMETHOD.

*  METHOD setbuyer.
*    READ ENTITIES OF zus_ri_so IN LOCAL MODE
*        ENTITY zus_ri_so
*        FIELDS ( Buyer )
*        WITH CORRESPONDING #(  keys )
*        RESULT DATA(li_output).
*
*    MODIFY ENTITIES OF zus_ri_so IN LOCAL MODE
*        ENTITY zus_ri_so
*        UPDATE FIELDS ( Buyer )
*        WITH VALUE #( FOR ls_output IN li_output
*                        ( %key = ls_output-%key Buyer = sy-uname )
*
*                     )  .
*  ENDMETHOD.

ENDCLASS.
