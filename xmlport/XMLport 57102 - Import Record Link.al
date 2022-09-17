xmlport 57102 "Import Record Link"
{
    Format = VariableText;
    FormatEvaluate = Legacy;
    Direction = Import;

    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                XmlName = 'RecordLink';
                SourceTableView = SORTING(Number) ORDER(Ascending);
                UseTemporary = true;
                textelement(RecordPos)
                {
                }
                textelement(TableID)
                {
                }
                textelement(LinkID)
                {
                }
                textelement(URL1)
                {
                }
                textelement(Description)
                {
                }
                textelement(Type)
                {
                }
                textelement(Note)
                {
                }
                textelement(Created)
                {
                }
                textelement(UserID)
                {
                }
                textelement(Company)
                {
                }
                textelement(Notify)
                {
                }
                textelement(TouserID)
                {
                }

                trigger OnBeforeInsertRecord()
                var
                    RecordLink: Record "Record Link";
                    TypeInt: Integer;
                    CreatedDate: DateTime;
                    NotifyBol: Boolean;
                    OutStream: OutStream;
                    RecordLinkManagement: Codeunit "Record Link Management";
                begin
                    Integer.DeleteAll;


                    Evaluate(TableIDInteger, TableID);

                    Window.Update(1, 'Link Id: ' + format(LinkIDInt));

                    RecRef.Open(TableIDInteger);
                    RecRef.SetPosition(RecordPos);
                    if not RecRef.Find then begin
                        RecRef.Close;
                        exit;
                    end;

                    RecordLink.Init();

                    RecordLink."Record ID" := RecRef.RecordId;
                    RecordLink."Link ID" := LinkIDInt;
                    RecordLink.URL1 := URL1;
                    RecordLink.Description := Description;

                    Evaluate(TypeInt, ConvertType(Type));
                    RecordLink.Type := TypeInt;

                    Evaluate(CreatedDate, Created);
                    RecordLink.Created := CreatedDate;

                    RecordLink.Company := Company;

                    Evaluate(NotifyBol, Notify);
                    RecordLink.Notify := NotifyBol;

                    RecordLink."User ID" := DelStr(UserID, 1, Text.StrPos(UserID, '\'));
                    RecordLink."To User ID" := DelStr(TouserID, 1, Text.StrPos(TouserID, '\'));

                    //Codeunit that allows writing the note if it exists. An attempt was made with CreateOutstream but it was impossible, 
                    //since the notes were created with an error and it said: "The data cannot be shown because it is not valid"
                    RecordLinkManagement.WriteNote(RecordLink, Note);

                    if not RecordLink.Insert then
                        RecordLink.Modify();

                    RecRef.Close;
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


    trigger OnPreXmlPort()
    begin
        Window.Open('#1#########\\');
    end;

    trigger OnPostXmlPort()
    begin
        Message('All Record Links Have Been Imported Succesfully.');
        Window.Close();
    end;

    local procedure ConvertType(OldValue: Text): Text
    var
        NewValue: Text;
    begin
        case OldValue of
            'Link':
                NewValue := '0';
            'Note':
                NewValue := '1';
        end;
        exit(NewValue);
    end;


    var
        RecRef: RecordRef;
        RecID: RecordID;
        TableIDInteger: Integer;
        LinkIDInt: Integer;
        Window: Dialog;
}

