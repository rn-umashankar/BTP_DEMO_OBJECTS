CLASS lhc_zus_RI_SO DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR zus_RI_SO RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zus_RI_SO RESULT result.
    METHODS validatesalesdats FOR VALIDATE ON SAVE
      keys FOR zus_RI_SO~validatesalesdats.

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

ENDCLASS.
