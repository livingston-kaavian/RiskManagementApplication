sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'RiskManagementApplication/Risks/test/integration/FirstJourney',
		'RiskManagementApplication/Risks/test/integration/pages/RiskList',
		'RiskManagementApplication/Risks/test/integration/pages/RiskObjectPage'
    ],
    function(JourneyRunner, opaJourney, RiskList, RiskObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('RiskManagementApplication/Risks') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRiskList: RiskList,
					onTheRiskObjectPage: RiskObjectPage
                }
            },
            opaJourney.run
        );
    }
);