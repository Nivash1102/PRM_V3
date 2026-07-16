const cds = require('@sap/cds');
const numberRange = require('../lib/number-range');

module.exports = (service) => {

    service.before('CREATE', 'Dimensions', async (req) => {

        const tx = cds.transaction(req);

        req.data.DimID = await numberRange.getNextNumber(
            tx,
            'DIMENSION',
            'D',
            9
        );

    });

};