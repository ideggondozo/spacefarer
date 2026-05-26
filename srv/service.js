const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { Spacefarers } = this.entities;

    this.before('CREATE', Spacefarers, async (req) => {

        const data = req.data;

        // Validation
        if (data.stardustCollection < 0) {
            req.error(400, 'Stardust collection cannot be negative');
        }

        // Enhancement
        if (data.wormholeNavigationSkill > 100) {
            data.wormholeNavigationSkill = 100;
        }

        // Default value
        if (!data.spacesuitColor) {
            data.spacesuitColor = 'Silver';
        }
    });

    this.after('CREATE', Spacefarers, async (data) => {

        console.log(`
        Cosmic notification email sent to ${data.email}
        Welcome aboard ${data.firstName} ${data.lastName}!
        `);

    });

this.before('READ', Spacefarers, (req) => {

        const userPlanet = req.user?.attr?.originPlanet;

        if (!userPlanet) {
            return;
        }

        req.query.SELECT.where = [
            { ref: ['originPlanet'] },
            '=',
            { val: userPlanet }
        ];
    });

});