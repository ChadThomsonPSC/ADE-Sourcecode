&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v8r12
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
  File: ttlookup.i

  Description:  Lookup data build temp-table

  Purpose:      Lookup data build temp-table

  Parameters:   <none>

  History:
  --------
  (v:010000)    Task:        7065   UserRef:    
                Date:   13/11/2000  Author:     Anthony Swindells

  Update Notes: Created from Template afteminclu.i

  (v:010002)    Task:    90000166   UserRef:    
                Date:   24/07/2001  Author:     Mark Davies

  Update Notes: Add new field to lookup temp-table to indicate if more than one record could be found for lookup query.

  Modified: 11/08/2001		Mark Davies (MIP)
	    Moved out of ICF structure
------------------------------------------------------------------------------*/
/*                   This .W file was created with the Progress UIB.             */
/*-------------------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */
/* MIP-GET-OBJECT-VERSION pre-processors
   The following pre-processors are maintained automatically when the object is
   saved. They pull the object and version from Roundtable if possible so that it
   can be displayed in the about window of the container */

&scop object-name       ttlookup.i
&scop object-version    010002


/* MIP object identifying preprocessor */
&glob   mip-structured-include  yes

DEFINE TEMP-TABLE ttLookup NO-UNDO
FIELD hWidget               AS HANDLE           /* Handle of lookup SDF */
FIELD cWidgetName           AS CHARACTER        /* Name of external field */
FIELD cWidgetType           AS CHARACTER        /* Data Type of external field, e.g. DECIMAL, INTEGER, CHARACTER, DATE, etc. */
FIELD cForEach              AS CHARACTER        /* FOR EACH statement used to retrieve the data */
FIELD cBufferList           AS CHARACTER        /* comma delimited list of buffers used in FOR EACH */
FIELD cFieldList            AS CHARACTER        /* comma delimited list of fields to return */
FIELD cDataTypeList         AS CHARACTER        /* comma delimited list of fields to return data types */
FIELD cFoundDataValues      AS CHARACTER        /* Found list of data values CHR(1) delimited (empty if not found) */
FIELD cRowIdent             AS CHARACTER        /* comma list of rowids for current record */
FIELD lMoreFound            AS LOGICAL          /* YES if more than one record could be found for the lookup query */
INDEX keyIndex IS PRIMARY hWidget cWidgetName
INDEX key2 cWidgetName hWidget
.

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
         HEIGHT             = 5.95
         WIDTH              = 40.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Include 


/* ***************************  Main Block  *************************** */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


