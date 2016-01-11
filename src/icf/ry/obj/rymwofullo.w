&ANALYZE-SUSPEND _VERSION-NUMBER AB_v9r12 GUI ADM2
&ANALYZE-RESUME
/* Connected Databases 
          rydb             PROGRESS
*/
&Scoped-define WINDOW-NAME CURRENT-WINDOW
{adecomm/appserv.i}
DEFINE VARIABLE h_Astra                    AS HANDLE          NO-UNDO.
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Update-Object-Version" dTables _INLINE
/* Actions: ? ? ? ? af/sup/afverxftrp.p */
/* This has to go above the definitions sections, as that is what it modifies.
   If its not, then the definitions section will have been saved before the
   XFTR code kicks in and changes it */
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Definition Comments Wizard" dTables _INLINE
/* Actions: ? af/cod/aftemwizcw.w ? ? ? */
/* Program Definition Comment Block Wizard
Welcome to the Program Definition Comment Block Wizard. Press Next to proceed.
af/cod/aftemwizpw.w
*/
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "SmartDataObjectWizard" dTables _INLINE
/* Actions: ? af/cod/aftemwizcw.w ? ? ? */
/* SmartDataObject Wizard
Welcome to the SmartDataObject Wizard! During the next few steps, the wizard will lead you through creating a SmartDataObject. You will define the query that you will use to retrieve data from your database(s) and define a set of field values to make available to visualization objects. Press Next to proceed.
adm2/support/_wizqry.w,adm2/support/_wizfld.w 
*/
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS dTables 
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
/*---------------------------------------------------------------------------------
  File: rymwofullo.w

  Description:  Object Controller Wizard SDO

  Purpose:      Object Controller Wizard SDO

  Parameters:   <none>

  History:
  --------
  (v:010000)    Task:        6199   UserRef:    
                Date:   30/06/2000  Author:     Anthony Swindells

  Update Notes: Created from Template rysttasdoo.w

---------------------------------------------------------------------------------*/
/*                   This .W file was created with the Progress UIB.             */
/*-------------------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* MIP-GET-OBJECT-VERSION pre-processors
   The following pre-processors are maintained automatically when the object is
   saved. They pull the object and version from Roundtable if possible so that it
   can be displayed in the about window of the container */

&scop object-name       rymwofullo.w
DEFINE VARIABLE lv_this_object_name AS CHARACTER INITIAL "{&object-name}":U NO-UNDO.
&scop object-version    010001

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

/* Astra 2 object identifying preprocessor */
&glob   astra2-staticSmartDataObject yes

