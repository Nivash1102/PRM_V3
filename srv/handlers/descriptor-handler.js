const cds = require('@sap/cds');
const numberRange = require('../lib/number-range');

module.exports = (service) => {

    service.before('CREATE', 'Descriptors', async (req) => {

        const tx = cds.transaction(req);

        req.data.DesID = await numberRange.getNextNumber(
            tx,
            'DESCRIPTOR',
            'DS',
            8
        );

    });

};