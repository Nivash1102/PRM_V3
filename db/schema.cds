namespace PRM;

using
{
    cuid,
    managed
}
from '@sap/cds/common';

entity Partners : cuid, managed
{
    PartnerID : String(10) not null @assert.unique;
    Name : String(100);
    Status : Association to PartnerStatus;
    Level : Association to PartnerLevel;
    contacts : Composition of many Contacts on contacts.partner = $self;
    memberships : Composition of many Memberships on memberships.partner = $self;
}

entity PartnerStatus {
    key Status : String(20);
    Description : String(100);
}

entity PartnerLevel {
    key Level : String(20);
    Description : String(100);
}

entity Contacts : cuid, managed
{
    ContactID : String(10) @assert.unique;
    FirstName : String(40) not null;
    LastName : String(40) not null;
    Email : String(100) not null;
    Function : association to ContactFunctions;
    partner : Association to one Partners;
}

entity ContactFunctions {
    key Function : String(20);
    Description : String(100);
}

entity Memberships : cuid, managed
{
    MemberID : String(10) @assert.unique;
    ValidFrom : Date;
    ValidTo : Date;    
    Type : association to MembershipTypes;
    Status : Association to MembershipStatuses;
    Reason : String(100);
    partner : Association to one Partners;
    dimensions : Composition of many Dimensions on dimensions.membership = $self;
    descriptors : Composition of many Descriptors on descriptors.membership = $self;
}

entity MembershipTypes {
    key Type : String(20);
    Description : String(100);
}

entity MembershipStatuses {
    key Status : String(20);
    Description : String(100);
}



entity Dimensions : cuid, managed
{
    DimID : String(10) @assert.unique;
    ValidFrom : Date;
    ValidTo : Date;
    Type : Association to DimensionTypes;
    Status : Association to DimensionStatuses;
    membership : Association to one Memberships;
}

entity DimensionTypes {
    key Type : String(20);
    Description : String(100);
}

entity DimensionStatuses {
    Key Status : String(20);
    Description : String(200);
}

entity Descriptors : cuid, managed
{
    DesID : String(10) @assert.unique;
    ValidFrom : Date;
    ValidTo : Date;
    Descriptor : association to DescriptorTypes;
    membership : Association to one Memberships;
}

entity DescriptorTypes {
    key Type : String(20);
    Description : String(100);
}




entity NumberRanges {
    key ObjectType   : String(30);
    CurrentNumber    : Integer;
}