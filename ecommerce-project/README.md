# 🛍️ E-Commerce SQL + Python Project

## 📌 Overview
This project simulates a simple e-commerce database using **PostgreSQL**.  

It includes:
- SQL scripts to create and populate tables.
- Analytical queries (e.g., top customers, monthly revenue).
- Python scripts to connect to the database and visualize results.

---

## 🗂️ Project Structure

```text
ecommerce-project/
│
├── sql/
│   ├── setup.sql        # Database schema & tables
│   ├── queries.sql      # Raw SQL queries
│
├── src/
│   ├── db.py            # Database connection helpers
│   ├── queries.py       # Queries as Python strings
│   └── analysis.py      # Example analysis with Pandas & Matplotlib
│
├── requirements.txt     # Python dependencies
└── README.md            # Project documentation
```

## ⚡ Setup

### Step 1: Create database & tables
Run the schema setup script:

```bash
psql -U <your_user> -d <your_db> -f sql/setup.sql
```

### Step 2: Install Python dependencies
```bash
pip install -r requirements.txt
```

### Step 3: Run analysis
```bash
python src/analysis.py
```
