&ANALYZE-SUSPEND _VERSION-NUMBER AB_v9r12 GUI
/* Procedure Description
"The Dialog-Box for TableIO SmartPanels

This dialog-box is used to set the TableIO SmartPanel-specific attributes during design time."
*/
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME CURRENT-WINDOW
&Scoped-define FRAME-NAME SP-attr-dialog
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS SP-attr-dialog 
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
/*------------------------------------------------------------------------

  File: u-paneld.w

  Description: ADM2 Dialog for getting setable attributes of a Smarttoolbar
               

  Input Parameters:
      Handle of the calling SmartPanel.

  Output Parameters:
      <none>

  Modified:  Sept 7, 2001
  
     Notes:  Static widgets that are dependent of the Groups/Categories
             should be visualized and sensitized in 
              visualizeActionWidgets.  
              enableActionWidgets  
              
             viewhideactions have logic to set update action hidden of 
             depending on v-type (tableiostate)   
------------------------------------------------------------------------*/
/*          This .W file was created with the Progress UIB.             */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */

&GLOBAL-DEFINE WIN95-BTN  YES

DEFINE INPUT PARAMETER p_hSMO AS HANDLE NO-UNDO.

/* Local Variable Definitions ---                                       */

DEFINE VARIABLE attr-list  AS CHARACTER NO-UNDO.
DEFINE VARIABLE attr-name  AS CHARACTER NO-UNDO.
DEFINE VARIABLE attr-value AS CHARACTER NO-UNDO.
DEFINE VARIABLE attr-entry AS CHARACTER NO-UNDO.
DEFINE VARIABLE i          AS INTEGER NO-UNDO.
DEFINE VARIABLE entries    AS INTEGER NO-UNDO.

DEFINE VARIABLE gcActionGroups        AS CHARACTER  NO-UNDO.
DEFINE VARIABLE gcSupportedLinks      AS CHARACTER  NO-UNDO.
DEFINE VARIABLE gcHiddenToolbarBands  AS CHARACTER  NO-UNDO.
DEFINE VARIABLE gcHiddenMenuBands     AS CHARACTER  NO-UNDO.
DEFINE VARIABLE gcDisabledActions     AS CHARACTER  NO-UNDO.
DEFINE VARIABLE gcHiddenActions       AS CHARACTER  NO-UNDO.
DEFINE VARIABLE gcCurrentCategory     AS CHARACTER  NO-UNDO INIT ?.
DEFINE VARIABLE gcImagePath           AS CHARACTER  NO-UNDO.
DEFINE VARIABLE glUseRepository       AS LOGICAL    NO-UNDO.
DEFINE VARIABLE gcEditSingleInstance  AS CHARACTER  NO-UNDO.
DEFINE VARIABLE xcToolbarObjectType   AS CHARACTER  NO-UNDO INIT 'SmartToolbar'.
DEFINE VARIABLE xdScrollToggleHeight  AS DECIMAL    NO-UNDO INIT 0.72.
DEFINE VARIABLE xdScrollToggleCol     AS DECIMAL    NO-UNDO INIT 1.12.

DEFINE VARIABLE cSubModules AS CHARACTER NO-UNDO.
DEFINE VARIABLE v-SPtype AS CHARACTER NO-UNDO.

DEFINE VARIABLE cContext       AS CHAR   NO-UNDO.
DEFINE VARIABLE cSDO           AS CHAR   NO-UNDO.
DEFINE VARIABLE hNavTarget     AS HANDLE NO-UNDO.
DEFINE VARIABLE cObjectNames   AS CHAR   NO-UNDO.
DEFINE VARIABLE cListItems     AS CHAR   NO-UNDO.
DEFINE VARIABLE lEnableSDOs    AS LOGICAL  NO-UNDO.
DEFINE VARIABLE cToolbarList   AS CHARACTER  NO-UNDO.
DEFINE VARIABLE dDiff          AS DECIMAL    NO-UNDO.

DEFINE VARIABLE giMargin       AS INTEGER    NO-UNDO.
DEFINE VARIABLE gdHorMargin    AS DECIMAL    NO-UNDO.
DEFINE VARIABLE gdMaxHeight    AS DECIMAL    NO-UNDO.
DEFINE VARIABLE gdMaxWidth     AS DECIMAL    NO-UNDO.

gdMaxHeight = 480 / SESSION:PIXELS-PER-ROW.
gdMaxWidth  = 640 / SESSION:PIXELS-PER-column.


&SCOP OK btnOk 
&SCOP CANCEL btnCancel 
&SCOP HELP btnHelp

DEFINE TEMP-TABLE tBand  
 FIELD Name   AS CHAR
 FIELD Hdl    AS HANDLE
 FIELD Seq    AS INT
 FIELD Menu   AS LOG
 FIELD Tool   AS LOG
 INDEX Band NAME.

DEFINE TEMP-TABLE tAction  
 FIELD Name   AS CHAR
 FIELD Hdl AS HANDLE
 FIELD RectHdl AS HANDLE
 FIELD DivideHdl AS HANDLE
 FIELD TxtHdl  AS HANDLE
 FIELD Sort1  AS INT
 FIELD Sort2  AS INT 
 FIELD Link   AS CHAR
 FIELD Menu   AS LOG
 FIELD Tool   AS LOG
 INDEX Sort AS PRIMARY sort1 sort2.

DEFINE TEMP-TABLE tChildAction  
 FIELD Name     AS CHAR
 FIELD Category   AS CHAR
 FIELD DisableHdl AS HANDLE
 FIELD HideHdl  AS HANDLE
 FIELD TxtHdl   AS HANDLE
 FIELD ImageHdl AS HANDLE
 FIELD Sequence AS INT
 FIELD Row      AS DEC 
 FIELD Menu     AS LOG
 FIELD Tool     AS LOG
 INDEX PARENT Category sequence
 INDEX Sort AS PRIMARY Sequence.

DEFINE TEMP-TABLE tPage
 FIELD PageNum AS INT FORMAT "ZZ9" LABEL "Page"
 FIELD Hdl     AS HANDLE
 FIELD Name    AS CHAR
 FIELD Caption AS CHAR FORMAT "X(255)"
 INDEX PageNum PageNum.

DEFINE QUERY qPage FOR tPage.

DEFINE BROWSE bPage QUERY qPage
  DISPLAY 
    tPage.PageNum   
    tPage.Caption WIDTH 40
    tPage.Name
  ENABLE
    tPAge.Caption
  WITH NO-ROW-MARKERS SEPARATORS 4 DOWN EXPANDABLE.
  
DEFINE FRAME {&FRAME-NAME}
     bPAge .

bPAge:HIDDEN IN FRAME {&FRAME-NAME} = TRUE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE DIALOG-BOX
&Scoped-define DB-AWARE no

/* Name of first Frame and/or Browse and/or first Query                 */
&Scoped-define FRAME-NAME SP-attr-dialog

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS ldeactivateTargetOnHide v-Toolbar ~
cDrawDirection lAutoSize v-show v-Menu fiActionLabel fiCategoryLabel RECT-1 ~
rMenu rToolbar 
&Scoped-Define DISPLAYED-OBJECTS ldeactivateTargetOnHide v-Toolbar ~
cDrawDirection lAutoSize v-show v-Menu fiActionLabel fiCategoryLabel 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD addDisabledAction SP-attr-dialog 
FUNCTION addDisabledAction RETURNS LOGICAL
  ( pcAction AS CHAR  )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD addHiddenAction SP-attr-dialog 
FUNCTION addHiddenAction RETURNS LOGICAL
  ( pcAction AS CHAR  )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD createAction SP-attr-dialog 
FUNCTION createAction RETURNS LOGICAL
  (phFrame    AS HANDLE,
   pcCategory AS char,
   pcAction   AS CHAR,
   pdrow      AS DEC,
   pdcol      AS DEC)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD createFrameBorder SP-attr-dialog 
FUNCTION createFrameBorder RETURNS LOGICAL
  ( phFrame AS HANDLE)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD createMenuBands SP-attr-dialog 
FUNCTION createMenuBands RETURNS LOGICAL
  (pcBand AS CHAR,
   INPUT-OUTPUT pdRow AS DEC,
   pdCol  AS DEC)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD createToggle SP-attr-dialog 
FUNCTION createToggle RETURNS HANDLE
  ( phFrame  AS HANDLE,
    plSelection AS LOGICAL,
    pcType   AS CHAR,
    pcLabel  AS CHAR,
    pdRow    AS DEC,
    pdCol    AS DEC)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD deleteActions SP-attr-dialog 
FUNCTION deleteActions RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD initActions SP-attr-dialog 
FUNCTION initActions RETURNS LOGICAL
  (pcCategory AS CHAR)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD initContents SP-attr-dialog 
FUNCTION initContents RETURNS LOGICAL
  (pcContents AS CHAR)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD initMenuBands SP-attr-dialog 
FUNCTION initMenuBands RETURNS LOGICAL
  (  )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD initPages SP-attr-dialog 
FUNCTION initPages RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD initToolbar SP-attr-dialog 
FUNCTION initToolbar RETURNS LOGICAL
    ( pcToolbar AS CHAR)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD initToolbarBands SP-attr-dialog 
FUNCTION initToolbarBands RETURNS CHARACTER
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD removeDisabledAction SP-attr-dialog 
FUNCTION removeDisabledAction RETURNS LOGICAL
  ( pcAction AS CHAR)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD removeEntry SP-attr-dialog 
FUNCTION removeEntry RETURNS CHARACTER
  ( pcEntry AS CHAR,
    pcList AS CHAR)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD removeHiddenAction SP-attr-dialog 
FUNCTION removeHiddenAction RETURNS LOGICAL
  ( pcAction AS CHAR)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD resizeRectangles SP-attr-dialog 
FUNCTION resizeRectangles RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD setObjectStates SP-attr-dialog 
FUNCTION setObjectStates RETURNS LOGICAL
  (  )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD setTableioState SP-attr-dialog 
FUNCTION setTableioState RETURNS LOGICAL 
  ( pcState AS CHAR )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD showActionWidgets SP-attr-dialog 
FUNCTION showActionWidgets RETURNS CHARACTER
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD viewContents SP-attr-dialog 
FUNCTION viewContents RETURNS LOGICAL
  ( /* parameter-definitions */ )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD viewHideActions SP-attr-dialog 
FUNCTION viewHideActions RETURNS LOGICAL
  ( pcCategory AS CHAR,
    plView     AS LOGICAL)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* ***********************  Control Definitions  ********************** */

