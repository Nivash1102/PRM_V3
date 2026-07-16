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
    Status : String enum
    {
        P = 'Prospect';
        A = 'Active';
        D = 'Discontinued';
    };
    Level : String enum
    {
        P = 'Platinum Partner';
        G = 'Gold Partner';
        S = 'Silver Partner';
        D = 'Partner';
    };
    contacts : Composition of many Contacts on contacts.partner = $self;
    memberships : Composition of many Memberships on memberships.partner = $self;
}

entity Contacts : cuid, managed
{
    ContactID : String(10) not null @assert.unique;
    FirstName : String(40) not null;
    LastName : String(40) not null;
    Email : String(100) not null;
    Function : String enum
    {
        PUA = 'Partner User Admin';
        ESI = 'E-signer';
        MAN = 'Partner Manager';
    };
    partner : Association to one Partners;
}

entity Memberships : cuid, managed
{
    key MemberID : String(10) @assert.unique;
    key ValidTo : Date;
    ValidFrom : Date not null;
    Type : String enum
    {
        Sell = 'PE Sell';
        Service = 'PE Service';
        Run = 'PE Run';
        Build = 'PE Build';
        OE = 'Open Ecosystem';
    } not null;
    Status : String enum
    {
        Requested;
        Authorized;
        Deauthorized;
        Rejected;
    } not null;
    Reason : String(100);
    partner : Association to one Partners;
    dimensions : Composition of many Dimensions on dimensions.membership = $self;
    descriptors : Composition of many Descriptors on descriptors.membership = $self;
}

entity Dimensions : cuid, managed
{
    key DimID : String(10) @assert.unique;
    key ValidTo : Date;
    ValidFrom : Date not null;
    Type : String enum
    {
        SERP = 'Sell SAP ERP Coud';
        SB1 = 'Sell SAP Business One';
        SOC = 'Sell SAP Open Cloud';
        SHC = 'Sell Human Capital Management';
        SCX = 'Sell Customer Experience';
        ROP = 'Run On Premise';
        RCL = 'Run Cloud';
        BOP = 'Build On Premise';
        BCL = 'Build Cloud';
    } not null;
    Status : String enum
    {
        REQ = 'Requested';
        REJ = 'Rejected';
        AUT = 'Authorized';
        AAR = 'Authorization at risk';
        DEA = 'Deauthorized';
    } not null;
    membership : Association to one Memberships;
}

entity Descriptors : cuid, managed
{
    key DesID : String(10) @assert.unique;
    key ValidTo : Date;
    ValidFrom : Date not null;
    Descriptor : String enum
    {
        HPE = 'High Performing';
        HPO = 'High Potential';
        B1 = 'B1 Premier PArtner';
        SOV = 'SAP Sovereign Cloud Partner';
        GF = 'SAP Grow Fast Partner';
    } not null;
    membership : Association to one Memberships;
}


entity NumberRanges {
    key ObjectType   : String(30);
    CurrentNumber    : Integer;
}