const cds = require('@sap/cds');

const { GET, POST } = cds.test('.');

describe('Spacefarers Service', () => {

    it('should return only Earth spacefarers for elek', async () => {

        const response = await GET(
            '/odata/v4/galactic/Spacefarers',
            {
                auth: {
                    username: 'elek',
                    password: '1234'
                }
            }
        );

        expect(response.status).toBe(200);

        response.data.value.forEach(spacefarer => {
            expect(spacefarer.originPlanet).toBe('Earth');
        });

    });

    it('should return only Mars spacefarers for bernadett', async () => {

        const response = await GET(
            '/odata/v4/galactic/Spacefarers',
            {
                auth: {
                    username: 'bernadett',
                    password: '1234'
                }
            }
        );

        expect(response.status).toBe(200);

        response.data.value.forEach(spacefarer => {
            expect(spacefarer.originPlanet).toBe('Mars');
        });

    });

    it('should reject unauthenticated requests', async () => {

        await expect(
            GET('/odata/v4/galactic/Spacefarers')
        ).rejects.toThrow();

    });

    it('should create a valid spacefarer', async () => {

        const response = await POST(
            '/odata/v4/galactic/Spacefarers',
            {
                firstName: 'Test',
                lastName: 'Astronaut',
                email: 'test@earth.com',
                originPlanet: 'Earth',
                stardustCollection: 50,
                wormholeNavigationSkill: 75,
                missionRank: 'Cadet',
                spacesuitColor_code: 'SILVER'
            },
            {
                auth: {
                    username: 'elek',
                    password: '1234'
                }
            }
        );

        expect(response.status).toBe(201);

    });

});