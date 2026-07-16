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

    if (!partner.contacts?.length) {
        return;
    }

    for (const contact of partner.contacts) {

        contact.ContactID = await numberRange.getNextNumber(
            tx,
            'CONTACT',
            'C',
            9
        );

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