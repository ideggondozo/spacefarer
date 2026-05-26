using GalacticService from '../../srv/service';

annotate GalacticService.Spacefarers with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Spacefarer',
            TypeNamePlural: 'Spacefarers',
            Title: {
                Value: firstName
            },
            Description: {
                Value: originPlanet
            }
        },

        LineItem: [
            { Value: firstName },
            { Value: lastName },
            { Value: originPlanet },
            { Value: spacesuitColor },
            { Value: stardustCollection },
            { Value: wormholeNavigationSkill }
        ],

        FieldGroup #General: {
            Data: [
                { Value: firstName },
                { Value: lastName },
                { Value: email },
                { Value: originPlanet },
                { Value: spacesuitColor },
                { Value: missionRank },
                { Value: stardustCollection },
                { Value: wormholeNavigationSkill }
            ]
        },

        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'General Information',
                Target: '@UI.FieldGroup#General'
            }
        ]
    }
);