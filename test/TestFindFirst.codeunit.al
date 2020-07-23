codeunit 50101 "Test FindFirst"
{
    Subtype = Test;

    [Test]
    procedure ReadAllRecords_FindFirst()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;

        LargeTable.SetCurrentKey("Text Field 1");
        LargeTable.FindFirst();

        Error(
            'Statements executed: %1\Rows read: %2',
            SessionInformation.SqlStatementsExecuted - OffSetSqlStatementsExecuted,
            SessionInformation.SqlRowsRead - OffSetSqlRowsRead
        );
    end;

    [Test]
    procedure ReadAllRecords_IterateAll_FindFirst()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;

        if LargeTable.FindFirst() then
            repeat
            until LargeTable.Next() = 0;

        Error(
            'Statements executed: %1\Rows read: %2',
            SessionInformation.SqlStatementsExecuted - OffSetSqlStatementsExecuted,
            SessionInformation.SqlRowsRead - OffSetSqlRowsRead
        );
    end;

    [Test]
    procedure ReadAllRecords_Iterate10000_Break_FindFirst()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;
        if LargeTable.FindFirst() then
            repeat
                if LargeTable."Entry No." = 10000 then
                    break;
            until LargeTable.Next() = 0;

        Error(
            'Statements executed: %1\Rows read: %2',
            SessionInformation.SqlStatementsExecuted - OffSetSqlStatementsExecuted,
            SessionInformation.SqlRowsRead - OffSetSqlRowsRead
        );
    end;

    [Test]
    procedure ReadAllRecords_Iterate10000_Filter_FindFirst()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;

        LargeTable.SetFilter("Entry No.", '<=%1', 10000);
        if LargeTable.FindFirst() then
            repeat
            until LargeTable.Next() = 0;

        Error(
            'Statements executed: %1\Rows read: %2',
            SessionInformation.SqlStatementsExecuted - OffSetSqlStatementsExecuted,
            SessionInformation.SqlRowsRead - OffSetSqlRowsRead
        );
    end;
}