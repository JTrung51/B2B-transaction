import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import http from 'http';

dotenv.config();

const app = express();
const server = http.createServer(app);

app.use(cors({ origin: process.env.FRONTEND_URL, credentials: true }));
app.use(express.json());

app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

const PORT = process.env.PORT || 4000;
server.listen(PORT, () => console.log(`Server running on port ${PORT}`));