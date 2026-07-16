const cds = require('@sap/cds');
const { SELECT, UPDATE } = cds.ql;

async function getNextNumber(tx, objectType, prefix, length) {

    //Read the current number 
    const numberRange = await tx.run(
        SELECT.one
            .from('PRM.NumberRanges')
            .where({ ObjectType: objectType })
    );

      if (!numberRange) {
        throw new Error(`Number range not found for ${objectType}`);
    }

    // Increment the number
    const nextNumber = numberRange.CurrentNumber + 1;

        // Save it back to the database
    await tx.run(
        UPDATE('PRM.NumberRanges')
            .set({ CurrentNumber: nextNumber })
            .where({ ObjectType: objectType })
    );


    return prefix + String(nextNumber).padStart(length, '0');

}

module.exports = {
    getNextNumber
};