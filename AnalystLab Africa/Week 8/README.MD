# Global Trade Insight: Impact on GDP

![Status](https://img.shields.io/badge/Status-Complete-brightgreen) ![Project](https://img.shields.io/badge/Project-Capstone-blue) ![License](https://img.shields.io/badge/License-CC--BY%204.0-orange)

> Analyzing the relationship between international trade openness and economic growth using 60+ years of World Bank data.

## 📊 Quick Summary

This project investigates a fundamental economic question: **Does increased international trade lead to faster economic growth?**

**Key Finding:** Trade-GDP growth correlation is only **0.08** (statistically weak), meaning trade is important but not the primary driver of economic expansion.

## 🎯 Project Overview

- **Dataset:** World Bank World Development Indicators (WDI)
- **Countries:** 200+
- **Time Period:** 1960-2024 (60+ years)
- **Records Analyzed:** 395,277 → 13,000 (cleaned)
- **Tools:** Power BI, Power Query, DAX

## 📈 Key Findings

| Finding | Impact |
|---------|--------|
| Trade-GDP Correlation | 0.08 (weak) |
| Global Avg GDP Growth | 3.67% |
| Global Trade Openness | 801.27K |
| Case Study | Singapore 377% trade, 4.55% growth |

**Insight:** Countries with identical trade exposure achieve different growth rates. Context (institutions, education, governance) matters as much as trade policy.

## 🔧 Data Cleaning Process

```
Raw Data (395K records)
       ↓
Promoted Headers
       ↓
Filtered 4 Key Indicators
       ↓
Unpivoted Time Series
       ↓
Changed Data Types
       ↓
Removed Blanks
       ↓
Clean Data (13K records) ✓
```

## 📊 Visualizations

The Power BI dashboard includes:

1. **Global GDP vs. Trade Openness Trends** (60-year trend)
2. **Trade Openness vs. Annual GDP Growth** (Correlation scatter plot)
3. **Global Import vs. Export Performance** (Dual-axis chart)
4. **Total GDP by Country** (Rankings bar chart)
5. **Historical Trade and Growth Metrics** (Data table)

## 💻 Technical Stack

- **ETL:** Power Query (M language)
- **Dashboard:** Power BI
- **Analytics:** DAX (Data Analysis Expressions)
- **Data Source:** World Bank WDI API

## 📁 Repository Contents

```
├── Global_Trade_Insight_Final_Report.docx    # Full analysis (10 pages)
├── README.md                                  # This file
├── Data_Dictionary_Methodology.md             # Technical reference
├── Demo_Video_Script.md                       # Video narration
├── LinkedIn_Post.md                           # Social media post
└── Power_BI_Dashboard                         # Interactive dashboard files
```

## 🎬 Watch the Demo

A 4-minute video walkthrough is available showing:
- Data source (World Bank WDI)
- Data cleaning process (Power Query)
- DAX measure creation
- Dashboard analysis
- Key insights & recommendations

## 🔑 Key Insights

### Finding 1: Weak Trade-Growth Correlation
Trade is necessary but not sufficient for growth. Other factors (institutions, education, infrastructure) are equally important.

### Finding 2: Country Context Matters
Singapore and Luxembourg have nearly identical trade openness (~375%) but different growth rates (4.55% vs 3.61%), proving institutional context is critical.

### Finding 3: Post-2008 Structural Break
The 2008 financial crisis created a structural break in trade-growth dynamics. Trade persisted, but GDP growth stagnated in many developed economies.

### Finding 4: Developed Nations Plateau
Top 5 economies (USA, China, Japan, Germany, UK) dominate trade volume but don't experience proportionally higher growth rates.

### Finding 5: Institutional Quality Drives Success
Countries combining trade integration with strong governance, education, and infrastructure (Singapore model) achieve sustained growth.

## 💡 Recommendations

**For Developing Nations:**
- Pair trade liberalization with education & governance reforms
- Study successful peers (Vietnam, Singapore models)
- Invest in institutional capacity

**For Development Organizations:**
- Condition trade finance on institutional improvements
- Recognize context variation in trade effectiveness
- Support labor-market transitions

**For Investors:**
- High trade openness ≠ market opportunity
- Assess institutional quality & governance
- Monitor geopolitical trade risks

## 📚 Full Documentation

For detailed analysis, methodology, and recommendations, see:
- **[Full Report](./Global_Trade_Insight_Final_Report.docx)** - Complete analysis (10 pages)
- **[Data Dictionary](./Data_Dictionary_Methodology.md)** - Indicator definitions & calculations
- **[Video Script](./Demo_Video_Script.md)** - Narration for demo video

## 🎓 About This Project

**Capstone Project:** AnalystLab Africa Data Analytics Internship (Week 8)  
**Analyst:** Gift Onyia  
**Completion Date:** June 2026  
**Program:** AnalystLab Africa Intensive  

## 📖 Data Source

**World Bank World Development Indicators (WDI)**
- URL: https://datatopics.worldbank.org/world-development-indicators/
- License: Creative Commons Attribution 4.0 (CC-BY 4.0)
- Citation: World Bank Group

## 🙏 Acknowledgments

- **Data Source:** World Bank World Development Indicators
- **Program:** AnalystLab Africa
- **Tools:** Microsoft Power BI, Power Query

## 📧 Questions?

For questions about the analysis or methodology, refer to:
- Full Report: [Global_Trade_Insight_Final_Report.docx](./Global_Trade_Insight_Final_Report.docx)
- Demo Video: [Video Walkthrough](./demo_video.mp4)

## 📄 License

This analysis uses World Bank data licensed under Creative Commons Attribution 4.0 (CC-BY 4.0).

---

**Status:** ✅ Complete | **Last Updated:** June 2026 | **Version:** 1.0