/* Define a dialog box                                                  */

/* Definitions of the field level widgets                               */
DEFINE VARIABLE cToolbar AS CHARACTER FORMAT "X(256)":U 
     LABEL "Toolbar" 
     VIEW-AS COMBO-BOX 
     DROP-DOWN-LIST
     SIZE 31.4 BY 1 TOOLTIP "Select the toolbar object to use for this instance" NO-UNDO.

DEFINE VARIABLE cToolbarParentMenu AS CHARACTER FORMAT "X(256)":U 
     LABEL "Parent menu" 
     VIEW-AS FILL-IN 
     SIZE 20.8 BY 1 TOOLTIP "Specify a separate submenu to use instead of merging with other toolbars" NO-UNDO.

DEFINE VARIABLE fiActionLabel AS CHARACTER FORMAT "X(256)":U INITIAL "Actions:" 
      VIEW-AS TEXT 
     SIZE 24 BY .62 TOOLTIP "Check or uncheck to disable or hide actions" NO-UNDO.

DEFINE VARIABLE fiCategoryLabel AS CHARACTER FORMAT "X(256)":U INITIAL "Categories:" 
      VIEW-AS TEXT 
     SIZE 24 BY .62 TOOLTIP "Check or uncheck to disable or hide actions" NO-UNDO.

DEFINE VARIABLE fiMenuBandLabel AS CHARACTER FORMAT "X(256)":U INITIAL "Menu bands:" 
      VIEW-AS TEXT 
     SIZE 16 BY .62 NO-UNDO.

DEFINE VARIABLE fiToolbarBandLabel AS CHARACTER FORMAT "X(256)":U INITIAL "Toolbar bands:" 
      VIEW-AS TEXT 
     SIZE 16 BY .62 NO-UNDO.

DEFINE VARIABLE iMenuMergeOrder AS INTEGER FORMAT ">>9":U INITIAL 0 
     LABEL "Merge order" 
     VIEW-AS FILL-IN 
     SIZE 4.6 BY 1 TOOLTIP "Decides the order of which this toolbar's menu items are merged with others" NO-UNDO.

DEFINE VARIABLE cDrawDirection AS CHARACTER 
     VIEW-AS RADIO-SET HORIZONTAL
     RADIO-BUTTONS 
          "&Horizontal", "Horizontal",
"&Vertical", "Vertical"
     SIZE 26.4 BY .86 TOOLTIP "Specify the toolbar's draw direction" NO-UNDO.

DEFINE VARIABLE ldeactivateTargetOnHide AS LOGICAL 
     VIEW-AS RADIO-SET VERTICAL
     RADIO-BUTTONS 
          "When another target is viewed", no,
"Immediately on hide of target", yes
     SIZE 35.4 BY 1.62 NO-UNDO.

DEFINE RECTANGLE RECT-1
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL 
     SIZE 40 BY 2.38.

DEFINE RECTANGLE rMenu
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL 
     SIZE 39.8 BY 7.71.

DEFINE RECTANGLE rToolbar
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL 
     SIZE 39.8 BY 7.71.

DEFINE VARIABLE lAutoSize AS LOGICAL INITIAL no 
     LABEL "&Autofit to window" 
     VIEW-AS TOGGLE-BOX
     SIZE 22.2 BY .81 TOOLTIP "Check to autosize toolbar to window size, uncheck to make the toolbar resizable" NO-UNDO.

DEFINE VARIABLE v-Menu AS LOGICAL INITIAL yes 
     LABEL "Use &menu" 
     VIEW-AS TOGGLE-BOX
     SIZE 14 BY .81 TOOLTIP "Check to use the menubar for this instance" NO-UNDO.

DEFINE VARIABLE v-show AS LOGICAL INITIAL yes 
     LABEL "Show &border" 
     VIEW-AS TOGGLE-BOX
     SIZE 16 BY .76 TOOLTIP "Check to draw border(s) on the toolbar" NO-UNDO.

DEFINE VARIABLE v-Toolbar AS LOGICAL INITIAL yes 
     LABEL "Use &toolbar" 
     VIEW-AS TOGGLE-BOX
     SIZE 15.4 BY .81 TOOLTIP "Check to create a toolbar for this instance" NO-UNDO.

DEFINE VARIABLE c_SDOList AS CHARACTER FORMAT "X(256)":U 
     VIEW-AS COMBO-BOX INNER-LINES 5
     DROP-DOWN-LIST
     SIZE 25 BY 1 NO-UNDO.

DEFINE VARIABLE c_SDOLabel AS CHARACTER FORMAT "X(256)":U INITIAL "SmartDataObject:" 
      VIEW-AS TEXT 
     SIZE 17.6 BY .62 NO-UNDO.

DEFINE VARIABLE v-type AS CHARACTER INITIAL "Save" 
     VIEW-AS RADIO-SET HORIZONTAL
     RADIO-BUTTONS 
          "&Save", "Save":U,
"&Update", "Update":U
     SIZE 21.2 BY 1 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME SP-attr-dialog
     cToolbar AT ROW 1.52 COL 3.2
     ldeactivateTargetOnHide AT ROW 3.86 COL 5.2 NO-LABEL
     fiToolbarBandLabel AT ROW 9.91 COL 3 COLON-ALIGNED NO-LABEL
     v-Toolbar AT ROW 6.05 COL 5.2
     cDrawDirection AT ROW 7.05 COL 5.2 NO-LABEL
     lAutoSize AT ROW 7.95 COL 5.2
     v-show AT ROW 8.91 COL 5.2
     v-Menu AT ROW 6.05 COL 46.6
     iMenuMergeOrder AT ROW 6.91 COL 49.4
     cToolbarParentMenu AT ROW 8.1 COL 60 COLON-ALIGNED
     fiActionLabel AT ROW 14.57 COL 42.8 COLON-ALIGNED NO-LABEL
     fiMenuBandLabel AT ROW 9.91 COL 44.6 COLON-ALIGNED NO-LABEL
     fiCategoryLabel AT ROW 14.52 COL 1.6 COLON-ALIGNED NO-LABEL
     RECT-1 AT ROW 3.38 COL 3.4
     rMenu AT ROW 6.38 COL 44.8
     rToolbar AT ROW 6.38 COL 3.4
     "Deactivation of link to hidden target" VIEW-AS TEXT
          SIZE 35.2 BY .62 AT ROW 3.1 COL 5.4
     SPACE(60.79) SKIP(18.94)
    WITH VIEW-AS DIALOG-BOX KEEP-TAB-ORDER 
         SIDE-LABELS NO-UNDERLINE THREE-D  SCROLLABLE 
         TITLE "SmartToolbar Properties".

DEFINE FRAME frMenubands
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 46.6 ROW 10.57
         SIZE 35.4 BY 2.86.

DEFINE FRAME frToolbarBands
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 5.2 ROW 10.57
         SIZE 35.4 BY 2.86.

DEFINE FRAME frActions
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 44.8 ROW 15.24
         SIZE 54.6 BY 6.67.

DEFINE FRAME frMain
     c_SDOList AT ROW 3.38 COL 9 NO-LABEL
     v-type AT ROW 4.81 COL 12.6 NO-LABEL
     c_SDOLabel AT ROW 2.71 COL 8.6 COLON-ALIGNED NO-LABEL
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE 
         AT COL 3.4 ROW 15.24
         SIZE 39 BY 6.67.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: DIALOG-BOX
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* REPARENT FRAME */
ASSIGN FRAME frActions:FRAME = FRAME SP-attr-dialog:HANDLE
       FRAME frMain:FRAME = FRAME SP-attr-dialog:HANDLE
       FRAME frMenubands:FRAME = FRAME SP-attr-dialog:HANDLE
       FRAME frToolbarBands:FRAME = FRAME SP-attr-dialog:HANDLE.

/* SETTINGS FOR FRAME frActions
                                                                        */
/* SETTINGS FOR FRAME frMain
   NOT-VISIBLE                                                          */
/* SETTINGS FOR FILL-IN c_SDOLabel IN FRAME frMain
   NO-DISPLAY NO-ENABLE                                                 */
ASSIGN 
       c_SDOLabel:HIDDEN IN FRAME frMain           = TRUE.

/* SETTINGS FOR COMBO-BOX c_SDOList IN FRAME frMain
   NO-DISPLAY NO-ENABLE ALIGN-L                                         */
ASSIGN 
       c_SDOList:HIDDEN IN FRAME frMain           = TRUE.

/* SETTINGS FOR RADIO-SET v-type IN FRAME frMain
   NO-DISPLAY NO-ENABLE                                                 */
ASSIGN 
       v-type:HIDDEN IN FRAME frMain           = TRUE.

/* SETTINGS FOR FRAME frMenubands
                                                                        */
/* SETTINGS FOR FRAME frToolbarBands
                                                                        */
/* SETTINGS FOR DIALOG-BOX SP-attr-dialog
   Custom                                                               */

DEFINE VARIABLE XXTABVALXX AS LOGICAL NO-UNDO.

ASSIGN XXTABVALXX = FRAME frToolbarBands:MOVE-AFTER-TAB-ITEM (cToolbarParentMenu:HANDLE IN FRAME SP-attr-dialog)
       XXTABVALXX = FRAME frMain:MOVE-BEFORE-TAB-ITEM (FRAME frActions:HANDLE)
       XXTABVALXX = FRAME frMenubands:MOVE-BEFORE-TAB-ITEM (FRAME frMain:HANDLE)
       XXTABVALXX = FRAME frToolbarBands:MOVE-BEFORE-TAB-ITEM (FRAME frMenubands:HANDLE)
/* END-ASSIGN-TABS */.

ASSIGN 
       FRAME SP-attr-dialog:SCROLLABLE       = FALSE
       FRAME SP-attr-dialog:HIDDEN           = TRUE.

/* SETTINGS FOR COMBO-BOX cToolbar IN FRAME SP-attr-dialog
   NO-DISPLAY NO-ENABLE ALIGN-L                                         */
/* SETTINGS FOR FILL-IN cToolbarParentMenu IN FRAME SP-attr-dialog
   NO-DISPLAY NO-ENABLE                                                 */
/* SETTINGS FOR FILL-IN fiMenuBandLabel IN FRAME SP-attr-dialog
   NO-DISPLAY NO-ENABLE                                                 */
/* SETTINGS FOR FILL-IN fiToolbarBandLabel IN FRAME SP-attr-dialog
   NO-DISPLAY NO-ENABLE                                                 */
