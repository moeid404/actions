const express = require('express');
const app = express();

// Define the port directly in the code
const PORT = 3000;

// Basic route
app.get('/', (req, res) => {
    res.send('Hello, World! This is your deployed Node.js app.');
});

// Health-check endpoint
app.get('/health', (req, res) => {
    res.json({ status: 'UP', message: 'The app is runningg!' });
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});
