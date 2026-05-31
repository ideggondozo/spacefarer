const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    const { Spacefarers } = this.entities;

    const getUserPlanet = (req) => req.user?.attr?.originPlanet;

    this.before('CREATE', Spacefarers, async (req) => {

        const data = req.data;
        const userPlanet = getUserPlanet(req);

        if (
            userPlanet &&
            data.originPlanet &&
            data.originPlanet !== userPlanet
        ) {
            req.reject(
                403,
                'You can only create spacefarers for your own planet'
            );
        }


        if (data.wormholeNavigationSkill > 100) {
            data.wormholeNavigationSkill = 100;
        }

        if (!data.spacesuitColor_code) {
            data.spacesuitColor_code = 'SILVER';
        }
    });

    this.before('UPDATE', Spacefarers, async (req) => {

        const userPlanet = getUserPlanet(req);

        const existing = await SELECT.one
            .from(Spacefarers)
            .where({ ID: req.data.ID });

        if (
            existing &&
            existing.originPlanet !== userPlanet
        ) {
            req.reject(403, 'Access denied');
        }
    });

    this.before('DELETE', Spacefarers, async (req) => {

        const userPlanet = getUserPlanet(req);

        const existing = await SELECT.one
            .from(Spacefarers)
            .where({ ID: req.data.ID });

        if (
            existing &&
            existing.originPlanet !== userPlanet
        ) {
            req.reject(403, 'Access denied');
        }
    });

    this.after('CREATE', Spacefarers, async (data) => {

        console.log(`
        Cosmic notification email sent to ${data.email}
        Welcome aboard ${data.firstName} ${data.lastName}!
        `);

    });

    this.before('READ', Spacefarers, (req) => {

        const userPlanet = getUserPlanet(req);

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