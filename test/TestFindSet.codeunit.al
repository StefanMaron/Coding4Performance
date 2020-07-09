codeunit 50100 "Test FindSet"
{
    Subtype = Test;

    [Test]
    procedure ReadAllRecords_FindSet()
    var
        LargeTable: Record "Large Table";
    begin
        SelectLatestVersion();
        LargeTable.SetCurrentKey("Text Field 1");
        LargeTable.FindSet();
    end;

    [Test]
    procedure ReadAllRecords_IterateAll_FindSet()
    var
        LargeTable: Record "Large Table";
    begin
        SelectLatestVersion();
        if LargeTable.FindSet() then
            repeat
            until LargeTable.Next() = 0;
    end;

    [Test]
    procedure ReadAllRecords_Iterate10000_Break_FindSet()
    var
        LargeTable: Record "Large Table";
    begin
        SelectLatestVersion();
        if LargeTable.FindSet() then
            repeat
                if LargeTable."Entry No." = 10000 then
                    break;
            until LargeTable.Next() = 0;
    end;

    [Test]
    procedure ReadAllRecords_Iterate10000_Filter_FindSet()
    var
        LargeTable: Record "Large Table";
    begin
        SelectLatestVersion();
        LargeTable.SetFilter("Entry No.", '<=%1', 10000);
        if LargeTable.FindSet() then
            repeat
            until LargeTable.Next() = 0;
    end;
}