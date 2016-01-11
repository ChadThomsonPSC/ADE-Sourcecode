<?xml version="1.0" encoding="utf-8" ?>
<dataset Transactions="1"><dataset_header DatasetCode="RYCSO" DatasetObj="1004928896.09" DateFormat="mdy" DisableRI="yes" FullHeader="no" NumericDecimal="." NumericFormat="AMERICAN" NumericSeparator="," OriginatingSite="92" SCMManaged="yes" YearOffset="1950"/>
<dataset_records><dataset_transaction TransactionNo="1" TransactionType="DATA"><contained_record DB="icfdb" Table="ryc_smartobject" deletion_flag="no" entity_mnemonic="RYCSO" import_version_number_seq="16.709" key_field_value="123901.9875" record_version_obj="123902.9875" secondary_key_value="gsmssdynv#CHR(1)#0" version_date="08/19/2005" version_number_seq="16.709" version_time="52822" version_user="admin"><smartobject_obj>123901.9875</smartobject_obj>
<object_filename>gsmssdynv</object_filename>
<customization_result_obj>0</customization_result_obj>
<object_type_obj>1003498162</object_type_obj>
<product_module_obj>1004874683.09</product_module_obj>
<layout_obj>0</layout_obj>
<object_description>Dynamic viewer for gsm_security_structure</object_description>
<object_path>af/obj2</object_path>
<object_extension></object_extension>
<static_object>no</static_object>
<generic_object>no</generic_object>
<template_smartobject>no</template_smartobject>
<system_owned>no</system_owned>
<deployment_type></deployment_type>
<design_only>no</design_only>
<runnable_from_menu>no</runnable_from_menu>
<container_object>no</container_object>
<disabled>no</disabled>
<run_persistent>no</run_persistent>
<run_when>ANY</run_when>
<shutdown_message_text></shutdown_message_text>
<required_db_list></required_db_list>
<sdo_smartobject_obj>123888.9875</sdo_smartobject_obj>
<extends_smartobject_obj>0</extends_smartobject_obj>
<security_smartobject_obj>123901.9875</security_smartobject_obj>
<object_is_runnable>yes</object_is_runnable>
<contained_record DB="icfdb" Table="ryc_object_instance"><object_instance_obj>123905.9875</object_instance_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>3000021835.09</smartobject_obj>
<system_owned>no</system_owned>
<layout_position></layout_position>
<instance_name>disabled</instance_name>
<instance_description></instance_description>
<page_obj>0</page_obj>
<object_sequence>0</object_sequence>
</contained_record>
<contained_record DB="icfdb" Table="ryc_object_instance"><object_instance_obj>33</object_instance_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<system_owned>no</system_owned>
<layout_position></layout_position>
<instance_name>fiContainerClasses</instance_name>
<instance_description>Dynamic FILL-IN</instance_description>
<page_obj>0</page_obj>
<object_sequence>0</object_sequence>
</contained_record>
<contained_record DB="icfdb" Table="ryc_object_instance"><object_instance_obj>124068.9875</object_instance_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124048.9875</smartobject_obj>
<system_owned>no</system_owned>
<layout_position></layout_position>
<instance_name>instance_attribute_obj</instance_name>
<instance_description>SmartDataField of type DynLookup</instance_description>
<page_obj>0</page_obj>
<object_sequence>0</object_sequence>
</contained_record>
<contained_record DB="icfdb" Table="ryc_object_instance"><object_instance_obj>124080.9875</object_instance_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<system_owned>no</system_owned>
<layout_position></layout_position>
<instance_name>object_obj</instance_name>
<instance_description>SmartDataField of type DynLookup</instance_description>
<page_obj>0</page_obj>
<object_sequence>0</object_sequence>
</contained_record>
<contained_record DB="icfdb" Table="ryc_object_instance"><object_instance_obj>124074.9875</object_instance_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124003.9875</smartobject_obj>
<system_owned>no</system_owned>
<layout_position></layout_position>
<instance_name>product_module_obj</instance_name>
<instance_description>SmartDataField of type DynLookup</instance_description>
<page_obj>0</page_obj>
<object_sequence>0</object_sequence>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>3000052873.09</attribute_value_obj>
<object_type_obj>1003498162</object_type_obj>
<container_smartobject_obj>0</container_smartobject_obj>
<smartobject_obj>123901.9875</smartobject_obj>
<object_instance_obj>0</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>AppBuilderTabbing</attribute_label>
<character_value>Custom</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>no</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>41</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>BaseQueryString</attribute_label>
<character_value>FOR EACH gsc_object_type NO-LOCK, EACH ryc_smartobject NO-LOCK WHERE ryc_smartobject.object_type_obj = gsc_object_type.object_type_obj, EACH gsc_product_module NO-LOCK 
WHERE gsc_product_module.product_module_obj = ryc_smartobject.product_module_obj BY ryc_smartobject.object_filename</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>43</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>BrowseTitle</attribute_label>
<character_value>Lookup Container</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>39</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>COLUMN</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>66.6</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>123907.9875</attribute_value_obj>
<object_type_obj>1005091923.09</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>3000021835.09</smartobject_obj>
<object_instance_obj>123905.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>COLUMN</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>23.4</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124072.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124048.9875</smartobject_obj>
<object_instance_obj>124068.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>COLUMN</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>23.4</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124078.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124003.9875</smartobject_obj>
<object_instance_obj>124074.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>COLUMN</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>23.4</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124084.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>COLUMN</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>23.4</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124086.9875</attribute_value_obj>
<object_type_obj>1005091923.09</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>3000021835.09</smartobject_obj>
<object_instance_obj>123905.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ColumnLabel</attribute_label>
<character_value>Disabled</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>49</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ENABLED</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>53</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>FieldLabel</attribute_label>
<character_value>Container filename</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124069.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124048.9875</smartobject_obj>
<object_instance_obj>124068.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>FieldName</attribute_label>
<character_value>instance_attribute_obj</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124075.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124003.9875</smartobject_obj>
<object_instance_obj>124074.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>FieldName</attribute_label>
<character_value>product_module_obj</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124081.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>FieldName</attribute_label>
<character_value>object_obj</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>44</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>FieldTooltip</attribute_label>
<character_value>Press F4 for Lookup</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>36</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>FORMAT</attribute_label>
<character_value>X(400)</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>47</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>HIDDEN</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>yes</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>37</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>LABEL</attribute_label>
<character_value>Container classes (hidden)</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>11.709</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124048.9875</smartobject_obj>
<object_instance_obj>124068.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>MasterFile</attribute_label>
<character_value>adm2/dynlookup.w</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>12.709</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>MasterFile</attribute_label>
<character_value>adm2/dynlookup.w</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>13.709</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124003.9875</smartobject_obj>
<object_instance_obj>124074.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>MasterFile</attribute_label>
<character_value>adm2/dynlookup.w</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>123903.9875</attribute_value_obj>
<object_type_obj>1003498162</object_type_obj>
<container_smartobject_obj>0</container_smartobject_obj>
<smartobject_obj>123901.9875</smartobject_obj>
<object_instance_obj>0</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>MinHeight</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>4.86</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>123904.9875</attribute_value_obj>
<object_type_obj>1003498162</object_type_obj>
<container_smartobject_obj>0</container_smartobject_obj>
<smartobject_obj>123901.9875</smartobject_obj>
<object_instance_obj>0</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>MinWidth</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>81</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>123908.9875</attribute_value_obj>
<object_type_obj>1005091923.09</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>3000021835.09</smartobject_obj>
<object_instance_obj>123905.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>Order</attribute_label>
<character_value></character_value>
<integer_value>4</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124070.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124048.9875</smartobject_obj>
<object_instance_obj>124068.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>Order</attribute_label>
<character_value></character_value>
<integer_value>3</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124076.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124003.9875</smartobject_obj>
<object_instance_obj>124074.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>Order</attribute_label>
<character_value></character_value>
<integer_value>1</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124082.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>Order</attribute_label>
<character_value></character_value>
<integer_value>2</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>42</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ParentField</attribute_label>
<character_value>product_module_obj,fiContainerClasses</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>4864.6893</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ParentFilterQuery</attribute_label>
<character_value>LOOKUP(gsc_object_type.object_type_code, &quot;&amp;2&quot;) &gt; 0|ryc_smartobject.product_module_obj = DECIMAL(&apos;&amp;1&apos;)|</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>45</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>QueryTables</attribute_label>
<character_value>gsc_object_type,ryc_smartobject,gsc_product_module</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>34</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ROW</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>4.29</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>123906.9875</attribute_value_obj>
<object_type_obj>1005091923.09</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>3000021835.09</smartobject_obj>
<object_instance_obj>123905.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ROW</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>4.24</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124073.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124048.9875</smartobject_obj>
<object_instance_obj>124068.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ROW</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>3.19</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124079.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124003.9875</smartobject_obj>
<object_instance_obj>124074.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ROW</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>1</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124085.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ROW</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>2.1</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>38</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>ShowPopup</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124089.9875</attribute_value_obj>
<object_type_obj>1003498162</object_type_obj>
<container_smartobject_obj>0</container_smartobject_obj>
<smartobject_obj>123901.9875</smartobject_obj>
<object_instance_obj>0</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>SizeToFit</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>no</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>3000050253.09</attribute_value_obj>
<object_type_obj>1003498162</object_type_obj>
<container_smartobject_obj>0</container_smartobject_obj>
<smartobject_obj>123901.9875</smartobject_obj>
<object_instance_obj>0</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>SuperProcedure</attribute_label>
<character_value>af/obj2/gsmsssuprp.p</character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>50</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>TAB-STOP</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>52</attribute_value_obj>
<object_type_obj>473.99</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>15870.409</smartobject_obj>
<object_instance_obj>33</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>VISIBLE</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>0</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>123909.9875</attribute_value_obj>
<object_type_obj>1005091923.09</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>3000021835.09</smartobject_obj>
<object_instance_obj>123905.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>WIDTH-CHARS</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>26</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124071.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124048.9875</smartobject_obj>
<object_instance_obj>124068.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>WIDTH-CHARS</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>58</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124077.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124003.9875</smartobject_obj>
<object_instance_obj>124074.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>WIDTH-CHARS</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>58</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
<contained_record DB="icfdb" Table="ryc_attribute_value"><attribute_value_obj>124083.9875</attribute_value_obj>
<object_type_obj>1005097658.101</object_type_obj>
<container_smartobject_obj>123901.9875</container_smartobject_obj>
<smartobject_obj>124026.9875</smartobject_obj>
<object_instance_obj>124080.9875</object_instance_obj>
<constant_value>no</constant_value>
<attribute_label>WIDTH-CHARS</attribute_label>
<character_value></character_value>
<integer_value>0</integer_value>
<date_value>?</date_value>
<decimal_value>58</decimal_value>
<logical_value>no</logical_value>
<primary_smartobject_obj>123901.9875</primary_smartobject_obj>
<render_type_obj>0</render_type_obj>
<applies_at_runtime>yes</applies_at_runtime>
</contained_record>
</contained_record>
</dataset_transaction>
</dataset_records>
</dataset>