/* SETTINGS FOR FILL-IN iMenuMergeOrder IN FRAME SP-attr-dialog
   NO-DISPLAY NO-ENABLE ALIGN-L                                         */
/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME frMain
/* Query rebuild information for FRAME frMain
     _Query            is NOT OPENED
*/  /* FRAME frMain */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _QUERY-BLOCK DIALOG-BOX SP-attr-dialog
/* Query rebuild information for DIALOG-BOX SP-attr-dialog
     _Options          = "SHARE-LOCK"
     _Query            is NOT OPENED
*/  /* DIALOG-BOX SP-attr-dialog */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME SP-attr-dialog
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL SP-attr-dialog SP-attr-dialog
ON GO OF FRAME SP-attr-dialog /* SmartToolbar Properties */
DO:
  DEF VAR ok AS LOG.
  
  DEFINE VARIABLE lOldAutosize AS LOGICAL  NO-UNDO.
  DEFINE VARIABLE dMinSize      AS DECIMAL  NO-UNDO.
  DEFINE VARIABLE hFrame        AS HANDLE  NO-UNDO.
  DEFINE VARIABLE i AS INTEGER   NO-UNDO.
  RUN supportLinks(OUTPUT ok).
  IF NOT ok THEN 
    RETURN NO-APPLY.
  
  ASSIGN 
    lDeactivateTargetOnHide 
    cToolbar
    v-menu
    v-toolbar
    cDrawDirection
    lAutoSize
    v-show 
    iMenuMergeOrder
    cToolbarParentMenu  
   FRAME frmain v-type
   .
 
  /* Autosize has been turned off so resize the frame here so resizeObject 
     will resize it to minimum size  */
  {get ToolbarAutoSize lOldAutoSize p_hSMO}.
  IF lOldAutoSize AND NOT lAutosize THEN
  DO:
    {get ContainerHandle hFrame p_hSMO}.
    hFrame:HIDDEN = TRUE. 
    IF cDrawDirection BEGINS 'v' THEN
      hFrame:HEIGHT = 1.
    ELSE 
      hFrame:WIDTH = 1.
  END.
 
  {set DeactivateTargetOnHide lDeactivateTargetOnHide p_hSMO}.
  {set menu v-menu p_hSMO}.
  {set toolbar v-toolbar p_hSMO}.
  {set ToolbarDrawDirection cDrawDirection p_hSMO}.
  {set ToolbarAutoSize lAutoSize p_hSMO}.
  {set ShowBorder v-show p_hSMO}.
  {set TableioType v-type p_hSMO}.
  {set actionGroups gcActionGroups p_hSMO}. 
  {set DisabledActions gcDisabledActions p_hSMO}.
  {set HiddenActions gcHiddenActions p_hSMO}.
  {set HiddenToolbarBands gcHiddenToolbarBands p_hSMO}.
  {set HiddenMenuBands gcHiddenMenuBands p_hSMO}.
  {set TableioType v-type p_hSMO}.
  {set MenuMergeOrder iMenuMergeOrder p_hSMO}.
  {set ToolbarParentMenu cToolbarParentMenu p_hSMO}.
  IF glUseRepository THEN
    {set LogicalObjectName cToolbar p_hSMO}.

  IF c_SDOList NE "<none>":U THEN
      {set NavigationTargetName c_SDOList p_hSMO}.
  ELSE /* just ensure we set it to blank if it's not visible 
          (it may have been set earlier and would just cause problems
           since it no longer makes sense) */ 
      {set NavigationTargetName '':U p_hSMO}.

  IF gcEditSingleInstance <> "YES" THEN
    RUN InitializeObject IN p_hSMO.

END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL SP-attr-dialog SP-attr-dialog
ON WINDOW-CLOSE OF FRAME SP-attr-dialog /* SmartToolbar Properties */
DO:
 APPLY "END-ERROR":U TO SELF.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME cToolbar
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL cToolbar SP-attr-dialog
ON VALUE-CHANGED OF cToolbar IN FRAME SP-attr-dialog /* Toolbar */
DO:
  IF SELF:SCREEN-VALUE <> cToolbar THEN
  DO:
    ASSIGN cToolbar.
    initToolbar(cToolbar).

  END.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME frMain
&Scoped-define SELF-NAME c_SDOList
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL c_SDOList SP-attr-dialog
ON VALUE-CHANGED OF c_SDOList IN FRAME frMain
DO:
  ASSIGN c_SDOList.
  /* Assign the handle of the SDO they chose */
/*   IF c_SDOList NE "":U THEN            */
/*       hSDO = WIDGET-HANDLE(c_SDOList). */
/*                                        */
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME SP-attr-dialog
&Scoped-define SELF-NAME iMenuMergeOrder
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL iMenuMergeOrder SP-attr-dialog
ON VALUE-CHANGED OF iMenuMergeOrder IN FRAME SP-attr-dialog /* Merge order */
DO:
  IF INT(SELF:INPUT-VALUE) > 1 THEN
    ASSIGN   
      cToolbarParentMenu:SENSITIVE = TRUE
      cToolbarParentMenu:SCREEN-VALUE = cToolbarParentMenu.
  ELSE 
    ASSIGN 
      cToolbarParentMenu:SENSITIVE = FALSE 
      cToolbarParentMenu:SCREEN-VALUE = '':U.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME v-Menu
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL v-Menu SP-attr-dialog
ON VALUE-CHANGED OF v-Menu IN FRAME SP-attr-dialog /* Use menu */
DO:
  IF NOT SELF:CHECKED THEN 
    v-toolbar:CHECKED = TRUE. 
  setObjectStates().
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define SELF-NAME v-Toolbar
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL v-Toolbar SP-attr-dialog
ON VALUE-CHANGED OF v-Toolbar IN FRAME SP-attr-dialog /* Use toolbar */
DO:
  IF NOT SELF:CHECKED THEN 
    v-menu:CHECKED = TRUE.
  setObjectStates().  
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME frMain
&Scoped-define SELF-NAME v-type
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL v-type SP-attr-dialog
ON VALUE-CHANGED OF v-type IN FRAME frMain
DO:
  ASSIGN v-type.
  setTableioState(SELF:SCREEN-VALUE).
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&Scoped-define FRAME-NAME SP-attr-dialog
&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK SP-attr-dialog 


/* ****************** Standard Buttons and ADM Help ******************* */

/* Parent the dialog-box to the ACTIVE-WINDOW, if there is no parent.   */
IF VALID-HANDLE(ACTIVE-WINDOW) AND FRAME {&FRAME-NAME}:PARENT eq ?
THEN FRAME {&FRAME-NAME}:PARENT = ACTIVE-WINDOW.

/* Define Context ID's for HELP files */
{ src/adm2/support/admhlp.i }    

&SCOPED-DEFINE OK bOk
&SCOPED-DEFINE Cancel bCancel
&SCOPED-DEFINE HELP bHelp

/* Attach the standard OK/Cancel/Help button bar. */
{ adecomm/okbar.i  &TOOL = "AB"
                     &CONTEXT = {&SmartToolbar_Instance_Properties_Dialog_Box} }

  

