tableextension 50000 "Customer" extends Customer
{
    trigger OnBeforeModify()
    var
        SessionID: Integer;
    begin
        StartSession(SessionID, Codeunit::"Customer Check Meth", CompanyName(), Rec);
    end;
}