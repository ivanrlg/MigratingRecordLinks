page 57100 "My Record Link BC14"
{
    ApplicationArea = All;
    Caption = 'My Record Link BC14';
    PageType = List;
    SourceTable = "Records Links Temp";
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
            action(ExportRecordLinkFromBC140)
            {
                Caption = 'Export Record Link From BC140';
                Promoted = true;
                PromotedCategory = Process;
                Image = Export;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Xmlport.Run(57100, true, false);
                end;
            }
        }
    }
}