/* ***************************  Main Block  *************************** */
/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
   ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK WITH FRAME {&FRAME-NAME}:
   glUseRepository = dynamic-function ("getUseRepository":U IN p_hSMO).
   gcEditSingleInstance = DYNAMIC-FUNCTION("getUserProperty":U IN p_hSMO, "EditSingleInstance":U).
   attr-list = dynamic-function ("instancePropertyList":U IN p_hSMO, '':U).
   entries = NUM-ENTRIES (attr-list, CHR(3)).

   DO i = 1 TO entries:
     ASSIGN attr-entry = ENTRY (i, attr-list, CHR(3))
            attr-name  = TRIM (ENTRY(1, attr-entry, CHR(4)))
            attr-value = TRIM (ENTRY(2, attr-entry, CHR(4))).
     CASE attr-name:
        WHEN "DeactivateTargetOnHide":U THEN
           lDeactivateTargetOnHide = can-do('yes,true':U,attr-value).
        WHEN "TableioType":U THEN
        DO:
          v-type              = attr-value.
          v-type:SCREEN-VALUE = attr-value.
        END.
        /*
        WHEN "AddFunction":U THEN
           v-add = attr-value.
        */
        WHEN "Menu":U THEN
          v-Menu =  IF attr-value = 'Yes' THEN yes ELSE no.
        WHEN "ToolBar":U THEN
          v-Toolbar =  IF attr-value = 'Yes' THEN yes ELSE no.        
        WHEN "ToolbarAutosize":U THEN
           lAutoSize = IF attr-value = 'Yes' THEN yes ELSE no.
        WHEN "actionGroups" THEN 
          gcActionGroups = attr-value. 
        WHEN "ShowBorder":U THEN
          v-show = IF attr-value = 'Yes' THEN yes ELSE no.
        WHEN "ToolbarDrawDirection" THEN
        DO:
          cDrawDirection = IF attr-value BEGINS 'v' THEN 'Vertical' 
                             ELSE 'Horizontal'.
        END.
        WHEN "HiddenMenuBands":U THEN 
            gcHiddenMenuBands = attr-value. 
        WHEN "HiddenToolbarBands":U THEN 
             gcHiddenToolbarBands = attr-value. 
        WHEN "DisabledActions" THEN 
           gcDisabledActions = attr-value. 
        WHEN "HiddenActions" THEN 
           gcHiddenActions = attr-value. 
        WHEN "LogicalObjectName" THEN
          cToolbar = attr-value.
         WHEN "MenuMergeOrder":U THEN
           iMenuMergeOrder = INT(attr-value).
        WHEN "ToolbarParentMenu":U THEN 
          cToolbarParentMenu = attr-value. 
        WHEN "NavigationTargetName":U THEN
        DO:
            /* New code for 9.1B to support an SBO as a Naviogation-Target.
               If this is the case, the DataObjectNames property will come back with
               a list of all the SDO names, and the developer can pick one as the
               intended Navigation-target for this panel. */
            /* Get the handle of the associated SmartDataObject, if any. */
            RUN adeuib/_uibinfo (?, "HANDLE ":U + STRING(p_hSMO), 
                 "LINK NAVIGATION-TARGET":U, 
                     OUTPUT cContext).      /* Returns the Context ID  */            
            IF cContext NE "":U 
            AND cContext NE ? 
             /* More than one navigation link not really supported for SBO
                (even if it does it would imply the master or automatic 
                 switching so we don;t want to specify targetNames) */
            AND NUM-ENTRIES(cContext) = 1 THEN
            DO:
              RUN adeuib/_uibinfo (INT(cContext), ?, "PROCEDURE-HANDLE":U,
                OUTPUT cSDO).
              hNavTarget = WIDGET-HANDLE(cSDO).

              cObjectNames = DYNAMIC-FUNCTION('getDataObjectNames' IN hNavTarget)
                NO-ERROR.     /* Fn won't exist if this isn't an SBO. */
              IF cObjectNames = "":U THEN   /* Blank means the prop isn't set.*/
              DO:
                RUN initializeObject IN hNavTarget.
                cObjectNames = 
                    DYNAMIC-FUNCTION('getDataObjectNames' IN hNavTarget)
                        NO-ERROR.
              END.    /* END DO IF NO Targets yet */
              /* This would be if the target has no such property (is not an SBO). */     
              IF cObjectNames = ? THEN    
                cObjectNames = "":U.

              cListItems = '<none>':U + 
                (IF cObjectNames NE "":U THEN ",":U ELSE "":U)
                   + cObjectNames.
     
              ASSIGN c_SDOList:LIST-ITEMS IN FRAME frmain = cListItems
                     c_SDOList:INNER-LINES = MAX(5,NUM-ENTRIES(cListItems) / 2)
                     c_SDOList = 
                       IF attr-value = "":U THEN "<none>":U ELSE attr-value.
                     c_SDOList:SCREEN-VALUE = c_SDOList.
            END.   /* END DO if cContext defined */
        END.       /* END WHEN "NavigationTargetName" */
      END CASE.
  END.    
  IF NOT glUseRepository THEN 
    ASSIGN cToolbar    = {fn getObjectName p_hSMO}    
           gcImagepath = {fn getImagePath p_hSMO}.

  IF glUseRepository AND gcEditSingleInstance <> "YES" THEN
  DO:
    cToolbar:DELIMITER = CHR(1).
    RUN getToolbars(OUTPUT cToolbarList).   
    cToolbar:LIST-ITEMS = cToolbarList.
    cToolbar:SENSITIVE = TRUE.
  END.
  ELSE DO: 
    cToolbar:LIST-ITEMS = cToolbar.
    cToolbar:SENSITIVE = FALSE.
  END.
  cToolbar:SCREEN-VALUE = cToolbar.    

  IF glUseRepository AND cToolbar <> '':U THEN
    initToolbar(cToolbar). 
  ELSE 
    initContents(gcActionGroups). 

  /* Base margin on the static check-box and rectangle's proportions 
     We need both pixels and ppu  (use ppu for iterative positiong... )  */  
  giMargin       = (v-toolbar:X - rToolbar:X ).
  gdHorMargin    = (v-toolbar:COL - rToolbar:COL).

  FRAME {&FRAME-NAME}:VISIBLE = TRUE NO-ERROR.

  IF glUseRepository THEN
  DO:
    DISPLAY 
      fiToolbarBandLabel 
      fiMenuBandLabel. 
    fiToolbarBandLabel:HIDDEN = FALSE.
    fiMenuBandLabel:HIDDEN = FALSE.
    createFrameborder(FRAME frToolbarBands:HANDLE).
    createFrameborder(FRAME frMenuBands:HANDLE).
  END.
  ELSE DO:
    HIDE FRAME frToolbarBands.
    HIDE FRAME frMenuBands.
    dDiff = rToolbar:HEIGHT.
    rToolbar:HEIGHT = fiToolbarBandLabel:ROW  - rToolbar:ROW .
    dDiff = dDiff - rToolbar:HEIGHT. 
    rMenu:HEIGHT = rToolbar:HEIGHT.
    FRAME frMain:ROW = FRAME frMain:ROW - dDiff.
    FRAME frActions:ROW = FRAME frActions:ROW - DDiff.
    fiActionLabel:ROW = fiActionLabel:ROW - dDiff.
    fiCategoryLabel:ROW = fiCategoryLabel:ROW - dDiff.
    bOk:ROW = bOk:ROW - dDiff.
    bCancel:ROW = bCancel:ROW - dDiff.
    bHelp:ROW = bHelp:ROW - dDiff.
    /* This avoids the jump to center the frame after it is shrinked and
       is less visually disturbing */
    FRAME {&frame-name}:COL    = FRAME {&frame-name}:COL.
    FRAME {&frame-name}:HEIGHT = FRAME {&frame-name}:HEIGHT - dDiff. 
  END.
  createFrameborder(FRAME frMain:HANDLE).
  createFrameborder(FRAME frActions:HANDLE).
  
  RUN ENABLEui.
  
    /* Set the cursor */
  RUN adecomm/_setcurs.p ("":U).
  
  setObjectStates(). 
  APPLY "ENTRY" TO v-Menu IN FRAME  {&FRAME-NAME}.
  
  WAIT-FOR GO OF FRAME {&FRAME-NAME}.
   
END.
deleteActions().
RUN disable_UI.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI SP-attr-dialog  _DEFAULT-DISABLE
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
  HIDE FRAME frActions.
  HIDE FRAME frMain.
  HIDE FRAME frMenubands.
  HIDE FRAME frToolbarBands.
  HIDE FRAME SP-attr-dialog.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enableActionWidgets SP-attr-dialog 
PROCEDURE enableActionWidgets :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER pcCategory AS CHARACTER  NO-UNDO.
  DEFINE INPUT  PARAMETER plSelected AS LOGICAL    NO-UNDO.
  
  DO WITH FRAME frmain :
    CASE pcCategory:
      WHEN "TABLEIO" THEN 
        v-type:SENSITIVE = plSelected.
      WHEN "Navigation" THEN
        c_SDOList:SENSITIVE = plSelected.
    END CASE.
  END.
  
  FOR EACH tchildaction WHERE tChildAction.Category = pcCategory:
     ASSIGN 
       tchildAction.DisableHdl:SENSITIVE = plSelected
                      WHEN VALID-HANDLE(tchildAction.DisableHdl)
       tchildAction.HideHdl:SENSITIVE = plSelected
                       WHEN VALID-HANDLE(tchildAction.HideHdl).
          .
  END.  

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enableUI SP-attr-dialog 
PROCEDURE enableUI :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DISPLAY lDeactivateTargetOnHide 
          cToolbar
          v-menu 
          v-toolbar
          cDrawDirection
          lAutoSize
          v-Show
          iMenuMergeOrder
          cToolbarParentMenu
          fiActionLabel
          fiCategoryLabel
  WITH FRAME {&FRAME-NAME}.

  /* setObjectStates manages sensitivity for all other objects */
  ENABLE  lDeactivateTargetOnHide 
          v-menu 
          v-toolbar          
          WITH FRAME {&FRAME-NAME}.


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE getToolbars SP-attr-dialog 
PROCEDURE getToolbars :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
 DEFINE OUTPUT PARAMETER pcToolbars AS CHARACTER  NO-UNDO.

 DEFINE VARIABLE htype AS HANDLE     NO-UNDO.
 DEFINE VARIABLE hObj  AS HANDLE     NO-UNDO.

 DEFINE VARIABLE cObjectTypeId AS CHARACTER  NO-UNDO.
 DEFINE VARIABLE cToolbars     AS CHARACTER  NO-UNDO.
 DEFINE VARIABLE cClientSuffix AS CHARACTER  NO-UNDO.

 cClientSuffix = IF NOT CONNECTED('icfdb':U) THEN '_cl':U ELSE '':U.   
 
 DO ON STOP UNDO, RETURN:
   RUN VALUE('af/obj2/gscotfullo':U + cClientSuffix + '.w':U) PERSISTENT SET hType.
   IF cClientSuffix <> '':U THEN
      {set Appservice 'Astra':u hType}.
   RUN VALUE('af/obj2/gscobful2o':U + cClientSuffix + '.w':U) PERSISTENT SET hObj.
   IF cClientSuffix <> '':U THEN
      {set Appservice 'Astra':u hObj}.
 END.

 DYNAMIC-FUNCTION('assignQuerySelection' IN hType,
                  'object_type_code',
                  xcToolbarObjectType,
                  ?).

 RUN initializeObject IN hType.

 cObjectTypeId = {fnarg columnValue 'object_type_obj' hType}.
 
 DYNAMIC-FUNCTION('assignQuerySelection' IN hObj,
                  'object_type_obj,logical_object',
                   cObjectTypeId + CHR(1) + 'yes',
                   ?).

 RUN initializeObject IN hObj.

 pctoolbars = DYNAMIC-FUNCTION('rowValues' IN hObj,
                               'object_filename',
                               'formatted',
                               CHR(1)). 

 DELETE OBJECT hType.
 DELETE OBJECT hObj.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE hideActionWidgets SP-attr-dialog 
PROCEDURE hideActionWidgets :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DO WITH FRAME frMain:
   ASSIGN
      v-type:HIDDEN = TRUE
      c_SDOlist:HIDDEN = TRUE
      c_SDOLabel:HIDDEN = TRUE.
  END.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE onClick SP-attr-dialog 
PROCEDURE onClick :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT PARAMETER pcType  AS CHARACTER  NO-UNDO.
  DEFINE INPUT PARAMETER pcName  AS CHAR NO-UNDO.

  IF LAST-EVENT:COL < SELF:COL + 4  THEN
    RUN onValueChanged(pctype,pcName).
  ELSE SELF:CHECKED = CAN-DO(gcActionGroups,pcName)
                      OR  glUseRepository AND NOT {fnarg canfindCategory pcNAME p_hSMO}.


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE OnDown SP-attr-dialog 
PROCEDURE OnDown :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER phToggle AS HANDLE  NO-UNDO.
  FIND tAction WHERE taction.hdl = phToggle NO-ERROR.
  
  IF AVAIL tAction THEN
  DO:
    FIND NEXT tAction NO-ERROR.
    IF NOT AVAIL tAction THEN
        FIND FIRST tAction NO-ERROR.
    IF AVAIL tAction THEN
      APPLY 'Entry' TO tAction.Hdl.

  END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE onEntry SP-attr-dialog 
