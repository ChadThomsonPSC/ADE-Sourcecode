/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation ("PSC"),       *
* 14 Oak Park, Bedford, MA 01730, and other contributors as listed   *
* below.  All Rights Reserved.                                       *
*                                                                    *
* The Initial Developer of the Original Code is PSC.  The Original   *
* Code is Progress IDE code released to open source December 1, 2000.*
*                                                                    *
* The contents of this file are subject to the Possenet Public       *
* License Version 1.0 (the "License"); you may not use this file     *
* except in compliance with the License.  A copy of the License is   *
* available as of the date of this notice at                         *
* http://www.possenet.org/license.html                               *
*                                                                    *
* Software distributed under the License is distributed on an "AS IS"*
* basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. You*
* should refer to the License for the specific language governing    *
* rights and limitations under the License.                          *
*                                                                    *
* Contributors:                                                      *
*                                                                    *
*********************************************************************/
  FIELD product_code LIKE rym_wizard_menc.product_code VALIDATE ~
  FIELD product_module_code LIKE rym_wizard_menc.product_module_code VALIDATE ~
  FIELD object_name LIKE rym_wizard_menc.object_name VALIDATE ~
  FIELD object_description LIKE rym_wizard_menc.object_description VALIDATE ~
  FIELD window_title LIKE rym_wizard_menc.window_title VALIDATE ~
  FIELD generated_date LIKE rym_wizard_menc.generated_date VALIDATE ~
  FIELD generated_time LIKE rym_wizard_menc.generated_time VALIDATE ~
  FIELD wizard_menc_obj LIKE rym_wizard_menc.wizard_menc_obj VALIDATE ~
  FIELD generated_time_str AS CHARACTER FORMAT "x(8)" LABEL "Time"
