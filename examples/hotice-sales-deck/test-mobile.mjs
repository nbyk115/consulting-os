import puppeteer from 'puppeteer';
import { fileURLToPath } from 'url';
import path from 'path';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const fileUrl = 'file://' + path.join(__dirname, 'index.html');

const browser = await puppeteer.launch({
  headless: 'new',
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});
const page = await browser.newPage();
await page.setViewport({ width: 393, height: 852, deviceScaleFactor: 3, isMobile: true });
await page.goto(fileUrl, { waitUntil: 'networkidle0', timeout: 60000 });
await page.screenshot({ path: path.join(__dirname, 'mobile-preview.png'), fullPage: true });
await browser.close();
console.log('mobile-preview.png');
