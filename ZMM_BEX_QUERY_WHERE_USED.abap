REPORT zmm_bex_query_where_used.

PARAMETERS: p_compid TYPE rszcompid,
            p_obv    TYPE rszhelp-objvers OBLIGATORY DEFAULT 'A'.

DATA:  lv_compuid         TYPE rsz_uid,
       lt_where_used_info TYPE rzd1_t_where_used_info.

SELECT SINGLE compuid FROM rsrrepdir INTO lv_compuid WHERE objvers = 'ACT' AND compid EQ p_compid.

CALL FUNCTION 'RSZ_DB_COMP_WHERE_USED'
  EXPORTING
    i_compuid           = lv_compuid
    i_objvers           = p_obv
  IMPORTING
    e_t_where_used_info = lt_where_used_info.
