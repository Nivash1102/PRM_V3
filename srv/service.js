const cds = require('@sap/cds');

const registerPartnerHandler = require('./handlers/partner-handler');
const registerContactHandler = require('./handlers/contact-handler');
const registerMembershipHandler = require('./handlers/membership-handler');
const registerDimensionHandler = require('./handlers/dimension-handler');
const registerDescriptorHandler = require('./handlers/descriptor-handler');

module.exports = cds.service.impl(function () {

  registerPartnerHandler(this);
  registerContactHandler(this);
  registerMembershipHandler(this);
  registerDimensionHandler(this);
  registerDescriptorHandler(this);

});