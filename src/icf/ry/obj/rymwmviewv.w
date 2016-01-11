&ANALYZE-SUSPEND _VERSION-NUMBER AB_v9r12 GUI ADM2
&ANALYZE-RESUME
/* Connected Databases 
          asdb             PROGRESS
          rydb             PROGRESS
*/
&Scoped-define WINDOW-NAME CURRENT-WINDOW
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Update-Object-Version" vTableWin _INLINE
/* Actions: ? ? ? ? af/sup/afverxftrp.p */
/* This has to go above the definitions sections, as that is what it modifies.
   If its not, then the definitions section will have been saved before the
   XFTR code kicks in and changes it */
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Definition Comments Wizard" vTableWin _INLINE
/* Actions: ? af/cod/aftemwizcw.w ? ? ? */
/* Program Definition Comment Block Wizard
Welcome to the Program Definition Comment Block Wizard. Press Next to proceed.
af/cod/aftemwizpw.w
*/
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* Temp-Table and Buffer definitions                                    */
DEFINE TEMP-TABLE RowObject
       {"ry/obj/rymwmfullo.i"}.


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS vTableWin 
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
  File: rymwmviewv.w

  Description:  Wizard Menu Controller Viewer

  Purpose:      Wizard Menu Controller Viewer

  Parameters:   <none>

  History:
  --------
  (v:010000)    Task:        6199   UserRef:    
                Date:   02/07/2000  Author:     Anthony Swindells

  Update Notes: Created from Template rysttviewv.w

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

&scop object-name       rymwmviewv.w
DEFINE VARIABLE lv_this_object_name AS CHARACTER INITIAL "{&object-name}":U NO-UNDO.
&scop object-version    010005

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */

/* Astra 2 object identifying preprocessor */
&glob   astra2-staticSmartDataViewer yes

