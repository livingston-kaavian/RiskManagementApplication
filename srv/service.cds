using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { RiskManagementApplication as my } from '../db/schema';

@path : '/service/RiskManagementApplication'
service RiskManagementApplicationService
{
    annotate Mitigation with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    annotate Risk with @restrict :
    [
        { grant : [ 'READ' ], to : [ 'RiskViewer' ] },
        { grant : [ '*' ], to : [ 'RiskManager' ] }
    ];

    @odata.draft.enabled
    entity Mitigation as
        projection on my.Mitigation;

    @odata.draft.enabled
    entity Risk as
        projection on my.Risks;

    entity A_BusinessPartner as
        projection on BusinessPartnerA2X.A_BusinessPartner;
}

annotate RiskManagementApplicationService with @requires :
[
    'authenticated-user'
];
