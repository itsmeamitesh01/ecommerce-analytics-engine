# E-commerce Analytics Engine

## Overview

This repository contains a toolkit of reusable and modular SQL scripts for performing common, high-impact e-commerce analyses in Google BigQuery. Rather than being a single automated pipeline, this project is structured as a library of standalone analytical modules that can be used to extract key business insights on demand.

The focus is on creating scalable, reusable, and engineered analytical assets that apply software development principles like modularity, parameterization, and documentation to SQL-based data analysis.

## Technologies Used

- **Cloud / Database:** Google BigQuery
- **Language:** SQL

## Toolkit Modules

This engine contains the following analytical modules, located in the `sql_modules` folder:

### `01_clv_analysis.sql`
- [cite_start]**Purpose:** Quantifies the business impact of customer retention by calculating the Customer Lifetime Value (CLV) of new versus repeat buyers from a dataset of over 96,000 customers[cite: 19].
- [cite_start]**Usage:** This script can be executed directly in BigQuery to generate a report on the value of customer retention, proving that repeat buyers have significantly higher CLV[cite: 19].

### `02_review_score_monitoring.sql`
- [cite_start]**Purpose:** Analyzes over 95,000 customer reviews to identify the root causes of customer satisfaction changes[cite: 20].
- [cite_start]**Usage:** Can be used to diagnose performance drops by correlating review scores with operational data like shipping times, which was used to identify late deliveries as a primary driver of low scores[cite: 20].

### `03_parameterized_hero_products.sql`
- [cite_start]**Purpose:** A parameterized and reusable script to identify the top 'M' performing products within the top 'N' highest-revenue product categories[cite: 21].
- **Usage:** This script is a flexible tool for marketing and inventory management. To use it, simply change the values of the `top_n_categories` and `top_m_products` variables at the top of the file and execute in BigQuery.

## How to Use the Toolkit

### Prerequisites

- A Google Cloud Platform account with a project set up.
- Access to a BigQuery dataset containing the relevant e-commerce data (e.g., orders, products, reviews).
- Permissions to run queries in BigQuery.

### Execution

Each script in the `sql_modules` folder is a standalone module. To use one:
1.  Open the desired `.sql` file.
2.  If the script is parameterized, update the variables in the `CONFIGURATION` block at the top.
3.  Copy the entire query.
4.  Paste and execute the query in the Google BigQuery UI.

## Project Structure

```
├── sql_modules/
│   ├── 01_clv_analysis.sql
│   ├── 02_review_score_monitoring.sql
│   └── 03_parameterized_hero_products.sql
├── .gitignore
└── README.md
```