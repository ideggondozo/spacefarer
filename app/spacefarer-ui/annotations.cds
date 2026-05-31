using GalacticService as service from '../../srv/service';
annotate service.Spacefarers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : originPlanet,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Spacesuit Color',
                Value : spacesuitColor_code,
            },
            {
                $Type : 'UI.DataField',
                Value : stardustCollection,
            },
            {
                $Type : 'UI.DataField',
                Value : wormholeNavigationSkill,
            },
            {
                $Type : 'UI.DataField',
                Value : missionRank,
            },
            {
                $Type : 'UI.DataField',
                Value : isActive,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : originPlanet,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Spacesuit Color',
            Value : spacesuitColor_code,
        },
    ],
);

annotate service.Spacefarers with {
    spacesuitColor @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'SpacesuitColors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : spacesuitColor_code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Spacefarers with {
    department @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Departments',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : department_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

annotate service.Spacefarers with {
    position @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Positions',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : position_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'title',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'experienceLevel',
            },
        ],
    }
};

