import puppeteer from 'puppeteer';
import { fileURLToPath } from 'url';
import path from 'path';
import fs from 'fs';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const fileUrl = 'file://' + path.join(__dirname, 'index.html');

const browser = await puppeteer.launch({
  headless: 'new',
  args: ['--no-sandbox', '--disable-setuid-sandbox', '--font-render-hinting=none'],
});

// 1) Per-slide PNG
const page = await browser.newPage();
await page.setViewport({ width: 1280, height: 720, deviceScaleFactor: 2 });
await page.goto(fileUrl, { waitUntil: 'networkidle0', timeout: 60000 });

const ids = await page.$$eval('section.slide', els => els.map(e => e.id));
console.log('slides:', ids.join(', '));

for (const id of ids) {
  const el = await page.$('#' + id);
  const box = await el.boundingBox();
  await page.setViewport({ width: Math.ceil(box.width), height: Math.ceil(box.height), deviceScaleFactor: 2 });
  await el.screenshot({ path: path.join(__dirname, `slide-${id}.png`) });
  console.log('  png →', `slide-${id}.png`);
}

// 2) Single PDF (one slide per page, 16:9)
const pdfPage = await browser.newPage();
await pdfPage.setViewport({ width: 1280, height: 720, deviceScaleFactor: 2 });
await pdfPage.goto(fileUrl, { waitUntil: 'networkidle0', timeout: 60000 });
// Strip nav + outer container styling so PDF prints clean
await pdfPage.addStyleTag({ content: `
  html, body { background:#fff !important; }
  .nav { display:none !important; }
  .deck { gap:0 !important; padding:0 !important; }
  .slide { box-shadow:none !important; page-break-after: always; break-after: page; }
  .slide:last-child { page-break-after: auto; break-after: auto; }
  @page { size: 1280px 720px; margin: 0; }
`});
await pdfPage.pdf({
  path: path.join(__dirname, 'hotice-deck.pdf'),
  width: '1280px',
  height: '720px',
  printBackground: true,
  preferCSSPageSize: true,
});
console.log('  pdf → hotice-deck.pdf');

await browser.close();
console.log('done');
