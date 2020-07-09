codeunit 50001 "Test Text Builder"
{
    Subtype = Test;

    [Test]
    procedure AppendWithString100()
    var
        TempText: Text;
        i: Integer;
    begin
        for i := 1 to 100 do
            TempText += 'a';
    end;

    [Test]
    procedure AppendWithString1k()
    var
        TempText: Text;
        i: Integer;
    begin
        for i := 1 to 1000 do
            TempText += 'a';
    end;

    [Test]
    procedure AppendWithString10k()
    var
        TempText: Text;
        i: Integer;
    begin
        for i := 1 to 10000 do
            TempText += 'a';
    end;

    [Test]
    procedure AppendWithString100k()
    var
        TempText: Text;
        i: Integer;
    begin
        for i := 1 to 100000 do
            TempText += 'a';
    end;



    [Test]
    procedure AppendWithTextBuilder100()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 100 do
            TempText.Append('a');
    end;


    [Test]
    procedure AppendWithTextBuilder1k()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 1000 do
            TempText.Append('a');
    end;

    [Test]
    procedure AppendWithTextBuilder10k()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 10000 do
            TempText.Append('a');
    end;


    [Test]
    procedure AppendWithTextBuilder100k()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 100000 do
            TempText.Append('a');
    end;

    [Test]
    procedure AppendWithTextBuilder10M()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 10000000 do
            TempText.Append('a');
    end;


    [Test]
    procedure AppendLineWithTextBuilder100()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 100 do
            TempText.AppendLine('a');
    end;


    [Test]
    procedure AppendLineWithTextBuilder1k()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 1000 do
            TempText.AppendLine('a');
    end;

    [Test]
    procedure AppendLineWithTextBuilder10k()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 10000 do
            TempText.AppendLine('a');
    end;


    [Test]
    procedure AppendLineWithTextBuilder100k()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 100000 do
            TempText.AppendLine('a');
    end;

    [Test]
    procedure AppendLineWithTextBuilder10M()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 10000000 do
            TempText.AppendLine('a');
    end;

    [Test]
    procedure ReplaceTextBuilder10M()
    var
        TempText: TextBuilder;
        i: Integer;
    begin
        for i := 1 to 10000000 do
            TempText.AppendLine('abc');

        TempText.Replace('bc', 'a');
    end;
}