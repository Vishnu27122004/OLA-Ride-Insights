# OLA Ride Insights - End-to-End Data Analytics Project

## 📊 Project Overview
A comprehensive data analytics project analyzing OLA ride-booking data using Python, SQL, and Power BI. This project demonstrates complete data analytics workflow from data cleaning to business intelligence dashboard creation.

## 🎯 Objectives
- Extract and clean OLA ride-booking raw data
- Perform exploratory data analysis (EDA)
- Develop SQL queries for business insights
- Create interactive Power BI dashboard with KPIs
- Generate actionable insights for business decision-making

## 📁 Project Structure
```
OLA-Ride-Insights/
├── data/                          # Data files
│   ├── raw/                       # Raw datasets
│   └── processed/                 # Cleaned datasets
├── notebooks/                     # Jupyter notebooks
│   ├── 01_EDA.ipynb              # Exploratory Data Analysis
│   ├── 02_Data_Cleaning.ipynb    # Data cleaning & preprocessing
│   └── 03_Analysis.ipynb         # In-depth analysis
├── scripts/                       # Python scripts
│   ├── data_cleaning.py          # Cleaning functions
│   ├── analysis.py               # Analysis functions
│   └── utils.py                  # Utility functions
├── sql/                           # SQL queries
│   └── queries.sql               # Business intelligence queries
├── dashboards/                    # Power BI files
│   └── OLA_Dashboard.pbix        # Interactive dashboard
├── reports/                       # Analysis reports
│   └── insights.md               # Key findings
├── requirements.txt              # Python dependencies
├── .gitignore                    # Git ignore rules
├── LICENSE                       # License
└── README.md                     # This file
```

## 🛠️ Tech Stack
- **Python**: Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn
- **SQL**: Data querying and aggregation
- **Power BI**: Data visualization and dashboard creation
- **Jupyter Notebook**: Interactive analysis and documentation

## 📊 Key Features
1. **Data Cleaning**: Handling missing values, outliers, and data type conversions
2. **EDA**: Statistical analysis, distributions, correlations, patterns
3. **SQL Analysis**: Complex queries for business metrics and KPIs
4. **Interactive Dashboard**: Real-time insights and trend analysis
5. **Business Metrics**: 
   - Ride completion rate
   - Average ride distance & duration
   - Customer satisfaction scores
   - Revenue analysis
   - Peak hours and demand patterns

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- Jupyter Notebook
- Power BI Desktop
- SQL Server/MySQL

### Installation
```bash
# Clone the repository
git clone https://github.com/Vishnu27122004/OLA-Ride-Insights.git
cd OLA-Ride-Insights

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Running Analysis
```bash
# Start Jupyter Notebook
jupyter notebook

# Navigate to notebooks/ and run in order:
# 1. 01_EDA.ipynb
# 2. 02_Data_Cleaning.ipynb
# 3. 03_Analysis.ipynb
```

## 📈 Key Findings
- [Key insight 1]
- [Key insight 2]
- [Key insight 3]

*See `reports/insights.md` for detailed findings*

## 📊 Dashboard Insights
The Power BI dashboard includes:
- Trip completion metrics
- Revenue trends
- Customer satisfaction analysis
- Geographic ride distribution
- Time-based demand patterns
- Driver performance metrics

## 📝 SQL Queries
Key business questions answered:
- What is the average ride duration by time of day?
- Which routes generate highest revenue?
- Customer retention and satisfaction trends
- Peak demand hours and days

*See `sql/queries.sql` for all queries*

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License
This project is licensed under the MIT License - see the `LICENSE` file for details.

## 👤 Author
**Vishnu** - [GitHub Profile](https://github.com/Vishnu27122004)

## 📞 Contact
For questions or feedback, please reach out via:
- GitHub Issues
- Email: [your-email@example.com]

## 🙏 Acknowledgments
- OLA for providing ride-booking dataset
- VTU for academic support
- Data analytics community for guidance

---
**Last Updated**: January 2026
