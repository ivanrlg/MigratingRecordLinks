xmlport 57100 "Export Record Link From BC140"
{
    Format = VariableText;
    FormatEvaluate = Legacy;
    Direction = Export;

    schema
    {
        textelement(Root)
        {
            tableelement("Records Links Temp"; "Records Links Temp")
            {
                XmlName = 'RecordLink';

                textelement(RecordPos)
                {
                }
                textelement(TableID)
                {
                }
                fieldelement(LinkID; "Records Links Temp"."Link ID")
                {
                }
                fieldelement(URL1; "Records Links Temp".URL1)
                {
                }
                textelement(Description)
                {
                }
                fieldelement(Type; "Records Links Temp".Type)
                {
                }
                textelement(Note)
                {
                }
                fieldelement(Created; "Records Links Temp".Created)
                {
                }
                fieldelement(UserID; "Records Links Temp"."User ID")
                {
                }
                fieldelement(Company; "Records Links Temp".Company)
                {
                }
                fieldelement(Notify; "Records Links Temp".Notify)
                {
                }
                fieldelement(ToUserID; "Records Links Temp"."To User ID")
                {
                }

                trigger OnAfterGetRecord()
                var
                    RecRef: RecordRef;
                    RecID: RecordID;
                    InStream: InStream;
                    MyNote: Text;
                begin
                    RecID := "Records Links Temp"."Record ID";


                    Window.Update(1, 'LinkID: ' + format("Records Links Temp"."Link ID"));

                    if RecID.TableNo <> 0 then begin
                        RecRef := RecID.GetRecord();
                        RecordPos := RecRef.GetPosition(false);
                        TableID := format(RecRef.Number);

                        "Records Links Temp".CalcFields(Note);

                        if "Records Links Temp".Note.HASVALUE then begin

                            //"Records Links Temp".Note.CreateInStream(InStream, TEXTENCODING::UTF8);
                            "Records Links Temp".Note.CreateInStream(InStream);
                            InStream.ReadText(MyNote);
                            Note := DeleteSpecialChars(MyNote);
                            Description := DeleteSpecialChars("Records Links Temp".Description);
                        end;

                    end;

                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnInitXmlPort()
    begin
        Window.Open('#1#########\\');
    end;

    trigger OnPostXmlPort()
    begin
        Message('All Record Links Have Been Exported Succesfully.');
        Window.Close();
    end;

    local procedure DeleteSpecialChars(MyNote: Text): Text
    var
        AllowedChars: Text;
    begin
        AllowedChars := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-0123456789()/*-+?;:><.{}][+=-_&^%$#@!` ';
        exit(DelChr(MyNote, '=', DELCHR(MyNote, '=', AllowedChars)));
    end;

    var
        Window: Dialog;
}
