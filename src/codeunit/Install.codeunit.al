codeunit 50000 "Install"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        LargeTable: Record "Large Table";
        i: Integer;
    begin
        exit; // Remove this to activate the initialization of the large table
        if LargeTable.IsEmpty() then
            for i := 1 to 1000000 do begin
                LargeTable.Init();
                LargeTable."Entry No." := 0;
                LargeTable.Insert();
            end;
    end;
}