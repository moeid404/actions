const request = require('supertest');
const app = require('../src/app'); // Adjust the path based on your directory structure

describe('Application Endpoints', () => {
    it('should return Hello, World!', async () => {
        const res = await request(app).get('/');
        expect(res.statusCode).toEqual(200);
        expect(res.text).toContain('Hello, World!');
    });

    it('should return UP status for health check', async () => {
        const res = await request(app).get('/health');
        expect(res.statusCode).toEqual(200);
        expect(res.body.status).toBe('UP');
    });

    it('should return Prometheus metrics', async () => {
        const res = await request(app).get('/metrics');
        expect(res.statusCode).toEqual(200);
        expect(res.text).toContain('# HELP');
    });
});
