using PRMService as service from '../../srv/service';
annotate service.Partners with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'PartnerID',
                Value : PartnerID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : Status,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Level',
                Value : Level,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Membership',
            ID : 'Membership',
            Target : 'memberships/@UI.LineItem#Membership',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Contacts',
            ID : 'Contacts',
            Target : 'contacts/@UI.LineItem#Contacts',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'PartnerID',
            Value : PartnerID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : Status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Level',
            Value : Level,
        },
    ],
    UI.SelectionFields : [
        Name,
        PartnerID,
        Status,
        memberships.Type,
        memberships.Status,
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View',
    },
    UI.LineItem #tableView : [
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View 1',
    },
    UI.FieldGroup #Contacts : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Partner',
            ID : 'Partner',
            Target : '@UI.FieldGroup#Partner',
        },
    ],
    UI.FieldGroup #Partner : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
            },
            {
                $Type : 'UI.DataField',
                Value : Level,
                Label : 'Level',
            },
        ],
    },
);

annotate service.Partners with {
    Name @Common.Label : 'Name'
};

annotate service.Partners with {
    PartnerID @Common.Label : 'PartnerID'
};

annotate service.Partners with {
    Status @Common.Label : 'Status'
};

annotate service.Memberships with {
    Type @Common.Label : 'memberships/Type'
};

annotate service.Memberships with {
    Status @Common.Label : 'memberships/Status'
};

annotate service.Memberships with @(
    UI.LineItem #Membership : [
        {
            $Type : 'UI.DataField',
            Value : MemberID,
            Label : 'MemberID',
        },
        {
            $Type : 'UI.DataField',
            Value : partner_ID,
            Label : 'partner_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : Reason,
            Label : 'Reason',
        },
        {
            $Type : 'UI.DataField',
            Value : Type,
        },
        {
            $Type : 'UI.DataField',
            Value : Status,
        },
        {
            $Type : 'UI.DataField',
            Value : ValidFrom,
            Label : 'ValidFrom',
        },
        {
            $Type : 'UI.DataField',
            Value : ValidTo,
            Label : 'ValidTo',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Dimensions',
            ID : 'Dimensions',
            Target : 'dimensions/@UI.LineItem#Dimensions',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Descriptors',
            ID : 'Descriptors',
            Target : 'descriptors/@UI.LineItem#Descriptors',
        },
    ],
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Membership',
            ID : 'Membership',
            Target : '@UI.FieldGroup#Membership',
        },
    ],
    UI.FieldGroup #Membership : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : MemberID,
                Label : 'MemberID',
            },
            {
                $Type : 'UI.DataField',
                Value : Type,
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
            },
        ],
    },
);

annotate service.Contacts with @(
    UI.LineItem #Contacts : [
        {
            $Type : 'UI.DataField',
            Value : FirstName,
            Label : 'FirstName',
        },
        {
            $Type : 'UI.DataField',
            Value : LastName,
            Label : 'LastName',
        },
        {
            $Type : 'UI.DataField',
            Value : ContactID,
            Label : 'ContactID',
        },
        {
            $Type : 'UI.DataField',
            Value : Email,
            Label : 'Email',
        },
        {
            $Type : 'UI.DataField',
            Value : Function,
            Label : 'Function',
        },
    ]
);

annotate service.Dimensions with @(
    UI.LineItem #Dimensions : [
        {
            $Type : 'UI.DataField',
            Value : DimID,
            Label : 'DimID',
        },
        {
            $Type : 'UI.DataField',
            Value : membership_ID,
            Label : 'membership_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : Status,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : Type,
            Label : 'Type',
        },
        {
            $Type : 'UI.DataField',
            Value : ValidFrom,
            Label : 'ValidFrom',
        },
        {
            $Type : 'UI.DataField',
            Value : ValidTo,
            Label : 'ValidTo',
        },
    ]
);

annotate service.Descriptors with @(
    UI.LineItem #Descriptors : [
        {
            $Type : 'UI.DataField',
            Value : Descriptor,
            Label : 'Descriptor',
        },
        {
            $Type : 'UI.DataField',
            Value : DesID,
            Label : 'DesID',
        },
        {
            $Type : 'UI.DataField',
            Value : ValidFrom,
            Label : 'ValidFrom',
        },
        {
            $Type : 'UI.DataField',
            Value : ValidTo,
            Label : 'ValidTo',
        },
    ]
);

