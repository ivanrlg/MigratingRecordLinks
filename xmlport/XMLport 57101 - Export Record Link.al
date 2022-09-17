xmlport 57101 "Export Record Link"
{
    Format = VariableText;
    FormatEvaluate = Legacy;
    Direction = Export;

    schema
    {
        textelement(Root)
        {
            tableelement("Record Link"; "Record Link")
            {
                XmlName = 'RecordLink';

                textelement(RecordPos)
                {
                }
                textelement(TableID)
                {
                }
                fieldelement(LinkID; "Record Link"."Link ID")
                {
                }
                fieldelement(URL1; "Record Link".URL1)
                {
                }
                fieldelement(Description; "Record Link".Description)
                {
                }
                fieldelement(Type; "Record Link".Type)
                {
                }
                textelement(Note)
                {
                }
                fieldelement(Created; "Record Link".Created)
                {
                }
                fieldelement(UserID; "Record Link"."User ID")
                {
                }
                fieldelement(Company; "Record Link".Company)
                {
                }
                fieldelement(Notify; "Record Link".Notify)
                {
                }
                fieldelement(ToUserID; "Record Link"."To User ID")
                {
                }

                trigger OnAfterGetRecord()
                var
                    RecRef: RecordRef;
                    RecID: RecordID;
                    InStream: InStream;
                    MyNote: Text;
                begin
                    RecID := "Record Link"."Record ID";


                    Window.Update(1, 'LinkID: ' + format("Record Link"."Link ID"));

                    if RecID.TableNo <> 0 then begin
                        RecRef := RecID.GetRecord();
                        RecordPos := RecRef.GetPosition(false);
                        TableID := format(RecRef.Number);

                        "Record Link".CalcFields(Note);

                        if "Record Link".Note.HASVALUE then begin

                            //"Record Link".Note.CreateInStream(InStream, TEXTENCODING::UTF8);
                            "Record Link".Note.CreateInStream(InStream);
                            InStream.ReadText(MyNote);
                            Note := DeleteSpecialChars(MyNote);

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
