# エージェント連携パターン集

> CLAUDE.md から分離した18の連携パターン詳細。各パターンで使用するスキルを 📘 で明示。エージェントのシナリオ別プレイブックと組み合わせて使う。

## パターン1: 新サービスのLPを作りたい
```
consulting/proposal-writer → creative/ux-designer → creative/frontend-dev
     （訴求整理）              （UX設計）              （実装）
📘 consulting-playbook → creative-playbook → code-quality-gates
※ 早期プロトタイプはClaude Designで生成→HTML export→frontend-devで仕上げも可
```

## パターン2: クライアントへの戦略提案書を作りたい
```
consulting/competitive-analyst → consulting/strategy-lead → consulting/proposal-writer
       （市場分析）                   （戦略立案）               （資料化）
📘 first-principles-breakdown → revenue-growth-framework → brand-guidelines
```

## パターン3: SaaSプロダクトの新機能を開発したい
```
service-dev/tech-lead → service-dev/fullstack-dev → creative/frontend-dev
      （設計）                （実装）                    （UI）
📘 api-design-patterns → engineering-playbook + migration-safety → code-quality-gates
```

## パターン4: コンテンツマーケティング戦略を立てたい
```
consulting/kpi-analytics → creative/content-strategist → creative/agentic-content
     （KPI設計）                （コンテンツ戦略）            （AIO最適化）
📘 digital-sales-intelligence → creative-playbook → prompt-engineering
```

## パターン5: 新規事業の参入判断をしたい
```
consulting/competitive-analyst → consulting/strategy-lead → consulting/kpi-analytics
       （市場構造分析）              （戦略判断）               （PL試算）
📘 first-principles-breakdown → revenue-growth-framework → consulting-playbook
```

## パターン6: AI導入コンサルを提案したい
```
consulting/ai-consultant → service-dev/ai-engineer → consulting/proposal-writer
     （導入戦略・ROI）         （技術検証）              （提案書化）
📘 prompt-engineering → engineering-playbook → consulting-playbook
```

## パターン7: SaaSの解約率を下げたい
```
consulting/client-success → consulting/kpi-analytics → product/product-manager
    （解約分析・ヘルススコア）     （LTV/チャーン計測）       （機能改善計画）
```

## パターン8: プロダクトロードマップを作りたい
```
product/product-manager → service-dev/tech-lead → consulting/kpi-analytics
    （優先順位付け）           （技術実現性）          （PL試算）
```

## パターン9: CVR改善・グロース施策を回したい
```
creative/growth-hacker → consulting/kpi-analytics → product/feedback-synthesizer
    （実験設計・A/Bテスト）     （計測・分析）            （ユーザー声との突合）
```

## パターン10: 新サービスの法務チェックをしたい
```
consulting/legal-compliance-checker → consulting/proposal-writer → consulting/strategy-lead
       （法的リスク洗い出し）              （契約条件の整理）           （事業判断）
```

## パターン11: ユーザーフィードバックからプロダクト改善したい
```
product/feedback-synthesizer → product/product-manager → service-dev/tech-lead
     （VOC分析・インサイト）         （優先順位付け）           （実装判断）
```

## パターン12: SaaSプロダクトを海外展開したい
```
global/gtm-consultant → global/global-journalist → consulting/kpi-analytics
     （GTM戦略設計）         （現地市場リサーチ）         （PL試算）
📘 revenue-growth-framework → first-principles-breakdown → consulting-playbook
```

## パターン13: 海外規制変更のインパクトを分析したい
```
global/global-journalist → consulting/legal-compliance-checker → consulting/strategy-lead
     （情報収集・構造化）          （法的影響評価）                  （事業判断）
📘 first-principles-breakdown → consulting-playbook
```

## パターン14: マーケティング資料を多言語展開したい
```
global/business-translator → creative/brand-guardian → creative/content-strategist
     （トランスクリエーション）      （ブランド整合確認）        （現地コンテンツ戦略）
📘 brand-guidelines → creative-playbook
```

## パターン15: 海外拠点を設立したい
```
global/global-business → consulting/legal-compliance-checker → consulting/kpi-analytics
     （オペレーション設計）        （現地法規制チェック）            （コスト試算）
📘 revenue-growth-framework → consulting-playbook
```

## パターン16: 広告ROAS改善・チャネルミックス最適化
```
marketing-research/marketing-director → marketing-research/performance-marketer → marketing-research/marketing-analyst
          （全体戦略・予算配分）              （広告運用最適化）                    （アトリビューション分析）
📘 digital-sales-intelligence → revenue-growth-framework → marketing-research-playbook
```

## パターン17: リード獲得→ナーチャリング→商談化パイプライン構築
```
marketing-research/crm-ma-strategist → consulting/lead-qualifier → creative/content-strategist
       （MA設計・スコアリング）            （商談化基準・SLA）         （ナーチャリングコンテンツ）
📘 marketing-research-playbook → consulting-playbook → creative-playbook
```

## パターン18: PR・広報戦略で認知拡大したい
```
marketing-research/pr-communications → marketing-research/social-media-strategist → creative/brand-guardian
         （PR戦略・メディアリレーション）        （ソーシャル連携）                    （ブランド整合）
📘 marketing-research-playbook → brand-guidelines → creative-playbook
```
