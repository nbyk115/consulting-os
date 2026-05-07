// Render the generated PDF page 1 back to PNG to verify fonts visually
import puppeteer from 'puppeteer';
import { fileURLToPath } from 'url';
import path from 'path';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const pdfUrl = 'file://' + path.join(__dirname, 'hotice-deck.pdf');

const browser = await puppeteer.launch({
  headless: 'new',
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});
const page = await browser.newPage();
await page.setViewport({ width: 1280, height: 720, deviceScaleFactor: 2 });
await page.goto(pdfUrl, { waitUntil: 'networkidle0', timeout: 60000 });
await new Promise(r => setTimeout(r, 1500));
await page.screenshot({ path: path.join(__dirname, 'pdf-page1-check.png') });
await browser.close();
console.log('pdf-page1-check.png');
