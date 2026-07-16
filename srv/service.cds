using { PRM as my } from '../db/schema.cds';

@path : '/service/PRMService'
service PRMService
{
    @cds.redirection.target
    entity Partners as
        projection on my.Partners
        {
            *
        }
        excluding
        {
            createdAt,
            createdBy,
            modifiedAt,
            modifiedBy
        };

       entity Contacts as projection on my.Contacts
{
    *
}
excluding
{
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy
};

entity Memberships as projection on my.Memberships
{
    *
}
excluding
{
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy
};

entity Dimensions as projection on my.Dimensions
{
    *
}
excluding
{
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy
};

entity Descriptors as projection on my.Descriptors
{
    *
}
excluding
{
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy
};
}

/* annotate PRMService with @requires :
[
    'authenticated-user'
]; */
