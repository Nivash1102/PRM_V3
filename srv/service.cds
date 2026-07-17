using {PRM as my} from '../db/schema.cds';

@path: '/service/PRMService'
service PRMService {
    @cds.redirection.target
    @odata.draft.enabled
    entity Partners      as
        projection on my.Partners {
            *
        }
        excluding {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };

    entity PartnerStatus as projection on my.PartnerStatus;
    entity PartnerLevel  as projection on my.PartnerLevel;
    entity ContactFunctions as projection on my.ContactFunctions;
    entity MembershipTypes as projection on my.MembershipTypes;
    entity MembershipStatuses as projection on my.MembershipStatuses;
    entity DimensionTypes as projection on my.DimensionTypes;
    entity DimensionStatuses as projection on my.DimensionStatuses;
    entity DescriptorTypes as projection on my.DescriptorTypes;


    entity Contacts      as
        projection on my.Contacts {
            *
        }
        excluding {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };


    entity Memberships   as
        projection on my.Memberships {
            *
        }
        excluding {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };


    entity Dimensions    as
        projection on my.Dimensions {
            *
        }
        excluding {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };


    entity Descriptors   as
        projection on my.Descriptors {
            *
        }
        excluding {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };

    entity NumberRanges  as
        projection on my.NumberRanges {
            *
        };
}


/* annotate PRMService with @requires :
[
    'authenticated-user'
]; */
