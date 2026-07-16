const cds = require('@sap/cds');
const numberRange = require('../lib/number-range');

module.exports = (service) => {

    service.before('CREATE', 'Memberships', async (req) => {

        const tx = cds.transaction(req);

        req.data.MemberID = await numberRange.getNextNumber(
            tx,
            'MEMBERSHIP',
            'M',
            9
        );

    });

};