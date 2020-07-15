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

    local procedure MyAwesomeFunction()
    var
        TempText: TextBuilder;
    begin
        TempText.Append('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt');
        TempText.Replace('Lorem ipsum', '');
    end;
}