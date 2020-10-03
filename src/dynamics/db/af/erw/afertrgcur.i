%ForEachFKAtt() {
}/* Generated by ICF ERwin Template */
/* %Parent %VerbPhrase %Child ON CHILD UPDATE RESTRICT */
IF NEW %Child OR %ForEachFKAtt( OR ) { %Child.%AttFieldName <> o_%Child.%AttFieldName } THEN
  DO:
    %If(%!=(%Child, %Parent)) {
    IF NOT(CAN-FIND(FIRST %Parent WHERE
        %JoinFKPK(%Child,%Parent," = "," and"))) THEN
              DO:
                /* Cannot update child because parent does not exist ! */
                ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 103 lv-include = "%Child|%Parent":U.
                RUN error-message (lv-errgrp, lv-errnum, lv-include).
              END.
    }
    %If(%==(%Child, %Parent)) {
    IF NOT(CAN-FIND(FIRST lb_table WHERE
        %JoinFKPK(%Child,lb_table," = "," and"))) THEN
              DO:
                /* Cannot update child because parent does not exist ! */
                ASSIGN lv-error = YES lv-errgrp = "AF ":U lv-errnum = 103 lv-include = "%Child|%Parent":U.
                RUN error-message (lv-errgrp, lv-errnum, lv-include).
              END.
    }
  END.
