<?xml version="1.0" encoding="ISO8859-1" ?>
<dataset Transactions="4" version_date="02/23/2002" version_time="43071" version_user="admin" entity_mnemonic="GSTDF" key_field_value="3000000447.09" record_version_obj="3000000448.09" version_number_seq="2.09" import_version_number_seq="1.09"><dataset_header DisableRI="yes" DatasetObj="1007600209.08" DateFormat="mdy" FullHeader="yes" SCMManaged="no" YearOffset="1950" DatasetCode="GSMST" DateCreated="02/23/2002" TimeCreated="11:57:51" NumericFormat="AMERICAN" NumericDecimal="." OriginatingSite="93" NumericSeparator=","><deploy_dataset_obj>1007600209.08</deploy_dataset_obj>
<owner_site_code></owner_site_code>
<dataset_code>GSMST</dataset_code>
<dataset_description>gsm_status</dataset_description>
<disable_ri>yes</disable_ri>
<source_code_data>no</source_code_data>
<deploy_full_data>yes</deploy_full_data>
<xml_generation_procedure></xml_generation_procedure>
<default_ado_filename></default_ado_filename>
<dataset_entity><dataset_entity_obj>1007600210.08</dataset_entity_obj>
<deploy_dataset_obj>1007600209.08</deploy_dataset_obj>
<entity_sequence>1</entity_sequence>
<entity_mnemonic>GSMST</entity_mnemonic>
<primary_entity>yes</primary_entity>
<join_entity_mnemonic></join_entity_mnemonic>
<join_field_list>status_obj</join_field_list>
<filter_where_clause></filter_where_clause>
<delete_related_records>yes</delete_related_records>
<overwrite_records>yes</overwrite_records>
<keep_own_site_data>no</keep_own_site_data>
<entity_mnemonic_description>gsm_status</entity_mnemonic_description>
<entity_dbname>icfdb</entity_dbname>
</dataset_entity>
<dataset_entity><dataset_entity_obj>1007600211.08</dataset_entity_obj>
<deploy_dataset_obj>1007600209.08</deploy_dataset_obj>
<entity_sequence>2</entity_sequence>
<entity_mnemonic>GSMSH</entity_mnemonic>
<primary_entity>no</primary_entity>
<join_entity_mnemonic>GSMST</join_entity_mnemonic>
<join_field_list>status_obj,status_obj</join_field_list>
<filter_where_clause></filter_where_clause>
<delete_related_records>yes</delete_related_records>
<overwrite_records>yes</overwrite_records>
<keep_own_site_data>no</keep_own_site_data>
<entity_mnemonic_description>gsm_status_history</entity_mnemonic_description>
<entity_dbname>icfdb</entity_dbname>
</dataset_entity>
<table_definition><name>gsm_status</name>
<dbname>ICFDB</dbname>
<index-1>XAK1gsm_status,1,0,0,category_obj,0,status_seq,0</index-1>
<index-2>XAK2gsm_status,1,0,0,category_obj,0,status_tla,0</index-2>
<index-3>XIE1gsm_status,0,0,0,category_obj,0,status_description,0</index-3>
<index-4>XIE2gsm_status,0,0,0,category_obj,0,status_short_desc,0</index-4>
<index-5>XPKgsm_status,1,1,0,status_obj,0</index-5>
<field><name>status_obj</name>
<data-type>decimal</data-type>
<extent>0</extent>
<format>>>>>>>>>>>>>>>>>>9.999999999</format>
<initial>                 0.000000000</initial>
<label>Status Obj</label>
<column-label>Status Obj</column-label>
</field>
<field><name>category_obj</name>
<data-type>decimal</data-type>
<extent>0</extent>
<format>>>>>>>>>>>>>>>>>>9.999999999</format>
<initial>                 0.000000000</initial>
<label>Category Obj</label>
<column-label>Category Obj</column-label>
</field>
<field><name>status_seq</name>
<data-type>integer</data-type>
<extent>0</extent>
<format>->>9</format>
<initial>   0</initial>
<label>Status Seq.</label>
<column-label>Status Seq.</column-label>
</field>
<field><name>status_tla</name>
<data-type>character</data-type>
<extent>0</extent>
<format>X(3)</format>
<initial></initial>
<label>Status TLA</label>
<column-label>Status TLA</column-label>
</field>
<field><name>status_short_desc</name>
<data-type>character</data-type>
<extent>0</extent>
<format>X(15)</format>
<initial></initial>
<label>Status Short Description</label>
<column-label>Status Short Desc</column-label>
</field>
<field><name>status_description</name>
<data-type>character</data-type>
<extent>0</extent>
<format>X(35)</format>
<initial></initial>
<label>Status Description</label>
<column-label>Status Description</column-label>
</field>
<field><name>retain_status_history</name>
<data-type>logical</data-type>
<extent>0</extent>
<format>YES/NO</format>
<initial>NO </initial>
<label>Retain Status History</label>
<column-label>Retain Status History</column-label>
</field>
<field><name>system_owned</name>
<data-type>logical</data-type>
<extent>0</extent>
<format>YES/NO</format>
<initial>NO </initial>
<label>System Owned</label>
<column-label>System Owned</column-label>
</field>
<field><name>auto_display</name>
<data-type>logical</data-type>
<extent>0</extent>
<format>YES/NO</format>
<initial>NO </initial>
<label>Auto Display</label>
<column-label>Auto Display</column-label>
</field>
</table_definition>
<table_definition><name>gsm_status_history</name>
<dbname>ICFDB</dbname>
<index-1>XAK1gsm_status_history,1,0,0,status_obj,0,owning_obj,0,from_date,0</index-1>
<index-2>XAK2gsm_status_history,1,0,0,status_history_obj,0</index-2>
<index-3>XIE1gsm_status_history,0,0,0,owning_obj,0,from_date,0</index-3>
<index-4>XPKgsm_status_history,1,1,0,owning_obj,0,from_date,0,status_obj,0</index-4>
<field><name>owning_obj</name>
<data-type>decimal</data-type>
<extent>0</extent>
<format>>>>>>>>>>>>>>>>>>9.999999999</format>
<initial>                 0.000000000</initial>
<label>Owning Obj</label>
<column-label>Owning Obj</column-label>
</field>
<field><name>from_date</name>
<data-type>date</data-type>
<extent>0</extent>
<format>99/99/9999</format>
<initial></initial>
<label>From Date</label>
<column-label>From Date</column-label>
</field>
<field><name>status_obj</name>
<data-type>decimal</data-type>
<extent>0</extent>
<format>>>>>>>>>>>>>>>>>>9.999999999</format>
<initial>                 0.000000000</initial>
<label>Status Obj</label>
<column-label>Status Obj</column-label>
</field>
<field><name>to_date</name>
<data-type>date</data-type>
<extent>0</extent>
<format>99/99/9999</format>
<initial></initial>
<label>to Date</label>
<column-label>to Date</column-label>
</field>
<field><name>status_history_obj</name>
<data-type>decimal</data-type>
<extent>0</extent>
<format>>>>>>>>>>>>>>>>>>9.999999999</format>
<initial>                 0.000000000</initial>
<label>Status History Obj</label>
<column-label>Status History Obj</column-label>
</field>
</table_definition>
</dataset_header>
<dataset_records><dataset_transaction TransactionNo="1"><contained_record DB="ICFDB" Table="gsm_status"><status_obj>2122131</status_obj>
<category_obj>2122116</category_obj>
<status_seq>1</status_seq>
<status_tla>HST</status_tla>
<status_short_desc>New Status hist</status_short_desc>
<status_description>New Status history flag</status_description>
<retain_status_history>yes</retain_status_history>
<system_owned>no</system_owned>
<auto_display>no</auto_display>
<contained_record DB="ICFDB" Table="gsm_status_history"><owning_obj>249</owning_obj>
<from_date>06/20/00</from_date>
<status_obj>2122131</status_obj>
<to_date>?</to_date>
<status_history_obj>1003548059</status_history_obj>
</contained_record>
</contained_record>
</dataset_transaction>
<dataset_transaction TransactionNo="2"><contained_record DB="ICFDB" Table="gsm_status"><status_obj>2124893</status_obj>
<category_obj>2122116</category_obj>
<status_seq>2</status_seq>
<status_tla>ANT</status_tla>
<status_short_desc>Another Flag</status_short_desc>
<status_description>Another Flag</status_description>
<retain_status_history>yes</retain_status_history>
<system_owned>no</system_owned>
<auto_display>no</auto_display>
</contained_record>
</dataset_transaction>
<dataset_transaction TransactionNo="3"><contained_record DB="ICFDB" Table="gsm_status"><status_obj>2292399</status_obj>
<category_obj>2122116</category_obj>
<status_seq>0</status_seq>
<status_tla>HLD</status_tla>
<status_short_desc>Hold Batch/Tran</status_short_desc>
<status_description>Hold Batch/Transaction</status_description>
<retain_status_history>yes</retain_status_history>
<system_owned>no</system_owned>
<auto_display>no</auto_display>
<contained_record DB="ICFDB" Table="gsm_status_history"><owning_obj>250140</owning_obj>
<from_date>06/27/00</from_date>
<status_obj>2292399</status_obj>
<to_date>?</to_date>
<status_history_obj>1003581391</status_history_obj>
</contained_record>
</contained_record>
</dataset_transaction>
<dataset_transaction TransactionNo="4"><contained_record DB="ICFDB" Table="gsm_status"><status_obj>2292439</status_obj>
<category_obj>2292438</category_obj>
<status_seq>0</status_seq>
<status_tla>HLD</status_tla>
<status_short_desc>Hld Transaction</status_short_desc>
<status_description>Account Transaction Hold</status_description>
<retain_status_history>yes</retain_status_history>
<system_owned>no</system_owned>
<auto_display>no</auto_display>
</contained_record>
</dataset_transaction>
</dataset_records>
</dataset>