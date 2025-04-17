# Sales Analysis Database
This repository contains SQL scripts for analyzing sales data. It includes queries for categorizing time of day, extracting day and month names, and performing various analyses on sales, products, and customer demographics.  

## Files
walmert.sql: Contains SQL commands for data manipulation and analysis on the sales table.  
## Database Schema
Tables  
sales  
Time: Time of the sale.  
Date: Date of the sale.  
City: City where the sale occurred.  
Branch: Branch where the sale occurred.  
Product line: Category of the product sold.  
Payment: Method of payment used.  
Customer type: Type of customer .  
Quantity: Number of products sold.  
Total: Total amount of the sale.  
COGS: Cost of goods sold.  
Tax 5%: Tax applied to the sale.  
Rating: Customer rating for the sale.  
## SQL Queries
Time of Day Categorization  
Add Time of Day Column  
Update Time of Day Based on Sale Time  
Select Time of Day with Sales  
Day Name Extraction  
Add Day Name Column  
Update Day Name Based on Sale Date  
Select Day Name with Sales  
Month Name Extraction  
Add Month Name Column  
Update Month Name Based on Sale Date  
Select Month Name with Sales  
Generic Insights  
Get Unique Cities  
Get City with Branch Information  
## Product Analysis  
Count Distinct Product Lines  
Identify Most Common Payment Method  
Analyze Most Selling Product Line  
Calculate Total Revenue by Month  
Find Month with Highest COGS  
Identify Product Line with Highest Revenue  
Calculate City with Highest Revenue  
Determine Product Line with Highest VAT  
Identify Branches Selling More Than Average Quantity  
Analyze Most Common Product Line by Gender  
Calculate Average Rating per Product Line  
## Sales Analysis  
Sales by Time of Day on Sunday  
Identify Customer Type with Highest Revenue  
Calculate City with Highest VAT  
Identify Customer Type with Highest VAT  
## Customer Analysis
Get Unique Customer Types  
Get Unique Payment Methods  
Identify Most Common Customer Type  
Analyze Most Common Gender  
Gender Distribution per Branch  
## Rating Analysis
Time of Day with Highest Ratings  
Ratings per Branch by Time of Day  
Best Average Rating Day  
Best Average Rating per Branch  
## Usage
Set Up the Database:  
Run the commands in walmert.sql to add the necessary columns and analyze the data.  
## Execute Queries:
Use the provided SQL queries to extract insights and perform analyses on the sales data.  