PROCEDURE onEntry :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER h AS HANDLE     NO-UNDO.
  FIND tAction WHERE tAction.Hdl = h NO-ERROR.
  IF AVAIL taction THEN
    initActions(tAction.NAME).
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE onLeave SP-attr-dialog 
PROCEDURE onLeave :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER h AS HANDLE     NO-UNDO.
  /*
  h:BGCOLOR = ?.
  h:fgColor = ?.
  */
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE OnUp SP-attr-dialog 
PROCEDURE OnUp :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT  PARAMETER phToggle AS HANDLE  NO-UNDO.
  FIND tAction WHERE taction.hdl = phToggle NO-ERROR.
  
  IF AVAIL tAction THEN
  DO:
    FIND PREV tAction NO-ERROR.
    IF NOT AVAIL tAction THEN
        FIND LAST tAction NO-ERROR.
    IF AVAIL tAction THEN
      APPLY 'Entry' TO tAction.Hdl.

  END.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE onValueChanged SP-attr-dialog 
PROCEDURE onValueChanged :
/*------------------------------------------------------------------------------
  Purpose:   fires on value0-changed of the dynamic toggle-boxes
             Keeps track of the content changes.
             This is also the place to add additionl logic for actions: 
             - TABLEIO set v-type radioset sensitivity on/off        
  Parameters:  action id
  Notes:       
------------------------------------------------------------------------------*/
  DEFINE INPUT PARAMETER pcType  AS CHARACTER  NO-UNDO.
  DEFINE INPUT PARAMETER pcName  AS CHAR NO-UNDO.
 
  CASE pctype:
    WHEN 'Category':U THEN
    DO:
      FIND tAction WHERE tAction.Name = pcName NO-ERROR.
                                  
      IF NOT AVAIL tAction THEN 
        RETURN.
   
      IF glUseRepository AND NOT {fnarg canfindCategory pcNAME p_hSMO} THEN
      DO:
        tAction.Hdl:CHECKED = TRUE.
      END.
      
      RUN enableActionWidgets(pcName,tAction.Hdl:CHECKED).
    
      IF SELF:CHECKED AND NOT CAN-DO(gcActionGroups,pcName) THEN
        gcActionGroups = gcActionGroups 
                       + (IF gcActionGroups = "":U THEN "":U ELSE ",":U)
                       + pcName.
                        
      ELSE 
        gcActionGroups = removeEntry(pcName,gcActionGroups).

    END. /* when category*/
    WHEN 'ToolbarBand':U THEN
    DO:
      FIND tBand WHERE tBand.Name = pcName
                 AND   tband.tool = TRUE  NO-ERROR.
  
      IF NOT AVAIL tBand THEN 
        RETURN.
   
      /* NOTE : we ADD to list when we unccheck  */
      IF NOT SELF:CHECKED AND NOT CAN-DO(gcHiddenToolbarBands,pcName) THEN
        gcHiddenToolbarBands = gcHiddenToolbarBands 
                       + (IF gcHiddenToolbarBands = "":U THEN "":U ELSE ",":U)
                       + pcName.
                        
      ELSE 
        gcHiddenToolbarBands = removeEntry(pcName,gcHiddenToolbarBands).
    END.
    WHEN 'MenuBand':U THEN
    DO:
      FIND tBand WHERE tBand.Name = pcName
                 AND   tband.MENU = TRUE  NO-ERROR.
      IF NOT AVAIL tBand THEN 
        RETURN.

      /* NOTE : we ADD to list when we unccheck  */
      IF NOT SELF:CHECKED AND NOT CAN-DO(gcHiddenMenuBands,pcName) THEN
        gcHiddenMenuBands = gcHiddenMenuBands 
                         + (IF gcHiddenMenuBands = "":U THEN "":U ELSE ",":U)
                         + pcName.

      ELSE 
        gcHiddenMenuBands = removeEntry(pcName,gcHiddenMenuBands).
    END.

  END CASE.


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE onValueChangedChild SP-attr-dialog 
PROCEDURE onValueChangedChild :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
   DEFINE INPUT  PARAMETER pcAction AS CHARACTER  NO-UNDO.
   FIND tChildAction WHERE tChildAction.NAME = pcAction.
   IF SELF:CHECKED THEN 
   DO:
     ASSIGN
       tChildaction.DisableHdl:CHECKED = tChildaction.DisableHdl = SELF 
       tChildaction.HideHdl:CHECKED = tChildaction.HideHdl = SELF. 
   END.
    
   IF tChildaction.DisableHdl:CHECKED THEN
      addDisabledAction(pcAction). 
   ELSE IF tChildaction.HideHdl:CHECKED THEN
      addHiddenAction(pcAction). 
   
   IF tChildaction.DisableHdl:CHECKED = FALSE THEN
      removeDisabledAction(pcAction). 
   IF tChildaction.HideHdl:CHECKED = FALSE THEN
      removeHiddenAction(pcAction). 

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE supportLinks SP-attr-dialog 
PROCEDURE supportLinks :
/*------------------------------------------------------------------------------
  Purpose:  Parse the selected contents and check which link to support or not.    
  Parameters:  OUTPUT plOk - NO means we cancelled 
  Notes:       
------------------------------------------------------------------------------*/
   DEFINE OUTPUT PARAMETER plOk AS LOGICAL NO-UNDO.  

   DEFINE VARIABLE iLinkPos      AS INT  NO-UNDO.
   DEFINE VARIABLE cRecid        AS CHAR NO-UNDO.
   DEFINE VARIABLE cLink         AS CHAR NO-UNDO.
   DEFINE VARIABLE cSuppLinks    AS CHAR NO-UNDO.
   DEFINE VARIABLE cOldSuppLinks AS CHAR NO-UNDO.
   DEFINE VARIABLE cInfo         AS CHAR NO-UNDO.
   DEFINE VARIABLE lOk           AS LOG  NO-UNDO.
   DEFINE VARIABLE lAnyNew       AS LOG  NO-UNDO.
   
   cOldSuppLinks = DYNAMIC-FUNC("getSupportedLinks":U IN p_hSMO).
                
   FOR EACH tAction:
   
      IF  tAction.link <> "":U  
      AND   tAction.Link <> "Container-source":U
      AND   tAction.HdL:CHECKED
      AND   tAction.HDL:SENSITIVE THEN
      DO:
        ENTRY(2,tAction.Link,"-":U) = IF ENTRY(2,tAction.Link,"-":U) = "source":U 
                                      THEN "target":U 
                                      ELSE "source":U .
        iLinkPos = LOOKUP(tAction.Link,cSuppLinks).
        IF iLinkPos = 0 THEN
          ASSIGN
            cSupplinks = cSuppLinks 
                         + (IF cSuppLinks = "":U THEN "":U ELSE ",":U)
                         +  CAPS(SUBSTR(tAction.Link,1,1))
                         + LC(SUBSTR(tAction.Link,2))
                          
             lAnyNew   = IF lAnyNew 
                         THEN lAnyNew 
                         ELSE LOOKUP(tAction.Link,cOldSuppLinks) = 0.
     END.
   END.
   
   /* Get context id of procedure */
   RUN adeuib/_uibinfo.p (?, "HANDLE " + STRING(p_hSMO), "CONTEXT":U, 
                              OUTPUT cRecid).
    
   DO i = 1 TO num-entries(cOldSuppLinks): 
     
     clink = ENTRY(i,cOldSuppLinks).
     
     /* Is this old link still amongst the new links? */ 
     iLinkPos = LOOKUP(cLink,cSuppLinks).
      
     IF iLinkPos = 0 THEN
     DO: 
       ENTRY(2,cLink,"-":U) = IF ENTRY(2,cLink,"-":U) = "source":U 
                              THEN "target":U 
                              ELSE "source":U .
      
       /* If there exisits links for a link that we don't support anymore,
          suggest that we remove the link(s) */   
       RUN adeuib/_uibinfo.p (?, ?, "LINK ":U + cLink,output cInfo).       
       IF cInfo <> "" THEN
       DO:
         MESSAGE
          "The SmartToolbar is linked to one or more " cLink + "s." SKIP  
          "According to the selected contents this link is not supported." 
          SKIP(1)
          "Do you want to remove" clink "link(s)?"
          VIEW-AS ALERT-BOX
          BUTTONS YES-NO-CANCEL
          UPDATE lOk .         
          
          /* Cancel out of message, return to dialog */
          IF lok = ? THEN
          DO:
            plOk = FALSE.
            RETURN. 
          END.  
          ELSE IF lok = yes THEN
          DO: 
            IF ENTRY(2,cLink,"-":U) = "target":U THEN
              RUN adeuib/_ablink.p("DELETE":U,
                                    cRecid, 
                                    ENTRY(1,cLink,"-":U),
                                    "*":U).         
            ELSE 
              RUN adeuib/_ablink.p("DELETE":U,
                                    "*":U, 
                                    ENTRY(1,cLink,"-":U),
                                    cRecid).         
          END. /* if lok = yes */
       END. /* if cinfo <> '' (found unsupported links) */
     END. /* linkpos = 0 (not supported anymore) */ 
   END. /* do i = 1 to num-entries(oldsupported) */
   
   plOk = DYNAMIC-FUNC("setSupportedLinks":U IN p_hSMO,cSuppLinks).
   
   /* The current advslnk suggests already linked links  
   IF lAnyNew THEN
     RUN adeuib/_advslnk.p (iRecid).
   */

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE visualizeActionWidgets SP-attr-dialog 
PROCEDURE visualizeActionWidgets :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
 DEFINE INPUT        PARAMETER pcAction AS CHARACTER  NO-UNDO.
 DEFINE INPUT        PARAMETER phToggle AS HANDLE     NO-UNDO.
 DEFINE INPUT-OUTPUT PARAMETER pdRow    AS DECIMAL    NO-UNDO.
 DEFINE INPUT-OUTPUT PARAMETER pdCol    AS DECIMAL    NO-UNDO.
 
 DEFINE VARIABLE hWidg   AS HANDLE     NO-UNDO.
 
 DO WITH FRAME frmain:
   CASE pcAction:
     WHEN "TABLEIO":U THEN
       ASSIGN v-type:HIDDEN = FALSE
              v-type:ROW = pdRow
              V-type:COL = pdCol 
              hWidg = v-type:HANDLE NO-ERROR. 
     WHEN "NAVIGATION":U THEN
     DO:
       IF c_SDOList:NUM-ITEMS > 1 THEN
         ASSIGN 
             /* we do not use side-label-handle because it's not manageable 
                before it's been viewed and we want to hide everything until
                last  */
             c_SDOLabel:SCREEN-VALUE = c_SDOLabel
             c_SDoLabel:COL = pdCol    
             c_SDOList:COL = pdCol
             c_sdoLabel:HIDDEN = FALSE
             c_sdoList:HIDDEN = FALSE
             c_SDOlabel:ROW = pdRow
             c_SDOList:ROW = pdRow + c_SDOLabel:HEIGHT
             hWidg = c_sdolist:HANDLE NO-ERROR.  

     END.   /* END DO WHEN Navigation */
   END.
 END.
 IF VALID-HANDLE(hWidg) THEN
 DO:
   hwidg:MOVE-AFTER(phToggle).
   ASSIGN
     pdRow = hWidg:ROW + hWidg:HEIGHT  
     pdCol = hWidg:COL + hWidg:WIDTH.
 END.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

