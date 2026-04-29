# データソース・インデックス（信頼ソース集）

> **ハルシネーション防止の防衛線**。ConsultingOS の全エージェントが数値・市場データを引用する際、まずこのファイルを参照する。一次ソースの URL + 最終確認日を必ず付与し、不確実なものは "NOT VERIFIABLE" として削除 or 軟化。

**運用ルール:**
- 数値引用時、まずこのファイルから探す
- 該当ソースがなければ Web 検索 → 一次ソース確認 → このファイルに追加
- 半年に1度、全ソースの URL と数値の最新性を確認
- 公開できない非公開ソース（クライアント NDA 等）は記載禁止（口頭共有のみ）

---

## 1. 経済・市場マクロデータ

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| 日本 GDP・経済統計 | 内閣府・経済社会総合研究所 | https://www.esri.cao.go.jp/ | 2026-04 |
| 日本 業界統計 | 経済産業省 統計 | https://www.meti.go.jp/statistics/ | 2026-04 |
| 日本 人口・労働 | 総務省統計局 | https://www.stat.go.jp/ | 2026-04 |
| グローバル経済 | IMF World Economic Outlook | https://www.imf.org/en/Publications/WEO | 2026-04 |
| グローバル経済 | World Bank Open Data | https://data.worldbank.org/ | 2026-04 |
| マクロ経済（米） | FRED（Federal Reserve Economic Data） | https://fred.stlouisfed.org/ | 2026-04 |

---

## 2. デジタル広告・マーケティング

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| 日本 広告費 | 電通「日本の広告費」 | https://www.dentsu.co.jp/news/release/ | 2026-04 |
| 日本 デジタル広告 | サイバーエージェント次世代生活研究所 | https://www.cyberagent.co.jp/news/ | 2026-04 |
| グローバル広告費 | GroupM "This Year, Next Year" | https://www.groupm.com/this-year-next-year/ | 2026-04 |
| プログラマティック | IAB Tech Lab | https://iabtechlab.com/ | 2026-04 |
| CTV・動画広告 | The Trade Desk - The Current | https://www.thecurrent.com/ | 2026-04 |
| デジタル動向 | Digiday Japan | https://digiday.jp/ | 2026-04 |
| デジタル動向 | MarkeZine | https://markezine.jp/ | 2026-04 |
| 広告計測標準 | Open Measurement SDK / VAST / OpenRTB | https://iabtechlab.com/standards/ | 2026-04 |

---

## 3. SEO・コンテンツ

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| Google Search 公式 | Google Search Central Blog | https://developers.google.com/search/blog | 2026-04 |
| Google QRG | Search Quality Rater Guidelines（PDF） | https://services.google.com/fh/files/misc/hsw-sqrg.pdf | 2026-04 |
| SEO 業界動向 | Search Engine Journal | https://www.searchenginejournal.com/ | 2026-04 |
| SEO 業界動向 | Search Engine Land | https://searchengineland.com/ | 2026-04 |
| Zero-Click データ | SparkToro Research | https://sparktoro.com/blog | 2026-04 |
| AI Overviews 影響 | Similarweb / Sistrix | https://www.similarweb.com/ | 2026-04 |
| Core Web Vitals | web.dev (Google) | https://web.dev/vitals/ | 2026-04 |

---

## 4. SaaS・スタートアップ

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| SaaS ベンチマーク | OpenView "SaaS Benchmarks" | https://openviewpartners.com/ | 2026-04 |
| SaaS ベンチマーク | KeyBanc Capital Markets SaaS Survey | https://www.key.com/businesses-institutions/industry-expertise/saas-survey.jsp | 2026-04 |
| SaaS Bessemer | Bessemer Cloud Index / SaaS Benchmarks | https://cloudindex.bvp.com/ | 2026-04 |
| 日本 SaaS 動向 | ITR / 富士キメラ総研 | https://www.itr.co.jp/ | 2026-04 |
| 日本スタートアップ | INITIAL（旧 entrepedia） | https://initial.inc/ | 2026-04 |
| 日本スタートアップ | STARTUP DB | https://startup-db.com/ | 2026-04 |
| グローバル VC | Crunchbase | https://www.crunchbase.com/ | 2026-04 |
| グローバル VC | PitchBook | https://pitchbook.com/ | 2026-04 |

---

## 5. AI・生成AI

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| Anthropic 公式 | Anthropic News / Research | https://www.anthropic.com/news | 2026-04 |
| OpenAI 公式 | OpenAI Blog / Research | https://openai.com/news/ | 2026-04 |
| AI 業界動向 | a16z AI Newsletter | https://a16z.com/ai/ | 2026-04 |
| AI 業界動向 | The Information | https://www.theinformation.com/ | 2026-04 |
| AI 利用統計 | Anthropic Economic Index | https://www.anthropic.com/news/the-anthropic-economic-index | 2026-04 |
| LLM ベンチマーク | LMSYS Chatbot Arena | https://lmarena.ai/ | 2026-04 |
| LLM ベンチマーク | Artificial Analysis | https://artificialanalysis.ai/ | 2026-04 |

---

## 6. EC・D2C

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| 日本 EC 市場 | 経済産業省「電子商取引に関する市場調査」 | https://www.meti.go.jp/policy/it_policy/statistics/outlook/ie_outlook.html | 2026-04 |
| グローバル EC | eMarketer / Insider Intelligence | https://www.emarketer.com/ | 2026-04 |
| Shopify 動向 | Shopify Investor Relations | https://investors.shopify.com/ | 2026-04 |
| D2C ベンチマーク | Klaviyo Benchmarks | https://www.klaviyo.com/blog/ | 2026-04 |
| Amazon 動向 | Marketplace Pulse | https://www.marketplacepulse.com/ | 2026-04 |

