sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/PartnersList.gen",
	"project1/test/integration/pages/PartnersObjectPage.gen",
	"project1/test/integration/pages/MembershipsObjectPage.gen"
], function (JourneyRunner, PartnersListGenerated, PartnersObjectPageGenerated, MembershipsObjectPageGenerated) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onThePartnersListGenerated: PartnersListGenerated,
			onThePartnersObjectPageGenerated: PartnersObjectPageGenerated,
			onTheMembershipsObjectPageGenerated: MembershipsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

