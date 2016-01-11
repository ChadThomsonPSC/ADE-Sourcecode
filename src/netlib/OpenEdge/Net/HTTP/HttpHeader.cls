/************************************************
Copyright (c)  2015 by Progress Software Corporation. All rights reserved.
*************************************************/
/*------------------------------------------------------------------------
    File        : HttpHeader
    Purpose     : A basic HTTP header. Can be extended for headers that have multi-part values
                  (like Content-Type which has an optional charset= part.
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Wed Feb 11 11:49:10 EST 2015
    Notes       : 
  ----------------------------------------------------------------------*/
block-level on error undo, throw.

using OpenEdge.Core.Assert.

class OpenEdge.Net.HTTP.HttpHeader:
    define static private temp-table HeaderParameter no-undo
        field ParentHeader as integer 
        field ParamName as character
        field ParamValue as character
        index idx1 as primary ParentHeader. 
    
    /** (mandatory) The name of the header */
    define public property Name as character no-undo get. private set.
    
    /** A header value */
    define public property Value as character no-undo
        get.
        set(input pcValue as character):
            define variable iLength as integer no-undo.
            
            if this-object:ParamDelimiter ne '':u then
            do:
                assign this-object:Value = pcValue.
                ExtractParameters().
            end.
            else
            do:
                assign iLength = length(pcValue, 'raw':u).
                
                /* strip off any quotation marks */
                if substring(pcValue, 1,       1) eq '~"' and
                   substring(pcValue, iLength, 1) eq '~"' then
                    assign pcValue = substring(pcValue, 2, iLength - 2, 'raw':u).
                
                assign this-object:Value = pcValue.
            end.
            
        end set.
    
    /** (optional) delimiter for header parameters */
    define public property ParamDelimiter as character no-undo
        get.
        set(input pcParamDelimiter as character):
            Assert:NotNull(pcParamDelimiter, 'Parameter delimiter').
            assign this-object:ParamDelimiter = pcParamDelimiter. 
        end set. 
    
    /** Constructor
        
        @param character The header name
        @param character The header value */
    constructor public HttpHeader(input pcName as character,
                                  input pcValue as character):
        this-object(pcName).
        Assert:NotNull(pcValue, 'Header value').
        
        assign this-object:Value = pcValue.
    end constructor.
    
    /** Constructor
        
        @param character The header name */
    constructor public HttpHeader(input pcName as character):
        Assert:NotNullOrEmpty(pcName, 'Header name').
        assign this-object:Name = pcName.
    end constructor.
    
    destructor HttpHeader():
        ClearParams().
    end destructor.
    
    /** Removes any parameter records for this header. */
    method protected void ClearParams():
        define buffer HeaderParameter for HeaderParameter.
        
        for each HeaderParameter where HeaderParameter.ParentHeader eq integer(this-object):
            delete HeaderParameter.
        end.
    end method.
    
    method override public character ToString():
        return substitute('&1: &2&3',
                           trim(this-object:Name),
                           this-object:GetBaseValue(),
                           this-object:GetParameterValues()).
    end method.
    
    /** Extracts/separates any parameters from the header's value, and stores the 'clean' value. */
    method public void ExtractParameters():
        define variable iLoop as integer no-undo.
        define variable iMax as integer no-undo.
        define variable cParam as character no-undo.
        define variable cValue as character no-undo.
        define variable iLength as integer no-undo.
        define variable iPos as integer no-undo.
        
        Assert:NotNullOrEmpty(this-object:ParamDelimiter, 'Param delimiter').
        
        assign iMax = num-entries(this-object:Value, this-object:ParamDelimiter).
        /* first entry is the content type (eg text/plain) */
        do iLoop = 2 to iMax:
            assign cParam  = trim(entry(iLoop, this-object:Value, this-object:ParamDelimiter))
                   /* the parameter value may contain quoted = characters, so use everthing from the 
                      first = onwards as a value. */
                   iPos    = index(cParam, '=':u)
                   cValue  = substring(cParam, iPos + 1) 
                   iLength = length(cValue, 'raw':u).
            
            /* strip off any quotation marks */
            if substring(cValue, 1,       1) eq '~"' and
               substring(cValue, iLength, 1) eq '~"' then
                assign cValue = substring(cValue, 2, iLength - 2, 'raw':u).
            
            SetParameterValue(entry(1, cParam, '=':u), cValue).
        end.
    end method.
    
    /** Indicates whether a parameter exists in the header
    
        @param character The name of the parameter to check.
        @return logical True if the parameter exists. */    
    method public logical HasParameter(input pcParamName as character):
        define buffer HeaderParameter for HeaderParameter.
        
        Assert:NotNullOrEmpty(pcParamName, 'Param name').
        
        find first HeaderParameter where
                   HeaderParameter.ParentHeader eq integer(this-object) and
                   HeaderParameter.ParamName eq pcParamName
                   no-error.
        
        return available HeaderParameter.
    end method.
    
    /** Returns a parameter from a (for example, 'charset' from Content-Type) header value 
        
        @param character The name of the parameter value to retrieve
        @param character The charset paremeter value; blank/empty otherwise 
        @param character The character used to separate param name/value pairs
        @return logical  True when the parameter was replaced/previously existed. */
    method public logical SetParameterValue(input pcParamName as character,
                                            input pcParamValue as character):
        define variable lExists as logical no-undo.
        define buffer HeaderParameter for HeaderParameter.
        
        Assert:NotNullOrEmpty(this-object:ParamDelimiter, 'Param delimiter').
        Assert:NotNullOrEmpty(pcParamName, 'Param name').
        Assert:NotNull(pcParamValue, 'Param value').
        
        find first HeaderParameter where
                   HeaderParameter.ParentHeader eq integer(this-object) and
                   HeaderParameter.ParamName eq pcParamName
                   no-error.
        assign lExists = available HeaderParameter.
        
        if not lExists then
        do:
            create HeaderParameter.
            assign HeaderParameter.ParentHeader = integer(this-object)
                   HeaderParameter.ParamName    = pcParamName.
        end.
        assign HeaderParameter.ParamValue = pcParamValue.
                           
        return lExists.                                                
    end method.
        
    /** Returns a parameter from a (for example, 'charset' from Content-Type) header value 
        
        @param character  The name of the parameter value to retrieve
        @return character The charset paremeter value; blank/empty otherwise */
    method public character GetParameterValue(input pcParamName as character):
        define buffer HeaderParameter for HeaderParameter.
        
        Assert:NotNullOrEmpty(pcParamName, 'Param name').

        /* blank delimiter means no parameters */        
        if this-object:ParamDelimiter eq '':u then
            return '':u.

        find first HeaderParameter where
                   HeaderParameter.ParentHeader eq integer(this-object) and
                   HeaderParameter.ParamName eq pcParamName
                   no-error.
        if available HeaderParameter then
            return HeaderParameter.ParamValue.
            
        return '':u.
    end method.
    
    /** Returns the unparameterised value for this header.
        
        @return character The value. */
    method public character GetBaseValue():
        if this-object:ParamDelimiter eq '':u then
            return this-object:Value.
        else
            return entry(1, this-object:Value, this-object:ParamDelimiter).
    end method.

    /** Returns the unparameterised value for this header.
        
        @return character The value. */
    method public character GetParameterValues():
        define variable cParameters as character no-undo.
        define variable cValue as character no-undo.
        define variable iLength as integer no-undo.
        define variable iLoop as integer no-undo.
        define variable cChar as character no-undo.
        define variable lQuote as logical no-undo.
        define buffer HeaderParameter for HeaderParameter.
        
        /* blank delimiter means no parameters */        
        if this-object:ParamDelimiter eq '':u then
            return cParameters.
        
        for each HeaderParameter where HeaderParameter.ParentHeader eq integer(this-object):
            assign iLength = length(HeaderParameter.ParamValue, 'raw':u)
                   lQuote  = false.
            
            /* quoted already? */
            if substring(HeaderParameter.ParamValue, 1,       1) eq '~"' and
               substring(HeaderParameter.ParamValue, iLength, 1) eq '~"' then
                assign lQuote = false.
            else
            if not lQuote then
            do iLoop = 1 to iLength while not lQuote:
                assign cChar  = substring(HeaderParameter.ParamValue, iLoop, 1, 'raw':u)
                       lQuote = index(' ()<>@,;:\~"/[]?=', cChar) gt 0.
            end.
            
            if lQuote then
                assign cValue = quoter(HeaderParameter.ParamValue).
            else
                assign cValue = HeaderParameter.ParamValue. 
            
            assign cParameters = substitute('&1&2 &3=&4':u, 
                                   cParameters,
                                   this-object:ParamDelimiter,
                                   HeaderParameter.ParamName,
                                   cValue ).
        end.
        
        return cParameters.
    end method.
    
end class.