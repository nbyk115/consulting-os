import puppeteer from 'puppeteer';
import { fileURLToPath } from 'url';
import path from 'path';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const fileUrl = 'file://' + path.join(__dirname, 'index.html');

const browser = await puppeteer.launch({
  headless: 'new',
  args: ['--no-sandbox', '--disable-setuid-sandbox', '--font-render-hinting=none'],
});
const page = await browser.newPage();
await page.setViewport({ width: 1280, height: 720, deviceScaleFactor: 2 });
await page.goto(fileUrl, { waitUntil: 'networkidle0', timeout: 60000 });

const ids = await page.$$eval('section.slide', els => els.map(e => e.id));
console.log('found slides:', ids.join(', '));

for (const id of ids) {
  const el = await page.$('#' + id);
  const box = await el.boundingBox();
  await page.setViewport({ width: Math.ceil(box.width), height: Math.ceil(box.height), deviceScaleFactor: 2 });
  await el.screenshot({ path: path.join(__dirname, `slide-${id}.png`), omitBackground: false });
  console.log('rendered', `slide-${id}.png`);
}

await browser.close();
console.log('done');
