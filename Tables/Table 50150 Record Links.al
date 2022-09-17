table 57100 "Records Links Temp"
{
    DataClassification = ToBeClassified;
    DataPerCompany = false;

    fields
    {
        field(1; "Link ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; "Record ID"; RecordID)
        {
            DataClassification = ToBeClassified;
        }

        field(3; URL1; Text[2048])
        {
            DataClassification = ToBeClassified;
        }

        field(4; URL2; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(5; URL3; Text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(6; URL4; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Link,Note;
        }
        field(9; Note; BLOB)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Created; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "User ID"; Text[132])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Company; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Notify; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "To User ID"; Text[132])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key("Key1"; "Link ID")
        {
            Clustered = true;
        }
        key("Key2"; "Record ID")
        {
            Clustered = false;
        }
        key("Key3"; Company, "Record ID")
        {
            Clustered = false;
        }
    }
}