/* ************************  Function Implementations ***************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION addDisabledAction SP-attr-dialog 
FUNCTION addDisabledAction RETURNS LOGICAL
  ( pcAction AS CHAR  ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  IF LOOKUP(pcAction,gcDisabledActions) = 0 THEN
    gcDisabledActions = gcDisabledActions 
                      + (IF gcDisabledActions = "":U THEN "":U ELSE ",":U)
                      + pcAction.
  RETURN TRUE .

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION addHiddenAction SP-attr-dialog 
FUNCTION addHiddenAction RETURNS LOGICAL
  ( pcAction AS CHAR  ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  IF LOOKUP(pcAction,gcHiddenActions) = 0 THEN
    gcHiddenActions = gcHiddenActions 
                    + (IF gcHiddenActions = "":U THEN "":U ELSE ",":U)
                    + pcAction.
  RETURN TRUE.
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION createAction SP-attr-dialog 
FUNCTION createAction RETURNS LOGICAL
  (phFrame    AS HANDLE,
   pcCategory AS char,
   pcAction   AS CHAR,
   pdrow      AS DEC,
   pdcol      AS DEC) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE hImage AS HANDLE     NO-UNDO.
  DEFINE VARIABLE cImage AS CHARACTER  NO-UNDO.
  
  pcAction  = CAPS(SUBSTR(pcAction,1,1)) 
                     + LC(SUBSTR(pcAction,2)). 
  FIND tChildaction 
       WHERE tChildAction.NAME     = pcAction NO-ERROR.
  
  IF NOT AVAIL tChildaction THEN
  DO:
    CREATE tChildAction.
    ASSIGN 
      tChildAction.Category = pcCategory
      tChildAction.NAME     = pcAction.

    CREATE IMAGE hImage
      ASSIGN 
        FRAME      = phframe
        SELECTABLE = TRUE
        HIDDEN     = TRUE.
    tChildAction.ImageHdl = hImage. 
    cImage = {fnarg actionImage pcAction p_hSmO}.
    
    IF NOT glUseRepository THEN
      cImage = gcImagePath 
               + (IF gcImagePath <> '':U THEN '/':U ELSE '':U)
               + cImage.

    tChildAction.ImageHdl:LOAD-IMAGE(cImage) NO-ERROR.
    
    CREATE TEXT tChildAction.TxtHdl
      ASSIGN 
        FRAME  = phframe
        FORMAT = 'X(20)'
        SCREEN-VALUE = pcAction
        WIDTH  = 20
        SELECTABLE = TRUE
        HIDDEN = TRUE.

    CREATE TOGGLE-BOX tChildAction.DisableHdl
      ASSIGN 
        FRAME        = phFRAME
        SENSITIVE    = FALSE
        LABEL        = "Disable" 
       /* WIDTH        = 2.5*/
        HIDDEN       = TRUE         
        SENSITIVE    = TRUE 
        CHECKED      = CAN-DO(gcDisabledActions,tChildAction.NAME)
                       AND
                       NOT CAN-DO(gcHiddenActions,tChildAction.NAME)
      TRIGGERS:
       ON VALUE-CHANGED 
         PERSISTENT RUN OnValueChangedChild(tChildAction.NAME).
      END.

      CREATE TOGGLE-BOX tChildAction.HideHdl
        ASSIGN 
          FRAME        = phFRAME
          SENSITIVE    = FALSE 
          LABEL        = "Hide" 
         /* WIDTH        = 2.5*/
          HIDDEN       = TRUE 
          SENSITIVE    = TRUE 
          CHECKED      = CAN-DO(gcHiddenActions,tChildAction.NAME)                         
        TRIGGERS:
         ON VALUE-CHANGED 
           PERSISTENT RUN OnValueChangedChild(tChildAction.NAME).
        END.

    ASSIGN
      tChildaction.Row            = pdRow
      tChildAction.ImageHdl:COL   = pdCol 
      tChildAction.ImageHdl:ROW   = pdrow
      tChildAction.TxtHdl:COL     = pdCol + tChildAction.ImageHdl:WIDTH + 1 
      tChildAction.TxtHdl:ROW     = pdRow
      tChildAction.DisableHdl:COL = tChildAction.TxtHdl:COL 
                                  + tChildAction.TxtHdl:WIDTH + 1 
      tChildAction.DisableHdl:ROW = pdRow

      tChildAction.HideHdl:COL = tChildAction.DisableHdl:COL 
                               + tChildAction.DisableHdl:WIDTH + 1  
      tChildAction.HideHdl:ROW = pdRow
     /* Running HideViewAction AFTER all actions have been created
        makes it seem faster....  ..   
      tChildAction.ImageHdl:HIDDEN = FALSE 
      tChildAction.TxtHdl:HIDDEN = FALSE
      tChildAction.DisableHdl:HIDDEN = FALSE
      tChildAction.HideHdl:HIDDEN = FALSE */ NO-ERROR.
  END.
    
  RETURN true.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION createFrameBorder SP-attr-dialog 
FUNCTION createFrameBorder RETURNS LOGICAL
  ( phFrame AS HANDLE) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
     DEFINE VARIABLE hLeft AS HANDLE     NO-UNDO.
   DEFINE VARIABLE hTop AS HANDLE     NO-UNDO.
   DEFINE VARIABLE hBottom AS HANDLE     NO-UNDO.
   DEFINE VARIABLE hRight AS HANDLE     NO-UNDO.
   
   ASSIGN 
    

     phframe:Y        = phframe:Y + 2
     phframe:X        = phframe:X + 2.

   CREATE RECTANGLE hleft
       ASSIGN   
       FGCOLOR = 7
          HEIGHT-P = phFrame:HEIGHT-P + 4
          WIDTH-P = 2
          X =  phFrame:X - 2
       Y  = phFrame:y - 2
        FRAME =FRAME {&FRAME-NAME}:HANDLE
        HIDDEN =FALSE.

   CREATE RECTANGLE htOP
         ASSIGN   
         FGCOLOR = 7
            width-P = phFrame:width-P + 4
            HEIGHT-P = 2
            X  = phFrame:X - 2
            Y  = phFrame:y - 2
          FRAME =FRAME {&FRAME-NAME}:HANDLE

          HIDDEN =FALSE.
     CREATE RECTANGLE hbOTTOM
         ASSIGN   
         FGCOLOR = 15
            width-P = phFrame:width-P + 3
            HEIGHT-P = 1
            X  = phFrame:X - 2
            Y  = phFrame:y + phFrame:HEIGHT-P + 1
          FRAME =FRAME {&FRAME-NAME}:HANDLE

          HIDDEN =FALSE.
     CREATE RECTANGLE hRight
       ASSIGN   
       FGCOLOR = 15
          HEIGHT-P = phFrame:HEIGHT-P + 3
          X  = phFrame:X + phFrame:width-P + 1
          Y  = phFrame:y - 2
          WIDTH-P = 1
        FRAME =FRAME {&FRAME-NAME}:HANDLE

        HIDDEN =FALSE.
  RETURN true.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION createMenuBands SP-attr-dialog 
FUNCTION createMenuBands RETURNS LOGICAL
  (pcBand AS CHAR,
   INPUT-OUTPUT pdRow AS DEC,
   pdCol  AS DEC) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE cAvailBands AS CHARACTER NO-UNDO.
  DEFINE VARIABLE cLabel      AS CHARACTER NO-UNDO.
  DEFINE VARIABLE i           AS INTEGER   NO-UNDO.
   
  cAvailBands = {fnarg BandSubmenus pcBand p_hSMO}.
                                  
  DO i = 1 TO NUM-ENTRIES(cAvailBands):
    CREATE tBand.
    ASSIGN 
      tBand.NAME = ENTRY(i,cAvailBands)
      tBand.menu = TRUE.
    tBand.hdl  = createToggle(FRAME frMenuBands:HANDLE,
                              NO,
                             'MenuBand':U,
                             REPLACE(DYNAMIC-FUNCTION('bandSubmenuLabel':U IN p_hSMO,
                                                     pcBand,
                                                     tBand.name),
                                     '&',''), 
                              pdRow,
                              pdcol).
    tBand.hdl:CHECKED = NOT CAN-DO(gcHiddenMenuBands,tBand.NAME).
    pdRow = pdRow + xdScrollToggleHeight.
    
    createMenuBands(tBand.NAME,INPUT-OUTPUT pdRow, pdCol + 3).

  END.

  RETURN TRUE.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION createToggle SP-attr-dialog 
FUNCTION createToggle RETURNS HANDLE
  ( phFrame  AS HANDLE,
    plSelection AS LOGICAL,
    pcType   AS CHAR,
    pcLabel  AS CHAR,
    pdRow    AS DEC,
    pdCol    AS DEC) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE hToggle AS HANDLE     NO-UNDO.
  pcLabel = CAPS(SUBSTR(pcLabel,1,1)) 
            + LC(SUBSTR(pcLabel,2)). 
  CREATE TOGGLE-BOX hToggle
    ASSIGN 
      FRAME     = phFrame
      LABEL     = pcLabel
                  + IF plSelection THEN fill(' ',100) ELSE ''
      HIDDEN    = TRUE
      HEIGHT    = xdScrollToggleHeight
    TRIGGERS:
     /*
      ON VALUE-CHANGED 
          PERSISTENT RUN onValueChanged IN TARGET-PROCEDURE (pcType,pcLabel).
      */
    END. 
    /* if Selection add triggers to override default value-changed */ 
    IF plSelection THEN 
    DO:
      ON 'left-mouse-click' OF hToggle    
         PERSISTENT RUN onClick IN THIS-PROCEDURE (pcType,pcLabel).
      ON 'left-mouse-dblclick'  OF hToggle    
         PERSISTENT RUN onValueChanged IN THIS-PROCEDURE (pcType,pcLabel).
      /*
      ON ' '  OF hToggle    
         PERSISTENT RUN onValueChanged IN THIS-PROCEDURE (pcType,pcLabel).
         */
      ON ENTRY OF hToggle 
         PERSISTENT RUN onEntry IN THIS-PROCEDURE (hToggle).
      ON LEAVE OF hToggle 
         PERSISTENT RUN onLeave IN THIS-PROCEDURE (hToggle).
      ON 'cursor-down' OF hToggle    
         PERSISTENT RUN onDown IN THIS-PROCEDURE (hToggle).
      ON 'cursor-right' OF hToggle    
         PERSISTENT RUN onDown IN THIS-PROCEDURE (hToggle).
      ON 'cursor-up' OF hToggle    
         PERSISTENT RUN onUp IN THIS-PROCEDURE (hToggle).
      ON 'cursor-left' OF hToggle    
         PERSISTENT RUN onUp IN THIS-PROCEDURE (hToggle).
      ASSIGN 
        hToggle:WIDTH     = phFrame:WIDTH - (pdCol + 2.5).
    END.
    
    ON VALUE-CHANGED OF hToggle
        PERSISTENT RUN onValueChanged IN THIS-PROCEDURE (pcType,pcLabel).
    ASSIGN
      hToggle:COL       = pdCol
      hToggle:ROW       = pdRow  NO-ERROR.
    
    RETURN hToggle.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION deleteActions SP-attr-dialog 
