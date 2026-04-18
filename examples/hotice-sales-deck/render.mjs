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

await page.setViewport({ width: 1400, height: 800, deviceScaleFactor: 2 });
await page.addStyleTag({ content: `.slideWrap{width:1280px !important; height:720px !important; aspect-ratio:auto !important;} .slide{transform:none !important;} .nav{display:none !important;}` });
for (const id of ids) {
  const el = await page.$('#' + id);
  await el.screenshot({ path: path.join(__dirname, `slide-${id}.png`) });
  console.log('  png →', `slide-${id}.png`);
}

// 2) Single PDF (one slide per page, 16:9)
const pdfPage = await browser.newPage();
await pdfPage.setViewport({ width: 1280, height: 720, deviceScaleFactor: 2 });
await pdfPage.emulateMediaType('screen'); // use screen CSS, not print
await pdfPage.goto(fileUrl, { waitUntil: 'networkidle0', timeout: 60000 });
// Strip nav + outer container styling so PDF prints clean
await pdfPage.addStyleTag({ content: `
  html, body { background:#fff !important; }
  .nav { display:none !important; }
  .deck { gap:0 !important; padding:0 !important; }
  .slideWrap { box-shadow:none !important; width:1280px !important; height:720px !important; aspect-ratio:auto !important; page-break-after: always; break-after: page; container-type:normal !important; }
  .slideWrap:last-child { page-break-after: auto; break-after: auto; }
  .slide { transform:none !important; }
  @page { size: 1280px 720px; margin: 0; }
`});
// Force-load all weights of the web fonts before printing
await pdfPage.evaluate(async () => {
  const families = [
    '300 16px "Noto Sans JP"','400 16px "Noto Sans JP"','500 16px "Noto Sans JP"','700 16px "Noto Sans JP"','900 16px "Noto Sans JP"',
    '400 16px "Inter"','600 16px "Inter"','800 16px "Inter"','900 16px "Inter"',
  ];
  await Promise.all(families.map(f => document.fonts.load(f, '日本語abc123')));
  await document.fonts.ready;
});
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
