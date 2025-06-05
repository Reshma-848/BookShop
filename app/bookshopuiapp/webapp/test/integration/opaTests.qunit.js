sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'my/bookshopuiapp/test/integration/FirstJourney',
		'my/bookshopuiapp/test/integration/pages/OrderList',
		'my/bookshopuiapp/test/integration/pages/OrderObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderList, OrderObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('my/bookshopuiapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderList: OrderList,
					onTheOrderObjectPage: OrderObjectPage
                }
            },
            opaJourney.run
        );
    }
);