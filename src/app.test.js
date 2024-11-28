import request from 'supertest';
import { app, server } from './App.js'; // Import both app and server

describe('Application Endpoints', () => {
    // Close the server after all tests
    afterAll(() => {
        server.close();
    });

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