FUNCTION deleteActions RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  FOR EACH tAction:
    IF VALID-HANDLE(tAction.hdl) THEN 
      DELETE OBJECT tAction.hdl.
    IF VALID-HANDLE(tAction.RectHdl) THEN
      DELETE OBJECT tAction.RectHdl.
    IF VALID-HANDLE(tAction.DivideHdl) THEN
      DELETE OBJECT tAction.DivideHdl.
    IF VALID-HANDLE(tAction.TxtHdl) THEN
      DELETE OBJECT tAction.TxtHdl.
    DELETE tAction.
  END.
  FOR EACH tBand:
    IF VALID-HANDLE(tBand.hdl) THEN 
      DELETE OBJECT tBand.hdl.
    DELETE tBand.
  END.
  FOR EACH tChildAction :       
    IF VALID-HANDLE(tChildAction.Txthdl) THEN
      DELETE OBJECT tChildAction.Txthdl.
    IF VALID-HANDLE(tChildAction.Disablehdl) THEN
      DELETE OBJECT tChildAction.Disablehdl.
    IF VALID-HANDLE(tChildAction.Hidehdl) THEN
      DELETE OBJECT tChildAction.Hidehdl.
    IF VALID-HANDLE(tChildAction.Imagehdl) THEN
      DELETE OBJECT tChildAction.Imagehdl.
    DELETE tChildAction.
  END.

  RETURN FALSE.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION initActions SP-attr-dialog 
FUNCTION initActions RETURNS LOGICAL
  (pcCategory AS CHAR) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE i        AS INTEGER    NO-UNDO.
  DEFINE VARIABLE cActions AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cAction  AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE dCol     AS DECIMAL    NO-UNDO.
  DEFINE VARIABLE dRow     AS DECIMAL    NO-UNDO.
  DEFINE VARIABLE hDL      AS HANDLE     NO-UNDO.
  DEFINE VARIABLE lOk      AS LOGICAL    NO-UNDO.
  
  IF gcCurrentCategory <> ? THEN 
  DO:
    FIND tAction WHERE tAction.Name = gcCurrentCategory NO-ERROR.
    IF AVAIL tAction AND VALID-HANDLE(tAction.Hdl) THEN 
      ASSIGN 
        tAction.Hdl:BGCOLOR = ?
        tAction.hdl:FGCOLOR = ?.
    viewHideActions(gcCurrentCategory, FALSE).
  END.

  FIND tAction WHERE tAction.Name = pcCategory NO-ERROR.
  
  IF AVAIL tAction AND VALID-HANDLE(tAction.Hdl) THEN 
    ASSIGN 
      tAction.Hdl:BGCOLOR = 1
      tAction.hdl:FGCOLOR = 15.
  
  lOk = viewHideActions(pcCategory, TRUE).
  
  IF NOT lok THEN
  DO:
    cActions = IF glUseRepository 
               THEN {fnarg CategoryActions pcCategory p_hSMO}
               ELSE {fnarg ActionChildren pcCategory p_hSMO}.
    dRow = 1.
    dCol = 1.
    DO i = 1 TO NUM-ENTRIES(cActions):
      cAction = ENTRY(i,cActions).
      createAction(FRAME frActions:HANDLE,
                   pcCategory,
                   cAction, 
                   dRow,
                   dCol).
      dRow = dRow + 1.
    END.
    viewHideActions(pcCategory, TRUE).
  END.
  gcCurrentCategory = pcCategory.

  RETURN TRUE.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION initContents SP-attr-dialog 
FUNCTION initContents RETURNS LOGICAL
  (pcContents AS CHAR) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE dRow AS DECIMAL    NO-UNDO.
  DEFINE VARIABLE dCol AS DECIMAL    NO-UNDO.
  DEFINE VARIABLE dCol2 AS DECIMAL    NO-UNDO.
  DEFINE VARIABLE cMenuActions AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE cToolbarActions AS CHARACTER  NO-UNDO.
  DEFINE VARIABLE i AS INTEGER    NO-UNDO.
  DEFINE VARIABLE cSort           AS CHAR   NO-UNDO INIT 
      "Navigation,Tableio,Transaction,Filter".
        
  RUN hideActionWidgets.

  initToolbarBands().
  initMenuBands().

  ASSIGN
    cMenuActions    = DYNAMIC-FUNCTION("getAvailMenuActions" IN p_hSMO)
    cToolbarActions = DYNAMIC-FUNCTION("getAvailToolbarActions" IN p_hSMO).

  DO i = 1 TO NUM-ENTRIES(cMenuActions):
    CREATE tAction.    
    ASSIGN 
      tAction.Name  = ENTRY(i,cMenuActions)
      tAction.Sort1 = IF LOOKUP(tAction.Name,cSort) > 0  
                      THEN LOOKUP(tAction.Name,cSort)
                      ELSE 10  
      tAction.Sort2 = i.
    /* disable <none> category... */
    tAction.Menu  = TRUE.

  END.
  
  DO i = 1 TO NUM-ENTRIES(cToolbarActions):
    FIND tAction WHERE tAction.Name = ENTRY(i,cToolbarActions) NO-ERROR.  
    IF NOT AVAIL tAction THEN
    DO:
      CREATE tAction.    
   
      ASSIGN 
        tAction.Name  = ENTRY(i,cToolbarActions)
        tAction.Sort1 = IF LOOKUP(tAction.Name,cSort) > 0  
                        THEN LOOKUP(tAction.Name,cSort)
                        ELSE 10  
        tAction.Sort2 = i.
    END.
    /* disable <none> category... */
    tAction.Tool   = TRUE.

  END.       
  

  dRow = 1.
  dCol = xdScrollToggleCol.  
  FOR EACH tAction WITH FRAME frMain : 
    tAction.link = IF glUseRepository 
                   THEN {fnarg categoryLink tAction.NAME p_hSMO}
                   ELSE {fnarg actionLink tAction.NAME p_hSMO}.
                     
    tAction.hdl =  createToggle(FRAME frMain:HANDLE,
                                YES, /* selection checklist */
                                'Category':U,
                                tAction.NAME,
                                dRow,
                                dCol).
    tAction.hdl:CHECKED   = CAN-DO(pcContents,tAction.Name)
                            /* Checked is true for undefined category
                               (cannot be unchecked) */
                            OR (glUseRepository 
                                AND NOT  {fnarg canfindCategory tAction.NAME p_hSMO}
                                ) .
    tAction.hdl:SENSITIVE = (v-Menu AND tAction.Menu) OR (v-toolbar AND tAction.tool).
    
    IF dRow = 1 THEN 
      initActions(tAction.NAME).

    dRow = dRow + xdScrollToggleHeight.
    
    dCol2 = dCol + 4.

    RUN visualizeActionWidgets(tAction.Name,
                               tAction.Hdl,
                               INPUT-OUTPUT dRow,
                               INPUT-OUTPUT dcol2).
 
    RUN enableActionWidgets(tAction.name,TRUE).
  END.
  viewContents().
  RETURN true.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION initMenuBands SP-attr-dialog 
