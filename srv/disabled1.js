const cds = require('@sap/cds')

module.exports = class PRMService extends cds.ApplicationService { init() {

  const { Partners, Contacts, Memberships, Dimensions, Descriptors, NumberRanges } = cds.entities('PRMService')

  this.before ('CREATE', Partners, async (req) => {
    console.log('Before CREATE/UPDATE Partners', req.data)

    //skip if Partner ID provided 
    if (req.data.PartnerID) return;
     const db = await cds.connect.to('db')

      // Read the highest PartnerID
      const result = await db.run(
        SELECT.one
          .from(Partners)
          .columns('PartnerID')
          .orderBy({ PartnerID: 'desc' })
      )

      let nextNumber = 1

      if (result?.PartnerID) {
        nextNumber = Number(result.PartnerID) + 1
      }

      req.data.PartnerID = String(nextNumber).padStart(10, '0')

    return super.init();

  })

  this.after ('READ', Partners, async (partners, req) => {
    console.log('After READ Partners', partners)
  })
  this.before ('CREATE', Contacts, async (req) => {
    console.log('Before CREATE/UPDATE Contacts', req.data)

    //skip if contact ID given 
    if (req.data.ContactID) return;
     const db = await cds.connect.to('db')

      // Read the highest PartnerID
      const result = await db.run(
        SELECT.one
          .from(Contacts)
          .columns('ContactID')
          .orderBy({ ContactID: 'desc' })
      )

      let nextNumber = 1

      if (result?.ContactID) {
        nextNumber = Number(result.ContactID) + 1
      }

      req.data.ContactID = String(nextNumber).padStart(10, '0')

    return super.init();
  })
  this.after ('READ', Contacts, async (contacts, req) => {
    console.log('After READ Contacts', contacts)
  })
  this.before (['CREATE', 'UPDATE'], Memberships, async (req) => {
    console.log('Before CREATE/UPDATE Memberships', req.data)
  })
  this.after ('READ', Memberships, async (memberships, req) => {
    console.log('After READ Memberships', memberships)
  })
  this.before (['CREATE', 'UPDATE'], Dimensions, async (req) => {
    console.log('Before CREATE/UPDATE Dimensions', req.data)
  })
  this.after ('READ', Dimensions, async (dimensions, req) => {
    console.log('After READ Dimensions', dimensions)
  })
  this.before (['CREATE', 'UPDATE'], Descriptors, async (req) => {
    console.log('Before CREATE/UPDATE Descriptors', req.data)
  })
  this.after ('READ', Descriptors, async (descriptors, req) => {
    console.log('After READ Descriptors', descriptors)
  })
  this.before (['CREATE', 'UPDATE'], NumberRanges, async (req) => {
    console.log('Before CREATE/UPDATE NumberRanges', req.data)
  })
  this.after ('READ', NumberRanges, async (numberRanges, req) => {
    console.log('After READ NumberRanges', numberRanges)
  })


  return super.init()
}}
