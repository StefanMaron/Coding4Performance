tableextension 50000 "Customer" extends Customer
{
    trigger OnBeforeModify()
    var
        // SessionID: Integer;
        SessionGuid: Guid;
    begin
        //StartSession(SessionID, Codeunit::"Customer Check Meth", CompanyName(), Rec);

        SessionGuid := TaskScheduler.CreateTask(Codeunit::"Customer Check Meth", 0, false, CompanyName(), CurrentDateTime(), RecordId());
    end;
}