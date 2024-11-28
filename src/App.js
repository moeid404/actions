import express from 'express';
import morgan from 'morgan';
import client from 'prom-client';

const app = express();

// Middleware for logging HTTP requests
app.use(morgan('combined'));

// Default Prometheus metrics
client.collectDefaultMetrics();

// Define the port from environment variables or use default
const PORT = process.env.PORT || 3000;

// Basic route
app.get('/', (req, res) => {
    res.send('Hello, World! This is your enhanced Node.js app.');
});

// Configurable health-check endpoint
app.get('/health', (req, res) => {
    const dbConnection = true; // Simulate database connection
    const apiStatus = true;    // Simulate API status

    if (dbConnection && apiStatus) {
        res.status(200).json({ status: 'UP', message: 'All systems operational.' });
    } else {
        res.status(500).json({ status: 'DOWN', message: 'One or more systems are down.' });
    }
});

// Prometheus metrics endpoint
app.get('/metrics', async (req, res) => {
    res.set('Content-Type', client.register.contentType);
    res.end(await client.register.metrics());
});

// Start the server
const server = app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

// Export both app and server for testing
export { app, server };
