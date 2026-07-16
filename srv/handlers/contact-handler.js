const cds = require('@sap/cds');
const numberRange = require('../lib/number-range');

module.exports = (service) => {

    service.before('CREATE', 'Contacts', async (req) => {

        const tx = cds.transaction(req);

        req.data.ContactID = await numberRange.getNextNumber(
            tx,
            'CONTACT',
            'C',
            9
        );

    });

};