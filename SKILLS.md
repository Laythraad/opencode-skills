# مكتبة المهارات — Skill Library

**41 مهارة** لـ OpenCode، مثبّتة في مكانين:

| النطاق | المسار | الأثر |
| --- | --- | --- |
| عالمي (كل المشاريع) | `~/.config/opencode/skills/` | متاح في أي مشروع، أي جلسة |
| المشروع الحالي | `.opencode/skills/` | نسخة قابلة للـ version control والمشاركة |

**المصدر الرسمي:** نسخة المشروع. بعد أي تعديل شغّل:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\sync-skills.ps1
```

**المستودع العام:** <https://github.com/Laythraad/opencode-skills> — نسخة منشورة من المكتبة نفسها، تُحدَّث بـ:

```powershell
powershell -ExecutionPolicy Bypass -File scripts\publish-skills.ps1   # ينسخ + يولّد README + commit + push
powershell -ExecutionPolicy Bypass -File scripts\publish-skills.ps1 -NoPush   # تحضير محلي فقط
```

النشر يتطلب `gh auth login` ناجحاً ونطاقات `repo, read:org, gist`.

**قواعد إلزامية عالمية:** `~/.config/opencode/AGENTS.md` — تُحمَّل في كل جلسة وتفرض اختيار المهارة وبوابات القياس.

---

## 1. الهندسة التقنية

| المهارة | متى تستخدمها |
| --- | --- |
| `software-architecture` | تصميم نظام، قرار «هل نستخدم X؟»، حدود الخدمات، ADR |
| `backend-api-design` | REST/GraphQL/gRPC، أخطاء، ترقيم صفحات، idempotency |
| `database-design` | نمذجة، فهارس، هجرات آمنة، استعلامات بطيئة |
| `devops-cicd` | خطوط النشر، Docker، IaC، مراقبة، جاهزية on-call |
| `security-review` | Threat modeling، auth، تسريب بيانات، أسرار، تبعيات |
| `performance-optimization` | Core Web Vitals، زمن استجابة، ذاكرة، قاعدة بيانات |
| `testing-strategy` | ما يُختبر وكيف، إصلاح flaky tests، تغطية المخاطر |
| `mobile-engineering` | iOS/Android، offline-first، النشر للمتاجر |
| `large-scale-delivery` | Monorepo، عقود بين الفرق، release trains، حوكمة التسليم |

## 2. البرمجة والحِرفة

| المهارة | متى تستخدمها |
| --- | --- |
| `project-scaffolding` | بدء مشروع من الصفر بهيكل إنتاجي، أو تقوية أساسات مستودع |
| `frontend-engineering` | بنية الواجهة، الحالة، جلب البيانات، استراتيجية العرض |
| `refactoring` | كود قديم صعب التغيير، اختبارات تثبيت، strangler pattern |
| `code-review` | مراجعة PR/diff بتعليقات بأولويات وسيناريو فشل |
| `technical-writing` | README، RFC، runbook، توثيق API، postmortem |

## 3. الإدارة والمنتج

| المهارة | متى تستخدمها |
| --- | --- |
| `product-strategy-okrs` | الرؤية، الاستراتيجية، OKR، أولويات المحفظة |
| `product-requirements` | PRD، قصص مستخدم، معايير قبول، أولويات |
| `project-management` | التخطيط، التقديرات، المخاطر، المسار الحرج، تقارير الحالة |
| `engineering-leadership` | 1:1، تغذية راجعة، توظيف، تفويض، أداء، حوادث |
| `data-analytics` | خطة تتبع، قمع، أفواج، SQL تحليلي، A/B tests |

## 4. UI/UX

| المهارة | متى تستخدمها |
| --- | --- |
| `ux-research` | مقابلات، اختبارات قابلية استخدام، تركيب النتائج |
| `interaction-design` | التدفقات، الحالات السبع، التغذية الراجعة، الحركة |
| `ui-visual-design` | التسلسل البصري، الخطوط، الألوان، المسافات، الوضع الداكن |
| `design-system` | Tokens، واجهات المكونات، التوثيق، الإصدارات، التبنّي |
| `accessibility` | WCAG 2.2 AA، لوحة المفاتيح، قارئ الشاشة، التباين |

## 5. المسابقات والعروض

| المهارة | متى تستخدمها |
| --- | --- |
| `hackathon-execution` | 24/48/72 ساعة: نطاق، demo-first، أدوار، تحكيم، مخاطر |
| `competition-pitch` | Pitch، شرائح، سكربت عرض حي، أسئلة الحكّام |

## 6. الذكاء الاصطناعي

| المهارة | متى تستخدمها |
| --- | --- |
| `ai-feature-integration` | RAG، مخرجات منظمة، تقييمات، guardrails، تكلفة وزمن |
| `ai-agent-engineering` | ربط النماذج والأدوات بسير عمل محدود ومقابل (`agent-contract`, `tool-policy`) |
| `prompt-engineering` | كتابة prompts قابلة للاختبار مع مخرجات محدودة وقابلة للتقييم |

## 7. حزمة Mors (هندسة موسّعة)

| المهارة | متى تستخدمها |
| --- | --- |
| `product-architect` | تحويل هدف غامض إلى نطاق ومتطلبات وقرارات قابلة للعكس |
| `project-orchestration` | تنسيق مهارات متخصصة في تدفّق تسليم مرتّب وقابل للتتبع |
| `backend-engineering` | خدمات وواجهات قابلة للصيانة بعقود متوقعة وسلوك مرن |
| `database-engineering` | نماذج بيانات وهجرات واستعلامات تحافظ على السلامة |
| `qa-testing` | ثقة إصدار مبنية على الأدلة بتغطية مبنية على المخاطر |
| `devops-deployment` | CI/CD آمن قابل للتكرار مع المراقبة والجاهزية التشغيلية |
| `security-privacy` | threat modeling، إعدادات آمنة، تقليل الخصوصية، ضوابط قابلة للتحقق |
| `ux-ui-design` | تجارب هادئة وواضحة التسلسل وسهلة الوصول |
| `data-science-analytics` | تحليل موثوق من بيانات مفحوصة ومقاييس معرّفة بوضوح |
| `scientific-research` | إجابات علمية بالأدلة والنسبية وعدم اليقين وإمكانية إعادة الإنتاج |
| `space-data-engineering` | خطوط أنابيب لبيانات الأرض والفلك وبعثات الفضاء العامة |
| `technical-documentation` | توثيق دقيق وقابل للتنقل يبقى متوافقاً مع التنفيذ |

> **ملاحظة تداخل:** هذه المهارات تتقاطع مفاهيمياً مع مهارات القسم 1–4 بمسميات مختلفة. عند التعارض اختر المهارة الأضيق لنطاق المهمة؛ لا تستدعِ الاثنين معاً إلا لمهام متعددة التخصصات عبر `project-orchestration`.

---

## قوالب جاهزة

| القالب | المسار |
| --- | --- |
| ADR | `software-architecture/references/adr-template.md` |
| PRD | `product-requirements/references/prd-template.md` |
| Runbook | `technical-writing/references/runbook-template.md` |
| عقد مكوّن | `frontend-engineering/references/component-contract.md` |
| قائمة مراجعة واجهة | `frontend-engineering/references/frontend-checklist.md` |
| عقد واجهة API | `backend-engineering/references/api-contract.md` |
| نموذج أخطاء | `backend-engineering/references/error-model.md` |
| خطة هجرة | `database-engineering/references/migration-plan.md` |
| خطة تقييم وكيل | `ai-agent-engineering/references/evaluation-plan.md` |
| سياسة أدوات | `ai-agent-engineering/references/tool-policy.md` |
| نموذج تهديدات | `security-privacy/references/threat-model.md` |
| خطة اختبار | `qa-testing/references/test-plan.md` |
| سجل قرار | `product-architect/references/decision-record.md` |
| تقرير تسليم | `project-orchestration/references/handoff.md` |

## أمثلة

```
@hackathon-execution عندي 48 ساعة، فكرة تطبيق صحي، فريق 4 — اكتب خطة الساعات والنطاق
@project-scaffolding ابدأ مشروع Next.js + Postgres بهيكل إنتاجي و CI
@software-architecture قارن monolith وmicroservices لفريق 6 أشخاص
@ai-feature-integration أضف RAG على مستندات العملاء مع تقييمات
@competition-pitch اكتب عرض 3 دقائق وسكربت الديمو و10 أسئلة متوقعة
@accessibility راجع صفحة الدفع WCAG 2.2 AA
```

## قواعد الجودة في المكتبة

- كل مهارة تبدأ بخطوات عملية لا بتعريفات.
- جداول قرار عند وجود مقايضات.
- «أنماط مضادة» صريحة.
- مخرجات محددة (deliverables) لا نصائح.
- أرقام قابلة للقياس (p95، 4.5:1، 24px…) بدل «سريع/جيد».

## إضافة مهارة جديدة

1. `.opencode/skills/<id>/SKILL.md` باسم kebab-case.
2. frontmatter: `name` + `description` (الوصف إلزامي للاكتشاف التلقائي).
3. الإجراءات، جداول القرار، الأنماط المضادة، المخرجات.
4. القوالب في `references/`، السكربتات في `scripts/`.
5. شغّل `scripts\sync-skills.ps1`.
6. شغّل `scripts\publish-skills.ps1` لنشرها إلى GitHub.
7. تُحمَّل تلقائياً عند الحفظ — لا حاجة لإعادة تشغيل.