{af/sup2/afglobals.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE SmartDataObject
&Scoped-define DB-AWARE yes

&Scoped-define ADM-SUPPORTED-LINKS Data-Source,Data-Target,Navigation-Target,Update-Target,Commit-Target,Filter-Target


/* Db-Required definitions. */
&IF DEFINED(DB-REQUIRED) = 0 &THEN
    &GLOBAL-DEFINE DB-REQUIRED TRUE
&ENDIF
&GLOBAL-DEFINE DB-REQUIRED-START   &IF {&DB-REQUIRED} &THEN
&GLOBAL-DEFINE DB-REQUIRED-END     &ENDIF

&Scoped-define QUERY-NAME Query-Main

/* Internal Tables (found by Frame, Query & Browse Queries)             */
&Scoped-define INTERNAL-TABLES rym_wizard_objc

/* Definitions for QUERY Query-Main                                     */
&Scoped-Define ENABLED-FIELDS  product_code product_module_code object_name object_description~
 window_title window_title_field sdo_name query_sdo_name sdo_foreign_fields~
 viewer_name browser_name custom_super_procedure browser_toolbar_parent_menu~
 launch_container page_layout
&Scoped-define ENABLED-FIELDS-IN-rym_wizard_objc product_code ~
product_module_code object_name object_description window_title ~
window_title_field sdo_name query_sdo_name sdo_foreign_fields viewer_name ~
browser_name custom_super_procedure browser_toolbar_parent_menu ~
launch_container page_layout 
&Scoped-Define DATA-FIELDS  product_code product_module_code object_name object_description~
 window_title window_title_field sdo_name query_sdo_name sdo_foreign_fields~
 viewer_name browser_name custom_super_procedure browser_toolbar_parent_menu~
 launch_container page_layout generated_date generated_time~
 generated_time_str wizard_objc_obj
&Scoped-define DATA-FIELDS-IN-rym_wizard_objc product_code ~
product_module_code object_name object_description window_title ~
window_title_field sdo_name query_sdo_name sdo_foreign_fields viewer_name ~
browser_name custom_super_procedure browser_toolbar_parent_menu ~
launch_container page_layout generated_date generated_time wizard_objc_obj 
&Scoped-Define MANDATORY-FIELDS 
&Scoped-Define APPLICATION-SERVICE 
&Scoped-Define ASSIGN-LIST 
&Scoped-Define DATA-FIELD-DEFS "ry/obj/rymwofullo.i"
{&DB-REQUIRED-START}
&Scoped-define OPEN-QUERY-Query-Main OPEN QUERY Query-Main FOR EACH rym_wizard_objc NO-LOCK ~
    BY rym_wizard_objc.product_code ~
       BY rym_wizard_objc.product_module_code ~
        BY rym_wizard_objc.object_name INDEXED-REPOSITION.
{&DB-REQUIRED-END}
&Scoped-define TABLES-IN-QUERY-Query-Main rym_wizard_objc
&Scoped-define FIRST-TABLE-IN-QUERY-Query-Main rym_wizard_objc


/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

{&DB-REQUIRED-START}

/* Query definitions                                                    */
&ANALYZE-SUSPEND
DEFINE QUERY Query-Main FOR 
      rym_wizard_objc SCROLLING.
&ANALYZE-RESUME
{&DB-REQUIRED-END}


/* ************************  Frame Definitions  *********************** */


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: SmartDataObject
   Allow: Query
   Frames: 0
   Add Fields to: Neither
   Other Settings: PERSISTENT-ONLY COMPILE APPSERVER DB-AWARE
 */

/* This procedure should always be RUN PERSISTENT.  Report the error,  */
/* then cleanup and return.                                            */
IF NOT THIS-PROCEDURE:PERSISTENT THEN DO:
  MESSAGE "{&FILE-NAME} should only be RUN PERSISTENT.":U
          VIEW-AS ALERT-BOX ERROR BUTTONS OK.
  RETURN.
END.

&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW dTables ASSIGN
         HEIGHT             = 1.62
         WIDTH              = 46.6.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _INCLUDED-LIB dTables 
/* ************************* Included-Libraries *********************** */

{src/adm2/data.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME




/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW dTables
  VISIBLE,,RUN-PERSISTENT                                               */
/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK QUERY Query-Main
/* Query rebuild information for SmartDataObject Query-Main
     _TblList          = "RYDB.rym_wizard_objc"
     _Options          = "NO-LOCK INDEXED-REPOSITION"
     _TblOptList       = ","
     _OrdList          = "RYDB.rym_wizard_objc.product_code|yes,RYDB.rym_wizard_objc.product_module_code|yes,RYDB.rym_wizard_objc.object_name|yes"
     _FldNameList[1]   > RYDB.rym_wizard_objc.product_code
"product_code" "product_code" ? ? "character" ? ? ? ? ? ? yes ? no 13 yes
     _FldNameList[2]   > RYDB.rym_wizard_objc.product_module_code
"product_module_code" "product_module_code" ? ? "character" ? ? ? ? ? ? yes ? no 20.6 yes
     _FldNameList[3]   > RYDB.rym_wizard_objc.object_name
"object_name" "object_name" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[4]   > RYDB.rym_wizard_objc.object_description
"object_description" "object_description" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[5]   > RYDB.rym_wizard_objc.window_title
"window_title" "window_title" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[6]   > RYDB.rym_wizard_objc.window_title_field
"window_title_field" "window_title_field" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[7]   > RYDB.rym_wizard_objc.sdo_name
"sdo_name" "sdo_name" "Data Object Name" ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[8]   > RYDB.rym_wizard_objc.query_sdo_name
"query_sdo_name" "query_sdo_name" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[9]   > RYDB.rym_wizard_objc.sdo_foreign_fields
"sdo_foreign_fields" "sdo_foreign_fields" ? ? "character" ? ? ? ? ? ? yes ? no 70 yes
     _FldNameList[10]   > RYDB.rym_wizard_objc.viewer_name
"viewer_name" "viewer_name" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[11]   > RYDB.rym_wizard_objc.browser_name
"browser_name" "browser_name" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[12]   > RYDB.rym_wizard_objc.custom_super_procedure
"custom_super_procedure" "custom_super_procedure" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[13]   > RYDB.rym_wizard_objc.browser_toolbar_parent_menu
"browser_toolbar_parent_menu" "browser_toolbar_parent_menu" "Toolbar Parent Menu" ? "character" ? ? ? ? ? ? yes ? no 28.2 yes
     _FldNameList[14]   > RYDB.rym_wizard_objc.launch_container
"launch_container" "launch_container" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[15]   > RYDB.rym_wizard_objc.page_layout
"page_layout" "page_layout" ? ? "character" ? ? ? ? ? ? yes ? no 35 yes
     _FldNameList[16]   > RYDB.rym_wizard_objc.generated_date
"generated_date" "generated_date" ? ? "date" ? ? ? ? ? ? no ? no 15.2 yes
     _FldNameList[17]   > RYDB.rym_wizard_objc.generated_time
"generated_time" "generated_time" ? ? "integer" ? ? ? ? ? ? no ? no 15.2 yes
     _FldNameList[18]   > "_<CALC>"
"STRING (RowObject.generated_time,'HH:MM:SS')" "generated_time_str" "Time" "x(8)" "character" ? ? ? ? ? ? no ? no 8 no
     _FldNameList[19]   > RYDB.rym_wizard_objc.wizard_objc_obj
"wizard_objc_obj" "wizard_objc_obj" ? ? "decimal" ? ? ? ? ? ? no ? no 21.6 yes
     _Design-Parent    is WINDOW dTables @ ( 1.14 , 2.6 )
*/  /* QUERY Query-Main */
&ANALYZE-RESUME




&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK dTables 


/* ***************************  Main Block  *************************** */

  &IF DEFINED(UIB_IS_RUNNING) <> 0 &THEN          
    RUN initializeObject.
  &ENDIF

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE DATA.CALCULATE dTables  DATA.CALCULATE
PROCEDURE DATA.CALCULATE :
/*------------------------------------------------------------------------------
  Purpose:     Calculate all the Calculated Expressions found in the
               SmartDataObject.
  Parameters:  <none>
------------------------------------------------------------------------------*/
      ASSIGN 
         rowObject.generated_time_str = (STRING (RowObject.generated_time,'HH:MM:SS'))
      .

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI dTables  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Hide all frames. */
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

{&DB-REQUIRED-START}

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE preTransactionValidate dTables  _DB-REQUIRED
PROCEDURE preTransactionValidate :
/*------------------------------------------------------------------------------
  Purpose:     To perform validation that requires access to the database but
               that can occur before the transaction has started.
  Parameters:  <none>
  Notes:       Batch up errors using a chr(3) delimiter and be sure not to leave
               the error status raised.
------------------------------------------------------------------------------*/

DEFINE VARIABLE cMessageList                  AS CHARACTER  NO-UNDO.
DEFINE VARIABLE cText                         AS CHARACTER  NO-UNDO.

FOR EACH RowObjUpd WHERE LOOKUP(RowObjUpd.RowMod,"A,C,U":U) <> 0:

  /* ensure object name specified is unique */
  IF (RowObjUpd.RowMod = "U":U AND
      CAN-FIND(FIRST rym_wizard_objc
               WHERE rym_wizard_objc.OBJECT_name = RowObjUpd.OBJECT_name
                 AND ROWID(rym_wizard_objc) <> TO-ROWID(RowObjUpd.ROWIDent))) OR 
     (RowObjUpd.RowMod <> "U":U AND
      CAN-FIND(FIRST rym_wizard_objc
               WHERE rym_wizard_objc.OBJECT_name = RowObjUpd.OBJECT_name))  THEN
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
           {af/sup2/aferrortxt.i 'AF' '8' 'rym_wizard_objc' 'object_name' "'object name'" RowObjUpd.OBJECT_name "'. Please use a different object name'"}
           .

  /* ensure product code is valid */
  IF NOT CAN-FIND(FIRST gsc_product
                  WHERE gsc_product.product_code = RowObjUpd.product_code) THEN
  DO:
    ASSIGN cText = ". The product code: " + rowObjUpd.product_code + " does not exist.".  
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
           {af/sup2/aferrortxt.i 'AF' '5' 'rym_wizard_objc' 'product_code' "'product code'" cText}
           .

  END.

  /* ensure product module code is valid */
  IF NOT CAN-FIND(FIRST gsc_product_module
                  WHERE gsc_product_module.product_module_code = RowObjUpd.product_module_code) THEN
  DO:
    ASSIGN cText = ". The product module code: " + rowObjUpd.product_module_code + " does not exist.".  
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
           {af/sup2/aferrortxt.i 'AF' '5' 'rym_wizard_objc' 'product_module_code' "'product module code'" cText}
           .
  END.

  /* ensure page layout is valid */
  IF RowObjUpd.PAGE_layout <> "":U AND
     NOT CAN-FIND(FIRST ryc_layout
                  WHERE ryc_layout.layout_name = RowObjUpd.PAGE_layout) THEN
  DO:
    ASSIGN cText = ". The layout name: " + RowObjUpd.PAGE_layout + " does not exist.".  
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
           {af/sup2/aferrortxt.i 'AF' '5' 'rym_wizard_objc' 'PAGE_layout' "'page layout'" cText}
           .
  END.

END.

/* pass back errors in return value and ensure error status not left raised */
ERROR-STATUS:ERROR = NO.
RETURN cMessageList.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

{&DB-REQUIRED-END}

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE rowObjectValidate dTables 
PROCEDURE rowObjectValidate :
/*------------------------------------------------------------------------------
  Purpose:     This validation will occur client side as it does not require a 
               DB connection and the db-required flag has been disabled.
  Parameters:  <none>
  Notes:       Here we validate individual fields that are mandatory have been
               entered. Checks that require db reads will be done later in one
               of the transaction validation routines.
               This procedure should batch up the errors using a chr(3) delimiter
               so that all the errors can be dsplayed to the user in one go.
               Be sure not to leave the error status raised !!!
------------------------------------------------------------------------------*/

DEFINE VARIABLE cMessageList                  AS CHARACTER  NO-UNDO.

IF LENGTH(RowObject.product_code) = 0 THEN
  ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                        {af/sup2/aferrortxt.i 'AF' '1' 'rym_wizard_objc' 'product_code' "'product code'"}
                        .
IF LENGTH(RowObject.product_module_code) = 0 THEN
  ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                        {af/sup2/aferrortxt.i 'AF' '1' 'rym_wizard_objc' 'product_module_code' "'product module code'"}
                        .
IF LENGTH(RowObject.OBJECT_name) = 0 THEN
  ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                        {af/sup2/aferrortxt.i 'AF' '1' 'rym_wizard_objc' 'OBJECT_name' "'object name'"}
                        .
IF INDEX(RowObject.OBJECT_name,".":U) > 0 THEN
  ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                        {af/sup2/aferrortxt.i 'AF' '5' 'rym_wizard_objc' 'OBJECT_name' "'object name'" "'This is a logical object and so should not contain a file extension.'"}
                        .
IF LENGTH(RowObject.OBJECT_description) = 0 THEN
  ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                        {af/sup2/aferrortxt.i 'AF' '1' 'rym_wizard_objc' 'OBJECT_description' "'object description'"}
                        .
IF LENGTH(RowObject.WINDOW_title) = 0 THEN
  ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                        {af/sup2/aferrortxt.i 'AF' '1' 'rym_wizard_objc' 'window_title' "'window title'"}
                        .
IF  LENGTH(RowObject.sdo_name) = 0 
OR  LENGTH(RowObject.sdo_name) = ? THEN
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                           {af/sup2/aferrortxt.i 'AF' '1' 'rym_wizard_objc' 'sdo_name' "'sdo name'"}
                           .

IF LENGTH(RowObject.sdo_foreign_fields) > 0 AND
   NUM-ENTRIES(RowObject.sdo_foreign_fields) MOD 2 <> 0 THEN
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                           {af/sup2/aferrortxt.i 'AF' '5' 'rym_wizard_objc' 'sdo_foreign_fields' "'sdo foreign fields'" "'The SDO Foreign Fields must be a comma delimited list of field pair, child, parent, etc.'"}
                           .
IF  LENGTH(RowObject.browser_name) = 0 
OR  LENGTH(RowObject.browser_name) = ? THEN
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                          {af/sup2/aferrortxt.i 'AF' '1' 'rym_wizard_objc' 'browser_name' "'browser name'"}
                          .

IF LENGTH(RowObject.custom_super_procedure) > 0 AND
   NUM-ENTRIES(RowObject.custom_super_procedure,".":U) < 2 THEN
    ASSIGN cMessageList = cMessageList + (IF NUM-ENTRIES(cMessageList,CHR(3)) > 0 THEN CHR(3) ELSE "":U) +
                           {af/sup2/aferrortxt.i 'AF' '5' 'rym_wizard_objc' 'custom_super_procedure' "'custom super procedure'" "'The custom super procedure specified should contain a path and extension'"}
                           .

ASSIGN ERROR-STATUS:ERROR = NO.
RETURN cMessageList.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