---

## 7. 顧客体験・カスタマーサクセス

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| NPS / Earned Growth | Bain "Net Promoter 3.0" | https://www.bain.com/insights/net-promoter-3-0/ | 2026-04 |
| Customer Success | Sixteen Ventures (Lincoln Murphy) | https://www.sixteenventures.com/ | 2026-04 |
| カスタマーサクセス指標 | Gainsight Pulse Conference | https://www.gainsight.com/pulse-conference/ | 2026-04 |

---

## 8. 信頼・PR・社会

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| Trust Barometer | Edelman Trust Barometer 2025 | https://www.edelman.com/trust/2025/trust-barometer | 2026-04 |
| グローバル世論 | Ipsos Global Trends | https://www.ipsos.com/en/global-trends | 2026-04 |
| グローバル世論 | Pew Research Center | https://www.pewresearch.org/ | 2026-04 |
| 危機管理 | Smith & Company | https://judysmith.com/ | 2026-04 |

---

## 9. 異文化・グローバル展開

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| 異文化6次元 | Hofstede Insights / 6D Model | https://geerthofstede.com/culture-geert-hofstede-gert-jan-hofstede/6d-model-of-national-culture/ | 2026-04 |
| グローバル化指数 | DHL Global Connectedness Index | https://www.dhl.com/global-en/home/insights-and-innovation/insights/global-connectedness-index.html | 2026-04 |
| 海外市場 | OECD Data | https://data.oecd.org/ | 2026-04 |
| 海外市場 | World Trade Organization | https://www.wto.org/ | 2026-04 |
| グローバル戦略 | Pankaj Ghemawat Research | https://ghemawat.com/ | 2026-04 |

---

## 10. ブランド・消費者

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| ブランドエクイティ | Kantar BrandZ | https://www.kantar.com/campaigns/brandz | 2026-04 |
| ブランド価値 | Interbrand Best Global Brands | https://interbrand.com/best-global-brands/ | 2026-04 |
| 消費者調査 | Nielsen | https://www.nielsen.com/insights/ | 2026-04 |
| 消費者調査 | Ipsos | https://www.ipsos.com/ | 2026-04 |
| 日本 消費者 | 博報堂生活総合研究所 | https://seikatsusoken.jp/ | 2026-04 |
| 日本 消費者 | 電通メディアイノベーションラボ | https://institute.dentsu.com/ | 2026-04 |

---

## 11. テクノロジー・エンジニアリング

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| 技術トレンド | Gartner Hype Cycle | https://www.gartner.com/en/research/methodologies/gartner-hype-cycle | 2026-04 |
| 技術トレンド | ThoughtWorks Technology Radar | https://www.thoughtworks.com/radar | 2026-04 |
| クラウド動向 | CNCF Annual Survey | https://www.cncf.io/reports/ | 2026-04 |
| 開発者調査 | Stack Overflow Developer Survey | https://survey.stackoverflow.co/ | 2026-04 |
| 開発者調査 | GitHub Octoverse | https://github.blog/category/octoverse/ | 2026-04 |
| Web 標準 | W3C / web.dev / MDN | https://web.dev/ | 2026-04 |

---

## 12. 法務・コンプライアンス（日本）

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| 個人情報保護 | 個人情報保護委員会 | https://www.ppc.go.jp/ | 2026-04 |
| 景品表示法 | 消費者庁 表示対策 | https://www.caa.go.jp/policies/policy/representation/ | 2026-04 |
| 特定商取引法 | 消費者庁 特商法 | https://www.no-trouble.caa.go.jp/ | 2026-04 |
| 著作権 | 文化庁 著作権 | https://www.bunka.go.jp/seisaku/chosakuken/ | 2026-04 |
| 不正競争防止法 | 経済産業省 知的財産政策 | https://www.meti.go.jp/policy/economy/chizai/ | 2026-04 |
| 薬機法（医薬品・化粧品） | 厚生労働省 / PMDA | https://www.pmda.go.jp/ | 2026-04 |
| 金融商品取引法 | 金融庁 | https://www.fsa.go.jp/ | 2026-04 |

---

## 13. 法務・コンプライアンス（グローバル）

| 領域 | ソース | URL | 最終確認 |
|---|---|---|---|
| GDPR | European Commission | https://commission.europa.eu/law/law-topic/data-protection_en | 2026-04 |
| CCPA | California AG | https://oag.ca.gov/privacy/ccpa | 2026-04 |
| AI 規制（EU） | EU AI Act | https://artificialintelligenceact.eu/ | 2026-04 |
| プライバシー全般 | IAPP | https://iapp.org/ | 2026-04 |

---

## 引用ルール（全エージェント必須）

提案書・分析資料に数値を引用する時:

```
[数値] [単位] (出典: [URL] / [発行: YYYY-MM-DD])
```

例:
```
日本のSaaS市場は **2024年 1.5兆円**（出典: [富士キメラ総研](https://www.fcr.co.jp/) / 発行: 2024-09）
```

**禁止事項:**
- ❌ 出典なしの「業界平均は〜」
- ❌ 「最も」「業界随一」「唯一」の無根拠使用
- ❌ 5年以上前のデータをそのまま引用（必ず最新版を確認）
- ❌ クライアントヒアリング由来の非公開データ（口頭共有のみ）

---

## 更新履歴

| 日付 | 変更 |
|---|---|
| 2026-04-29 | 初版作成（13カテゴリ × 70+ ソース） |