FUNCTION initMenuBands RETURNS LOGICAL
  (  ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE pdRow AS DECIMAL    NO-UNDO INIT 1.
  
  createMenuBands('',INPUT-OUTPUT pdRow, xdScrollToggleCol).
  RETURN TRUE.   
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION initPages SP-attr-dialog 
FUNCTION initPages RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEF VAR i     AS INT.
  DEF VAR iPos  AS INT.
  DEF VAR imaxPos AS INT.
  DEF VAR iPos2 AS INT.
  DEF VAR iPos3 AS INT.
  DEF VAR cObjects AS CHAR NO-UNDO.
  DEF VAR cStrHdl  AS CHAR NO-UNDO.
  DEF VAR iPage    AS INT NO-UNDO.
  def var proc as char.
  def var C-CODE as char.
  def var C-pageCODE as char.
  def var C-page as char.
  def var hWin AS HANDLE.
  
   
  /* Get context id of procedure */
  RUN adeuib/_uibinfo.p (?, "PROCEDURE ?":U, "PROCEDURE":U, OUTPUT Proc).
  
  /* Get context id of procedure */
  RUN adeuib/_uibinfo.p (int(proc), ?, "contains smartobject", OUTPUT cObjects).
  /*
  DO i = 1 TO NUM-ENTRIES(cobjects):
    RUN adeuib/_uibinfo.p (int(entry(i,cobjects)), ?, "name", OUTPUT c-code).
    message c-code view-aS ALERT-BOX.
    RUN adeuib/_uibinfo.p (int(entry(i,cobjects)), ?, "type", OUTPUT c-code).
    message c-code view-aS ALERT-BOX.
    RUN adeuib/_uibinfo.p (int(entry(i,cobjects)), ?, "handle", OUTPUT c-code).
    message c-code view-aS ALERT-BOX.
      
  END. 
  */
  DEF VAR I-CONTEXT AS INT INIT ?.
 
  run adeuib/_accsect.p 
                            ("GET", ?, "PROCEDURE:ADM-CREATE-OBJECTS", 
                              INPUT-OUTPUT i-context,
                              INPUT-OUTPUT c-code).
 
  ipos2 = 1.
  DO WHILE TRUE:
    ipos = INDEX(c-code,"WHEN",ipos2).
    IF ipos > 0 THEN 
    DO:  
      ipos2   = ipos + 1.
      imaxpos = INDEX(c-code,"WHEN",ipos2).
      c-pagecode = IF imaxpos = 0
                   THEN SUBSTR(c-code,ipos)
                   ELSE SUBSTR(c-code,ipos,imaxpos - ipos).
      iPage = int(ENTRY(2,c-pagecode," ")).
      iPos3 = 1.
      IF iPage > 0 THEN
      DO WHILE TRUE:
        ipos = INDEX(c-pagecode,"OUTPUT",ipos3).
        IF ipos > 0 THEN     
        DO:
          create tPage.          
          tPage.pageNum = iPage.
          tPage.name = ENTRY(2,SUBSTR(c-pagecode,ipos)," ":U).
          RUN adeuib/_uibinfo.p (?,tPage.Name, "procedure-handle", OUTPUT cStrHdl).
          tPage.Hdl = WIDGET-HANDLE(cStrHdl).
          IF valid-handle(tPage.Hdl) THEN 
          DO:
            hWin = DYNAMIC-FUNCTION("getContainerHandle" in tPage.Hdl).
            IF hWin:TYPe = "WINDOW":U THEN 
              tPage.Caption = hWin:TITLE.
            ELSE DO:
              DELETE tPage.
            END. 
          END.
          ipos3 = ipos + 1.        
        END.
        ELSE DO:
          ipos2 = ipos2 + ipos3.
          LEAVE.
        END.
      END.
    END.
    ELSE leave.
  END.  
    
  RETURN can-find(first tpage).

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION initToolbar SP-attr-dialog 
FUNCTION initToolbar RETURNS LOGICAL
    ( pcToolbar AS CHAR) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  {set LogicalObjectName pcToolbar p_hSMO}.
  
  RUN loadToolbar IN p_hSMO. 
  deleteActions().
  initContents(gcActionGroups).
  setObjectstates().
  RETURN TRUE.
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION initToolbarBands SP-attr-dialog 
FUNCTION initToolbarBands RETURNS CHARACTER
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE cAvailBands AS CHARACTER NO-UNDO.
  DEFINE VARIABLE i           AS INTEGER   NO-UNDO.
  DEFINE VARIABLE pdRow       AS DECIMAL    NO-UNDO.
  
  cAvailBands = {fn getAvailToolbarBands p_hSMO}. 
  pdrow = 1.
  DO i = 1 TO NUM-ENTRIES(cAvailBands):
    CREATE tBand.
    ASSIGN 
      tBand.NAME = ENTRY(i,cAvailBands)
      tBand.tool = TRUE.
    tBand.hdl  = createToggle(FRAME frToolbarBands:HANDLE,
                              NO,
                             'ToolbarBand',
                              tBand.NAME,
                              pdRow,
                              xdScrollToggleCol).
    tBand.hdl:CHECKED = NOT CAN-DO(gcHiddenToolbarBands,tBand.NAME).
    pdrow = pdRow + xdScrollToggleHeight.

  END.

  RETURN "".   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION removeDisabledAction SP-attr-dialog 
FUNCTION removeDisabledAction RETURNS LOGICAL
  ( pcAction AS CHAR) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  gcDisabledActions  = removeEntry(pcAction,gcDisabledActions).
  RETURN TRUE.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION removeEntry SP-attr-dialog 
FUNCTION removeEntry RETURNS CHARACTER
  ( pcEntry AS CHAR,
    pcList AS CHAR) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  RETURN TRIM(REPLACE(",":U + pcList + ",","," + pcEntry + ",",","),","). 
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION removeHiddenAction SP-attr-dialog 
FUNCTION removeHiddenAction RETURNS LOGICAL
  ( pcAction AS CHAR) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  gcHiddenActions  = removeEntry(pcAction,gcHiddenActions).
  RETURN TRUE.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION resizeRectangles SP-attr-dialog 
FUNCTION resizeRectangles RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  Adjust rectangles in same column to same size 
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE dCol   AS DECIMAL    NO-UNDO.
  DEFINE VARIABLE dWidth   AS DECIMAL    NO-UNDO.
  
  FOR EACH tAction 
      BY tAction.Hdl:COL
      BY IF VALID-HANDLE(tAction.recthdl) 
         THEN tAction.recthdl:WIDTH
         ELSE 0 DESCENDING:
     IF NOT (VALID-HANDLE(tAction.recthdl)) THEN
        NEXT.














     IF dCol = tAction.Hdl:COL THEN
     DO:
       tAction.recthdl:WIDTH = dWidth.       
       
       IF VALID-HANDLE(tAction.DivideHdl) THEN
         tAction.DivideHdl:WIDTH-P  = tAction.RectHdl:WIDTH-P - (giMargin * 2).
     END.
     ELSE
       ASSIGN
         dWidth = tAction.recthdl:WIDTH
         dCol   = tAction.Hdl:COL.
  END.

  RETURN true.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION setObjectStates SP-attr-dialog 
FUNCTION setObjectStates RETURNS LOGICAL
  (  ) :
/*-----------------------------------------------------------------------------
  Purpose: Set sensitivity of dynamic toggle-boxes according to 
           whether menu and toolbar is checked  
    Notes:  
 ---------------------------------------------------------------------------*/
  DO WITH FRAME {&FRAME-NAME}:
    FOR EACH tAction: 
       IF tAction.Tool = FALSE OR tAction.Menu = FALSE THEN
           tAction.Hdl:SENSITIVE = tAction.Tool AND v-toolbar:CHECKED
                                   OR
                                   tAction.Menu AND v-Menu:CHECKED.

       RUN enableActionWidgets(tAction.NAME,
                               tAction.Hdl:SENSITIVE AND tAction.hdl:CHECKED).
    END. /* for each tAction */   
    FOR EACH tBand: 
       tBand.Hdl:SENSITIVE = tBand.Tool AND v-toolbar:CHECKED
                             OR
                             tBand.Menu AND v-Menu:CHECKED.
    END. /* for each tAction */   

    
    ASSIGN v-show:SENSITIVE = v-toolbar:CHECKED
           cDrawDirection:SENSITIVE = v-toolbar:CHECKED
           lAutosize:SENSITIVE = v-toolbar:CHECKED
           ctoolbarParentMenu:SENSITIVE = v-menu:CHECKED 
                                          AND int(iMenuMergeOrder:SCREEN-VALUE) > 1

           iMenuMergeOrder:SENSITIVE = v-menu:CHECKED. 
  END. 

  RETURN TRUE. 
  
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION setTableioState SP-attr-dialog 
FUNCTION setTableioState RETURNS LOGICAL 
  ( pcState AS CHAR ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE BUFFER btChildAction FOR tchildAction.

  FIND FIRST btChildAction WHERE btChildAction.NAME = 'Update':U NO-ERROR.
  
  IF AVAIL btChildaction THEN
  DO:
    ASSIGN btChildAction.HideHdl:CHECKED   = pcState <> 'Update'
           btChildAction.hideHdl:SENSITIVE = pcState = 'Update'. 
  END.

  IF pcState <> 'Update' THEN
     addHiddenAction('Update':U).
  ELSE
     removeHiddenAction('Update':U).
  
  RETURN TRUE.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION showActionWidgets SP-attr-dialog 
FUNCTION showActionWidgets RETURNS CHARACTER
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/

  RETURN "".   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION viewContents SP-attr-dialog 
FUNCTION viewContents RETURNS LOGICAL
  ( /* parameter-definitions */ ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE lScroll  AS LOGICAL  NO-UNDO INIT ?.
  FOR EACH tAction BY tAction.SORT1 DESCENDING:
    IF VALID-HANDLE(tAction.hdl) THEN  
    DO:
      IF lScroll = ? THEN
         lScroll = tAction.Hdl:ROW + taction.Hdl:HEIGHT > FRAME frMain:HEIGHT. 
      
      IF NOT lScroll THEN
         taction.Hdl:WIDTH = FRAME frMain:WIDTH - tAction.Hdl:COL  + 1.

      tAction.hdl:HIDDEN = FALSE NO-ERROR.
    END.
    IF VALID-HANDLE(tAction.RectHdl) THEN
      tAction.RectHdl:HIDDEN = FALSE NO-ERROR.
    IF VALID-HANDLE(tAction.DivideHdl) THEN
      tAction.DivideHdl:HIDDEN = FALSE NO-ERROR.
    IF VALID-HANDLE(tAction.TxtHdl) THEN
      tAction.TxtHdl:HIDDEN = FALSE NO-ERROR. 
  END.
  FOR EACH tBand:
    IF VALID-HANDLE(tBand.hdl) THEN 
      tBand.hdl:HIDDEN = FALSE NO-ERROR.
  END.
  RETURN TRUE.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION viewHideActions SP-attr-dialog 
FUNCTION viewHideActions RETURNS LOGICAL
  ( pcCategory AS CHAR,
    plView     AS LOGICAL) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
 
  DEFINE VARIABLE lAny AS LOGICAL    NO-UNDO.
  
  FOR EACH tChildAction WHERE tChildAction.Category = pcCategory:
     IF VALID-HANDLE(tChildAction.Txthdl) THEN
       ASSIGN
          tChildAction.Txthdl:ROW = IF NOT plView THEN 1 ELSE tChildAction.Row 
          tChildAction.Txthdl:HIDDEN = NOT plview 
      NO-ERROR.

     IF VALID-HANDLE(tChildAction.DisableHdl) THEN
       ASSIGN
         tChildAction.Disablehdl:ROW = IF NOT plView THEN 1 ELSE tChildAction.Row 
         tChildAction.DisableHdl:HIDDEN = NOT plview 
       NO-ERROR.
     IF VALID-HANDLE(tChildAction.HideHdl) THEN
       ASSIGN
         tChildAction.Hidehdl:ROW   = IF NOT plView THEN 1 ELSE tChildAction.Row 
         tChildAction.HideHdl:HIDDEN = NOT plview 
       NO-ERROR.
     IF VALID-HANDLE(tChildAction.ImageHdl) THEN
       ASSIGN
         tChildAction.Imagehdl:ROW = IF NOT plView THEN 1 ELSE tChildAction.Row 
         tChildAction.ImageHdl:HIDDEN = NOT plview 
         NO-ERROR.

     lAny = TRUE.
  END.

  IF pcCategory = 'TABLEIO':U AND plView THEN
    setTableioState(v-type).

  RETURN lAny.   /* Function return value. */

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

