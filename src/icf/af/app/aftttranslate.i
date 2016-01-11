&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v8r12
&ANALYZE-RESUME
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Check Version Notes Wizard" Include _INLINE
/* Actions: af/cod/aftemwizcw.w ? ? ? ? */
/* MIP Update Version Notes Wizard
Check object version notes.
af/cod/aftemwizpw.w
*/
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Update-Object-Version" Include _INLINE
/* Actions: ? ? ? ? af/sup/afverxftrp.p */
/* This has to go above the definitions sections, as that is what it modifies.
   If its not, then the definitions section will have been saved before the
   XFTR code kicks in and changes it */
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Definition Comments Wizard" Include _INLINE
/* Actions: ? af/cod/aftemwizcw.w ? ? ? */
/* Program Definition Comment Block Wizard
Welcome to the Program Definition Comment Block Wizard. Press Next to proceed.
af/cod/aftemwizpw.w
*/
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Include 
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
  File: aftttranslate.i

  Description:  Multi-Translation temp-table

  Purpose:      Multi-Translation temp-table

  Parameters:   <none>

  History:
  --------
  (v:010000)    Task:        6010   UserRef:    
                Date:   15/06/2000  Author:     Anthony Swindells

  Update Notes: Write Astra 2 Profile Manager and Translation Manager / update supporting
                files

  (v:010001)    Task:        7405   UserRef:    
                Date:   28/12/2000  Author:     Anthony Swindells

  Update Notes: add formats and labels for browser setup of translations

-----------------------------------------------------------------*/
/*                   This .W file was created with the Progress UIB.             */
/*-------------------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */
/* MIP-GET-OBJECT-VERSION pre-processors
   The following pre-processors are maintained automatically when the object is
   saved. They pull the object and version from Roundtable if possible so that it
   can be displayed in the about window of the container */

&scop object-name       aftttranslate.i
&scop object-version    010001


/* MIP object identifying preprocessor */
&glob   mip-structured-include  yes

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Include
   Allow: 
   Frames: 0
   Add Fields to: Neither
   Other Settings: INCLUDE-ONLY
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW Include ASSIGN
         HEIGHT             = 5.57
         WIDTH              = 64.4.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME




&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Include 


/* ***************************  Main Block  *************************** */

&IF DEFINED(ttTranslate) = 0 &THEN
  DEFINE TEMP-TABLE ttTranslate NO-UNDO RCODE-INFORMATION
  FIELD dLanguageObj        AS DECIMAL                                                  /* language object or 0 for login language */
  FIELD cLanguageName       AS CHARACTER FORMAT "X(20)":U LABEL "Language":U            /* language name if known */
  FIELD cObjectName         AS CHARACTER FORMAT "X(40)":U LABEL "Object Name":U         /* object name or blank for all */
  FIELD lGlobal             AS LOGICAL   FORMAT "YES/NO":U LABEL "Global":U             /* yes = global translation, no = specific object (if not blank) */
  FIELD cWidgetType         AS CHARACTER FORMAT "X(20)":U LABEL "Widget Type":U         /* widget type, e.g. text, button, etc. */
  FIELD cWidgetName         AS CHARACTER FORMAT "X(40)":U LABEL "Widget Name":U         /* widget name or if type is text, text to translate */
  FIELD hWidgetHandle       AS HANDLE                                                   /* handle of widget if known / required */
  FIELD iWidgetEntry        AS INTEGER   FORMAT "9":U     LABEL "Element":U             /* widget entry, used for radio-sets, etc. */
  FIELD lDelete             AS LOGICAL   FORMAT "YES/NO":U LABEL "Delete":U             /* yes = global translation, no = specific object (if not blank) */
  FIELD cTranslatedLabel    AS CHARACTER FORMAT "X(30)":U LABEL "Translated Label":U    /* translated label */
  FIELD cOriginalLabel      AS CHARACTER FORMAT "X(30)":U LABEL "Original Label":U      /* original untranslated label */
  FIELD cTranslatedTooltip  AS CHARACTER FORMAT "X(40)":U LABEL "Translated Tooltip":U  /* translated tooltip */
  FIELD cOriginalTooltip    AS CHARACTER FORMAT "X(40)":U LABEL "Original Tooltip":U    /* original untranslated tooltip */
  INDEX key1 AS UNIQUE PRIMARY dLanguageObj cObjectName cWidgetType cWidgetName hWidgetHandle iWidgetEntry
  INDEX key2 cLanguageName cObjectName cWidgetType cWidgetName iWidgetEntry
  INDEX key3 cObjectName cWidgetType cWidgetName iWidgetEntry
  INDEX key4 cWidgetName iWidgetEntry cObjectName cWidgetType
  .
  &GLOBAL-DEFINE ttTranslate
&ENDIF

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
