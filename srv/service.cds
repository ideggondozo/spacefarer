using galactic from '../db/schema';

service GalacticService @(requires: 'authenticated-user') {

    @odata.draft.enabled
    entity Spacefarers as projection on galactic.Spacefarer;

    entity Departments as projection on galactic.Department;
    entity Positions as projection on galactic.Position;
}