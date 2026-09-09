CLASS zcl_us_dataentry_2level DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES:
      if_oo_adt_classrun.

    METHODS:
* Flush the data from the table before each execution
      refresh,
* Enter data in Master Tables
      enter_master_data,

* Enter Data in Transactional Tables
      enter_transactional_Data.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_us_dataentry_2level IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    CALL METHOD refresh.

    CALL METHOD enter_master_data.

    CALL METHOD enter_transactional_data.


* If everything is successful display the message
    out->write(
      EXPORTING
        data   = 'Data Entered Successfully'
    ).


  ENDMETHOD.

  METHOD refresh.

    DELETE FROM : zvkfeb01_dt_so, zvkfeb01_dt_soit, zvkfeb01_dt_prod, zvkfeb01_dt_cust.

  ENDMETHOD.


  METHOD enter_master_data.

    DATA: li_prod TYPE TABLE OF zvkfeb01_dt_prod,
          ls_prod TYPE zvkfeb01_dt_prod,
          li_cust TYPE TABLE OF zvkfeb01_dt_cust,
          ls_cust TYPE zvkfeb01_dt_cust.

    "--------------------------------------------------------------------------------------------------
    "Product
    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 1000000
        max  = 9000000
      RECEIVING
        prng = DATA(lobj_prod).

    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'Pen'
                    price   = '12'
                    currency = 'INR'
                  ) TO li_prod.

    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'Pencil'
                    price   = '2'
                    currency = 'INR'
                  ) TO li_prod.


    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'Compass Box'
                    price   = '121'
                    currency = 'INR'
                  ) TO li_prod.

    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'Drafter'
                    price   = '2'
                    currency = 'EUR'
                  ) TO li_prod.

    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'Laptop'
                    price   = '1200'
                    currency = 'EUR'
                  ) TO li_prod.

    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'Hard-Disk'
                    price   = '20'
                    currency = 'EUR'
                  ) TO li_prod.


    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'RAM'
                    price   = '120'
                    currency = 'USD'
                  ) TO li_prod.

    APPEND VALUE #(
                    prod_id = lobj_prod->get_next( )
                    descpt  = 'Mouse'
                    price   = '20'
                    currency = 'USD'
                  ) TO li_prod.


    INSERT zvkfeb01_dt_prod FROM TABLE @li_prod.

    "--------------------------------------------------------------------------------------------------
    "Customer

    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 100000000
        max  = 900000000
      RECEIVING
        prng = DATA(lobj_cust).

    APPEND VALUE #(
                    cust_id = lobj_prod->get_next( )
                    name    = 'Vishal'
                    company_name = 'Tech'
                    country = 'IN'
                    city = 'Hyd'
                    mobile = 231423289
                  ) TO li_cust.

    APPEND VALUE #(
                    cust_id = lobj_prod->get_next( )
                    name    = 'Rohit'
                    company_name = 'FineDines'
                    country = 'IN'
                    city = 'Pune'
                    mobile = 23145789
                  ) TO li_cust.

    APPEND VALUE #(
                    cust_id = lobj_prod->get_next( )
                    name    = 'AJ'
                    company_name = 'AnyAnalytics'
                    country = 'IN'
                    city = 'Hyd'
                    mobile = 2314789
                  ) TO li_cust.

    APPEND VALUE #(
                    cust_id = lobj_prod->get_next( )
                    name    = 'Rahul'
                    company_name = 'ABC Corps'
                    country = 'IN'
                    city = 'Delhi'
                    mobile = 231434789
                  ) TO li_cust.


    APPEND VALUE #(
                    cust_id = lobj_prod->get_next( )
                    name    = 'Virat'
                    company_name = 'IT Multi'
                    country = 'IN'
                    city = 'Mum'
                    mobile = 231434789
                  ) TO li_cust.

    APPEND VALUE #(
                    cust_id = lobj_prod->get_next( )
                    name    = 'Suraya'
                    company_name = 'IndexIT'
                    country = 'IN'
                    city = 'Mum'
                    mobile = 231412789
                  ) TO li_cust.


    INSERT zvkfeb01_dt_cust FROM TABLE @li_cust.

  ENDMETHOD.


  METHOD enter_transactional_data.

    DATA:
      li_so   TYPE TABLE OF zvkfeb01_dt_so,
      li_soit TYPE TABLE OF zvkfeb01_dt_soit.

    SELECT
        prod_id,
        price,
        currency
      FROM zvkfeb01_dt_prod
      INTO TABLE @DATA(li_prod).

    SELECT
      cust_id
      FROM zvkfeb01_dt_cust
      INTO TABLE @DATA(li_cust).



    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 4000000
        max  = 4999999
      RECEIVING
        prng = DATA(lobj_prng_so).

    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 40000
        max  = 49999
      RECEIVING
        prng = DATA(lobj_prng_soit).

    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 100000
        max  = 299999
      RECEIVING
        prng = DATA(lobj_prng_dlv).


    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 8000000
        max  = 9999999
      RECEIVING
        prng = DATA(lobj_prng_inv).


    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 1
        max  = 6
      RECEIVING
        prng = DATA(lobj_cust_count).

    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 1
        max  = 8
      RECEIVING
        prng = DATA(lobj_prod_count).

    CALL METHOD cl_abap_random_int=>create
      EXPORTING
        min  = 1
        max  = 3
      RECEIVING
        prng = DATA(lobj_item_count).


    DO 10 TIMES.
      "--------------------------------------------------------------------------------------------------
      "Sales Order Header
      DATA(lv_soid) = lobj_prng_so->get_next( ).

      DATA(lv_p_count) = lobj_cust_count->get_next( ).

      cl_abap_tstmp=>timet_to_tstmp(
        EXPORTING
          time_t               = '123456'
        RECEIVING
          r_tstmp              = DATA(lv_timestmp_created)
      ).

      cl_abap_tstmp=>timet_to_tstmp(
        EXPORTING
          time_t               = '773456'
        RECEIVING
          r_tstmp              = DATA(lv_timestmp_changed)
      ).

      DATA(lv_url) = |https://m.media-amazon.com/images/I/71BLNfkRZ3L._UF1000,1000_QL80_.jpg|
                     &&
                     |Google_Images_2015_logo.svg/640px-Google_Images_2015_logo.svg.png|.

      APPEND VALUE #(
          soid = lv_soid
          buyer = li_cust[ lv_p_count ]-cust_id
          sales_person = 'Operator'
          Sales_manager = 'Rocket Singh'
          created_by = 'CB9980005587'
          created_on = lv_timestmp_created
          changed_by = 'CB9980005587'
          changed_on = lv_timestmp_changed
          url = lv_url

)
TO li_so.

      INSERT zvkfeb01_dt_so FROM TABLE @li_so.

      DO 3 TIMES.
        "--------------------------------------------------------------------------------------------------
        "Sales Order Item
        DATA(lv_item) = lobj_prng_soit->get_next( ).

        DATA(lv_c_count) = lobj_prod_count->get_next( ).


        DATA: image_item TYPE string.
        CASE sy-index.
          WHEN 1.
            image_item = 'https://m.media-amazon.com/images/I/71uPkyrlipL.jpg'.
          WHEN 2.
            image_item  = |https://m.media-amazon.com/images/I/510uTHyDqGL|
                            &&
                          |._UF1000,1000_QL80_.jpg|.
          WHEN 3.
            image_item = |https://m.media-amazon.com/images/I/61SLsEHoOkL|
                            &&
                         |._AC_UF1000,1000_QL80_.jpg|.

        ENDCASE.

        APPEND VALUE #(
                        soid = lv_soid
                        item_id = lv_item
                        product = li_prod[ lv_c_count ]-prod_id
                        amount = li_prod[ lobj_prod_count->get_next( ) ]-price
                        currency = li_prod[ lobj_prod_count->get_next( ) ]-currency
                        changed_by = 'CB9980005587'
*                        image_item = image_item
                      )
                      TO li_soit.

        CLEAR image_item.



        INSERT zvkfeb01_dt_soit FROM TABLE @li_soit.
        CLEAR li_soit.



      ENDDO.


      CLEAR: lv_soid,li_so,li_soit.
    ENDDO.
  ENDMETHOD.


ENDCLASS.

