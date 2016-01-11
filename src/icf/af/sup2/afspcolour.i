&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v8r12
&ANALYZE-RESUME
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Method-Library 
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
/*--------------------------------------------------------------------------
    Library     : afspcolour.i

    Purpose     : Provides access to colour-table mappings

    Syntax      : af/sup2/afspcolour.i

    Description : Incorporates 4GL function that returns Progress colour-table
                  number for a colour scheme ID.

  ------------------------------------------------------------------------*/
/*          This .W file was created with the Progress UIB.             */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&IF DEFINED(COLOR-LIST) = 0
&THEN

&GLOBAL-DEFINE SUPER-HDL pSuper-hdl
&GLOBAL-DEFINE SUPER-UID pSuper-uid

DEFINE NEW GLOBAL SHARED VARIABLE {&SUPER-HDL} AS HANDLE  NO-UNDO.
DEFINE NEW GLOBAL SHARED VARIABLE {&SUPER-UID} AS INTEGER NO-UNDO.

&GLOBAL-DEFINE COLOR-LIST ~
Black,Blue,Green,Cyan,Red,Magenta,Brown,DarkGray,Gray,LightBlue,LightGreen,LightCyan,LightRed,LightMagenta,Yellow,White

&SCOPED-DEFINE COLOR-NUM 0,1,2,3,4,5,6,6,7,7,8,8,8,8,9,10,11,12,13,14,15

/* The base point in the colour table from which Windows colours are mapped.
   The value here is one less than the real base, as an index of 1 or greater
   is always used to reference the colour table.
*/
&GLOBAL-DEFINE COLOUR-MAP-BASE 16

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&IF DEFINED(EXCLUDE-COLOR-OF) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD COLOR-OF Method-Library 
FUNCTION COLOR-OF RETURNS INTEGER
  ( INPUT ip-text AS CHARACTER )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Method-Library
   Allow: 
   Frames: 0
   Add Fields to: Neither
   Other Settings: INCLUDE-ONLY
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW Method-Library ASSIGN
         HEIGHT             = 8.43
         WIDTH              = 61.4.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _INCLUDED-LIB Method-Library 
/* ************************* Included-Libraries *********************** */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME





&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Method-Library 


/* ***************************  Main Block  *************************** */

/* Start the procedure, if it's not already running */

&IF DEFINED(v9t-SUPER) = 0
&THEN
    IF NOT VALID-HANDLE({&SUPER-HDL}) 
    OR {&SUPER-HDL}:UNIQUE-ID <> {&SUPER-UID}
    THEN 
        RUN af/sup2/afspsuperp.p PERSISTENT.
&ENDIF

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Implementations ***************** */

&IF DEFINED(EXCLUDE-COLOR-OF) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION COLOR-OF Method-Library 
FUNCTION COLOR-OF RETURNS INTEGER
  ( INPUT ip-text AS CHARACTER ) :
/*------------------------------------------------------------------------------
  Purpose: Converts a colour scheme name to a progress colour table number.

    Notes: The input parameter can be a basic colour name (Green Blue etc.) or
           a Windows colour scheme name (GrayText,ButtonShadow etc.).
------------------------------------------------------------------------------*/
  DEFINE VARIABLE iEntry AS INTEGER NO-UNDO.

  ASSIGN ip-text = REPLACE(ip-text,"DarkYellow","Brown")
         ip-text = REPLACE(ip-text,"Grey","Gray")
         ip-text = REPLACE(ip-text,"LightGray","Gray")
         iEntry  = LOOKUP(ip-text,{&SUPER-HDL}:PRIVATE-DATA) - 1.

  RETURN IF iEntry < 1 THEN ? ELSE iEntry.

END FUNCTION.

&ENDIF

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

