page 57101 "My Record Link BCOnCloud"
{
    ApplicationArea = All;
    Caption = 'My Record Link BCOnCloud';
    PageType = List;
    SourceTable = "Record Link";
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Link ID"; Rec."Link ID")
                {
                    ApplicationArea = all;
                }

                field("Record ID"; Rec.RecordID)
                {
                    ApplicationArea = all;
                }

                field(URL1; Rec.URL1)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                }
                field(Note; Rec.Note)
                {
                    ApplicationArea = all;
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = all;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                }
                field(Company; Rec.Company)
                {
                    ApplicationArea = all;
                }
                field(Notify; Rec.Notify)
                {
                    ApplicationArea = all;
                }
                field("To User ID"; Rec."To User ID")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ExportRecordLinks)
            {
                Caption = 'Export Record Links';
                Promoted = true;
                PromotedCategory = Process;
                Image = Export;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(57101, true, false);
                end;
            }

            action(ImportRecordLink)
            {
                Caption = 'Import Record Link';
                Promoted = true;
                PromotedCategory = Process;
                Image = Import;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(57102, false, true);
                end;
            }
            action(DeleteAllRecordLinks)
            {
                Caption = 'Delete All Record Links';
                Image = DeleteAllBreakpoints;
                Promoted = false;
                ApplicationArea = All;
                //Visible = false;
                trigger OnAction()
                var
                    RecordLink: Record "Record Link";
                    QuestionCreateManual: Label 'Are you sure you want to remove all Record Links??';
                    Confirmed: Boolean;
                begin
                    //exit;

                    Confirmed := Dialog.Confirm(QuestionCreateManual, false);
                    if not Confirmed then begin
                        exit;
                    end;

                    RecordLink.DeleteAll();
                end;
            }
        }
    }
}
