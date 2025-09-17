# E-commerce Analytics Engine

## Overview

This repository contains a toolkit of reusable and modular SQL scripts for performing common, high-impact e-commerce analyses in Google BigQuery. Rather than being a single automated pipeline, this project is structured as a library of standalone analytical modules that can be used to extract key business insights on demand.

The focus is on creating scalable, reusable, and engineered analytical assets that apply software development principles like modularity, parameterization, and documentation to SQL-based data analysis.

## Project Evolution

This repository represents the evolution of a standard data analysis project into a structured, engineered toolkit. The original work, which involved writing standalone SQL queries to answer specific business questions, can be found in the [E-commerce SQL Analysis](https://github.com/itsmeamitesh01/E-commerce-SQL-Analysis).

The initial analysis successfully:
* Quantified that repeat buyers had an 88% higher customer lifetime value (CLV).
* Diagnosed that drops in customer satisfaction were driven by late deliveries by analyzing over 95,000 reviews.
* Identified top-performing products for targeted marketing campaigns.

This new "engine" takes the core logic from those findings and refactors it into a library of modular, reusable, and documented SQL scripts, demonstrating an engineering approach to creating scalable analytical assets.

## Technologies Used

- **Cloud / Database:** Google BigQuery
- **Language:** SQL

## Toolkit Modules

This engine contains the following analytical modules, located in the `sql_modules` folder:

### `01_clv_analysis.sql`
- **Purpose:** Quantifies the business impact of customer retention by calculating the Customer Lifetime Value (CLV) of new versus repeat buyers from a dataset of over 96,000 customers.
- **Usage:** This script can be executed directly in BigQuery to generate a report on the value of customer retention, proving that repeat buyers have significantly higher CLV.

### `02_review_score_monitoring.sql`
- **Purpose:** Analyzes over 95,000 customer reviews to identify the root causes of customer satisfaction changes.
- **Usage:** Can be used to diagnose performance drops by correlating review scores with operational data like shipping times, which was used to identify late deliveries as a primary driver of low scores.

### `03_parameterized_hero_products.sql`
- **Purpose:** A parameterized and reusable script to identify the top 'M' performing products within the top 'N' highest-revenue product categories.
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
