using {
    cuid,
    managed
} from '@sap/cds/common';

namespace galactic;


entity Department : cuid, managed {

    @title : 'Department Name'
    name : String(100) not null;

    @title : 'Description'
    description : String(255);
}


entity Position : cuid, managed {

    @title : 'Position Title'
    title : String(100) not null;

    @title : 'Required Experience Level'
    experienceLevel : String(50);
}


entity Spacefarer : cuid, managed {

    @title : 'First Name'
    firstName : String(100) not null;

    @title : 'Last Name'
    lastName : String(100) not null;

    @title : 'Email Address'
    email : String(255) @assert.format: '^[^@]+@[^@]+\.[^@]+$';
    
    @title : 'Origin Planet'
    originPlanet : String(100);

    @title : 'Spacesuit Color'
    spacesuitColor : Association to SpacesuitColor;

    @title : 'Stardust Collection'
    stardustCollection : Integer @assert.range: [0, 100000];

    @title : 'Wormhole Navigation Skill'
    wormholeNavigationSkill : Integer @assert.range: [0, 100];

    @title : 'Mission Rank'
    missionRank : String(50);

    @title : 'Active Spacefarer'
    isActive : Boolean default true;

    @title : 'Department'
    department : Association to Department;

    @title : 'Position'
    position : Association to Position;
}

entity SpacesuitColor {

    @title : 'Color Code'
    key code : String(20);

    @title : 'Color Name'
    name : String(100);
}