const cds = require('@sap/cds');
const numberRange = require('../lib/number-range');

module.exports = (service) => {

    service.before('CREATE', 'Partners', async (req) => {

        const tx = cds.transaction(req);

        await assignPartnerNumber(req.data, tx);
        await assignContactNumbers(req.data, tx);
        await assignMembershipNumbers(req.data, tx);

    });

};

//-----------------------------------------------------
// Partner
//-----------------------------------------------------

async function assignPartnerNumber(partner, tx) {


      console.log('Call reached PArtner number generation');

    partner.PartnerID = await numberRange.getNextNumber(
        tx,
        'PARTNER',
        'P',
        9
    );

}

//-----------------------------------------------------
// Contacts
//-----------------------------------------------------

async function assignContactNumbers(partner, tx) {

    console.log('Call reached Contact number generation');

    if (!partner.Contacts?.length) {
        console.log(partner);
        console.log('Contact number generation skipped');
        return;        
    }

    console.log('Contact number generation started');

    for (const contact of partner.Contacts) {

        contact.ContactID = await numberRange.getNextNumber(
            tx,
            'CONTACT',
            'C',
            9
        );
         console.log('Contact number generation completed for ContactID:', contact.ContactID);

    }

}

//-----------------------------------------------------
// Memberships
//-----------------------------------------------------

async function assignMembershipNumbers(partner, tx) {

    if (!partner.memberships?.length) {
        return;
    }

    for (const membership of partner.memberships) {

        membership.MemberID = await numberRange.getNextNumber(
            tx,
            'MEMBERSHIP',
            'M',
            9
        );

        await assignDimensionNumbers(membership, tx);

        await assignDescriptorNumbers(membership, tx);

    }

}

//-----------------------------------------------------
// Dimensions
//-----------------------------------------------------

async function assignDimensionNumbers(membership, tx) {

    if (!membership.dimensions?.length) {
        return;
    }

    for (const dimension of membership.dimensions) {

        dimension.DimID = await numberRange.getNextNumber(
            tx,
            'DIMENSION',
            'D',
            9
        );

    }

}

//-----------------------------------------------------
// Descriptors
//-----------------------------------------------------

async function assignDescriptorNumbers(membership, tx) {

    if (!membership.descriptors?.length) {
        return;
    }

    for (const descriptor of membership.descriptors) {

        descriptor.DesID = await numberRange.getNextNumber(
            tx,
            'DESCRIPTOR',
            'DS',
            8
        );

    }

}