{af/sup2/afglobals.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE SmartDataViewer
&Scoped-define DB-AWARE no

&Scoped-define ADM-CONTAINER FRAME

&Scoped-define ADM-SUPPORTED-LINKS Data-Target,Update-Source,TableIO-Target,GroupAssign-Source,GroupAssign-Target

/* Include file with RowObject temp-table definition */
&Scoped-define DATA-FIELD-DEFS "ry/obj/rymwmfullo.i"

/* Name of first Frame and/or Browse and/or first Query                 */
&Scoped-define FRAME-NAME frMain

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS RowObject.object_name ~
RowObject.object_description RowObject.window_title 
&Scoped-define ENABLED-TABLES RowObject
&Scoped-define FIRST-ENABLED-TABLE RowObject
&Scoped-define DISPLAYED-TABLES RowObject
&Scoped-define FIRST-DISPLAYED-TABLE RowObject
&Scoped-Define DISPLAYED-FIELDS RowObject.object_name ~
RowObject.object_description RowObject.window_title ~
RowObject.generated_date RowObject.generated_time_str 

/* Custom List Definitions                                              */
/* ADM-ASSIGN-FIELDS,List-2,List-3,List-4,List-5,List-6                 */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */


/* Definitions of handles for SmartObjects                              */
DEFINE VARIABLE h_gscpmcsdfv AS HANDLE NO-UNDO.
DEFINE VARIABLE h_gscprcsdfv AS HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */

/* ************************  Frame Definitions  *********************** */

DEFINE FRAME frMain
     RowObject.object_name AT ROW 3.1 COL 37 COLON-ALIGNED
          VIEW-AS FILL-IN 
          SIZE 46 BY 1 TOOLTIP "Specify a unique name for the object (no path or extension)"
     RowObject.object_description AT ROW 4.1 COL 37 COLON-ALIGNED
          VIEW-AS FILL-IN 
          SIZE 46 BY 1 TOOLTIP "Specify description for object as it should appear on a menu"
     RowObject.window_title AT ROW 5.1 COL 37 COLON-ALIGNED
          VIEW-AS FILL-IN 
          SIZE 46 BY 1 TOOLTIP "Specify window title for menu controller"
     RowObject.generated_date AT ROW 6.1 COL 37 COLON-ALIGNED
          VIEW-AS FILL-IN 
          SIZE 19 BY 1
     RowObject.generated_time_str AT ROW 7.14 COL 37 COLON-ALIGNED
          VIEW-AS FILL-IN 
          SIZE 19 BY 1
     SPACE(27.20) SKIP(0.00)
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY USE-DICT-EXPS 
         SIDE-LABELS NO-UNDERLINE THREE-D NO-AUTO-VALIDATE 
         AT COL 1 ROW 1 SCROLLABLE .


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: SmartDataViewer
   Data Source: "ry/obj/rymwmfullo.w"
   Allow: Basic,DB-Fields,Smart
   Container Links: Data-Target,Update-Source,TableIO-Target,GroupAssign-Source,GroupAssign-Target
   Frames: 1
   Add Fields to: Neither
   Other Settings: PERSISTENT-ONLY COMPILE
   Temp-Tables and Buffers:
      TABLE: RowObject D "?" ?  
      ADDITIONAL-FIELDS:
          {ry/obj/rymwmfullo.i}
      END-FIELDS.
   END-TABLES.
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
  CREATE WINDOW vTableWin ASSIGN
         HEIGHT             = 7.67
         WIDTH              = 87.2.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _INCLUDED-LIB vTableWin 
/* ************************* Included-Libraries *********************** */

{src/adm2/viewer.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME




/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW vTableWin
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME frMain
   NOT-VISIBLE Size-to-Fit                                              */
ASSIGN 
       FRAME frMain:SCROLLABLE       = FALSE
       FRAME frMain:HIDDEN           = TRUE.

/* SETTINGS FOR FILL-IN RowObject.generated_date IN FRAME frMain
   NO-ENABLE                                                            */
ASSIGN 
       RowObject.generated_date:READ-ONLY IN FRAME frMain        = TRUE.

/* SETTINGS FOR FILL-IN RowObject.generated_time_str IN FRAME frMain
   NO-ENABLE                                                            */
ASSIGN 
       RowObject.generated_time_str:READ-ONLY IN FRAME frMain        = TRUE.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME frMain
/* Query rebuild information for FRAME frMain
     _Options          = "NO-LOCK"
     _Query            is NOT OPENED
*/  /* FRAME frMain */
&ANALYZE-RESUME





/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME RowObject.object_description
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL RowObject.object_description vTableWin
ON LEAVE OF RowObject.object_description IN FRAME frMain /* Object Description */
DO:
  IF RowObject.WINDOW_title:SCREEN-VALUE = "":U THEN
    ASSIGN RowObject.WINDOW_title:SCREEN-VALUE = SELF:SCREEN-VALUE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME RowObject.window_title
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL RowObject.window_title vTableWin
ON LEAVE OF RowObject.window_title IN FRAME frMain /* Window Title */
DO:
  IF RowObject.OBJECT_description:SCREEN-VALUE = "":U THEN
    ASSIGN RowObject.OBJECT_description:SCREEN-VALUE = SELF:SCREEN-VALUE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK vTableWin 


/* ***************************  Main Block  *************************** */

  &IF DEFINED(UIB_IS_RUNNING) <> 0 &THEN          
    RUN initializeObject.
  &ENDIF         

  /************************ INTERNAL PROCEDURES ********************/

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE adm-create-objects vTableWin  _ADM-CREATE-OBJECTS
PROCEDURE adm-create-objects :
/*------------------------------------------------------------------------------
  Purpose:     Create handles for all SmartObjects used in this procedure.
               After SmartObjects are initialized, then SmartLinks are added.
  Parameters:  <none>
------------------------------------------------------------------------------*/
  DEFINE VARIABLE currentPage  AS INTEGER NO-UNDO.

  ASSIGN currentPage = getCurrentPage().

  CASE currentPage: 

    WHEN 0 THEN DO:
       RUN constructObject (
             INPUT  'ry/obj/gscprcsdfv.w':U ,
             INPUT  FRAME frMain:HANDLE ,
             INPUT  'FieldNameproduct_codeDisplayFieldyesEnableFieldyesHideOnInitnoDisableOnInitnoObjectLayout':U ,
             OUTPUT h_gscprcsdfv ).
       RUN repositionObject IN h_gscprcsdfv ( 1.00 , 30.60 ) NO-ERROR.
       RUN resizeObject IN h_gscprcsdfv ( 1.10 , 54.60 ) NO-ERROR.

       RUN constructObject (
             INPUT  'ry/obj/gscpmcsdfv.w':U ,
             INPUT  FRAME frMain:HANDLE ,
             INPUT  'FieldNameproduct_module_codeDisplayFieldyesEnableFieldyesHideOnInitnoDisableOnInitnoObjectLayout':U ,
             OUTPUT h_gscpmcsdfv ).
       RUN repositionObject IN h_gscpmcsdfv ( 2.05 , 23.00 ) NO-ERROR.
       RUN resizeObject IN h_gscpmcsdfv ( 1.10 , 62.20 ) NO-ERROR.

       /* Adjust the tab order of the smart objects. */
       RUN adjustTabOrder ( h_gscprcsdfv ,
             RowObject.object_name:HANDLE IN FRAME frMain , 'BEFORE':U ).
       RUN adjustTabOrder ( h_gscpmcsdfv ,
             h_gscprcsdfv , 'AFTER':U ).
    END. /* Page 0 */

  END CASE.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI vTableWin  _DEFAULT-DISABLE
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
  HIDE FRAME frMain.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE RTB_xref_generator vTableWin 
PROCEDURE RTB_xref_generator :
/* -----------------------------------------------------------
Purpose:    Generate RTB xrefs for SMARTOBJECTS.
Parameters: <none>
Notes:      This code is generated by the UIB.  DO NOT modify it.
            It is included for Roundtable Xref generation. Without
            it, Xrefs for SMARTOBJECTS could not be maintained by
            RTB.  It will in no way affect the operation of this
            program as it never gets executed.
-------------------------------------------------------------*/
  RUN "ry\obj\gscpmcsdfv.w *RTB-SmObj* ".
  RUN "ry\obj\gscprcsdfv.w *RTB-SmObj* ".

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

