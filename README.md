# Exploratory-Sales-Performance-Analysis-for-Gamezone

## Executive Summary
This project analyzes transactional and customer data from a fictional e-commerce company, GameZone and focuses on understanding overall performance of the company over a period of two years. to identify insights that can support strategic decision-making.

## About the company
Founded in 2018, Gamezone sells new and refurbished gaming products all around the world. They have online websites, mobile apps and a variety of other marketing channels.


## Dataset Overview
-> Two files: Orders, Region
-> Over 21,000 transactions (2019–2021)


## Data Cleaning Summary

The dataset required several transformations to ensurereliability:

-> Removed duplicate rows (43 duplicate transactions).

-> Standardized inconsistent product names.

-> Retained transactions with missing purchase dates since other columns contained useful information.

-> Excluded transactions with blank or zero-dollar prices to maintain revenue accuracy (0.15 percent of all transactions).

-> Reclassified missing country codes as "Unknown" after evaluating imputation reliability (0.17 percent of rows).

-> Added validation checks for records where ship date precedes purchase date (approximately 10 percent).

-> Cleaned region mappings (matching correct regions to country)

-> Added purchase year and month fields for easier time-based analysis.




## Key Insights
### 1. Sales Performance

-> Total revenue (2019–2021): $6.1M

-> 2020 was the strongest year, with a 163% increase from 2019

-> Q4 consistently delivered the highest revenue

-> Average Order Value: 283.10

Implication:
GameZone’s growth shows clear seasonality. Peak months should be prioritized for marketing, inventory planning, and promotional activities.

### 2. Product 

-> Top 3 products contributed ~84% of all revenue, led by the 27in 4K Gaming Monitor

-> Accessories generated low revenue but have strong bundling potential

-> Lenovo IdeaPad Gaming 3 showed stable year-over-year growth

-> Cross-selling and upselling opportunities are significant

Implication:
Refining the product strategy could diversify revenue and increase customer value.

### 3. Regional Insights

-> North America generated ~50% of total revenue

-> EMEA contributed ~30%, followed by APAC and LATAM

-> Strong performance in the US, UK, Canada, Australia, and Germany

Implication:
EMEA and APAC offer expansion opportunities. Heavy reliance on North America poses concentration risk.

### 4. Marketing Channel Insights

-> Direct channel generated 84% of total revenue

-> Email contributed 10%

-> Affiliate and Social Media channels remain underutilized

Implication: 
Gamezone can improve reach and acquisition by optimizing non-direct marketing channels.

## Skills

- SQL (PostgreSQL)

- Data Cleaning & Transformation

- Exploratory Data Analysis

- Business Insight Generation

- Trend Analysis

- Reporting & Documentation

## Author

Gayathri K

