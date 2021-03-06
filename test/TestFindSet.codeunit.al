codeunit 50100 "Test FindSet"
{
    Subtype = Test;

    [Test]
    procedure ReadAllRecords_FindSet()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;

        LargeTable.FindSet();

        Error(
            'Statements executed: %1\Rows read: %2',
            SessionInformation.SqlStatementsExecuted - OffSetSqlStatementsExecuted,
            SessionInformation.SqlRowsRead - OffSetSqlRowsRead
        );
    end;

    [Test]
    procedure ReadAllRecords_IterateAll_FindSet()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;

        if LargeTable.FindSet() then
            repeat
            until LargeTable.Next() = 0;

        Error(
            'Statements executed: %1\Rows read: %2',
            SessionInformation.SqlStatementsExecuted - OffSetSqlStatementsExecuted,
            SessionInformation.SqlRowsRead - OffSetSqlRowsRead
        );
    end;


    [Test]
    procedure ReadAllRecords_Iterate10000_Break_FindSet()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;

        if LargeTable.FindSet() then
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
    procedure ReadAllRecords_Iterate10000_Filter_FindSet()
    var
        LargeTable: Record "Large Table";
        OffSetSqlRowsRead: BigInteger;
        OffSetSqlStatementsExecuted: BigInteger;
    begin
        SelectLatestVersion();
        OffSetSqlStatementsExecuted := SessionInformation.SqlStatementsExecuted;
        OffSetSqlRowsRead := SessionInformation.SqlRowsRead;

        LargeTable.SetFilter("Entry No.", '<=%1', 10000);
        if LargeTable.FindSet() then
            repeat
            until LargeTable.Next() = 0;

        Error(
            'Statements executed: %1\Rows read: %2',
            SessionInformation.SqlStatementsExecuted - OffSetSqlStatementsExecuted,
            SessionInformation.SqlRowsRead - OffSetSqlRowsRead
        );
    end;
}