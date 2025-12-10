# Online Bookstore Data Warehouse Project

A comprehensive end-to-end data warehouse solution for an online bookstore platform, designed to transform operational data into actionable business insights through dimensional modeling, ETL processes, and advanced data analysis.

---

## 📋 Table of Contents

- [Project Overview](#project-overview)
- [Business Case](#business-case)
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Project Scope](#project-scope)
- [Dimensional Modeling](#dimensional-modeling)
- [ETL Pipeline](#etl-pipeline)
- [Data Quality & Cleaning](#data-quality--cleaning)
- [Business Insights](#business-insights)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Stakeholders](#stakeholders)

---

## 📊 Project Overview

This project implements a complete data warehouse infrastructure for an online bookstore that operates exclusively through digital payment channels. The solution extracts data from operational systems (OLTP), transforms it through dimensional modeling, and loads it into a dedicated data warehouse to enable comprehensive business analysis.

**Key Objective**: Provide stakeholders with a unified analytics platform to answer critical business questions regarding sales performance, order fulfillment, customer behavior, and revenue impact.

---

## 💼 Business Case

### The Online Bookstore Operations

Our online bookstore operates with the following business model:

**Order & Payment Policy**
- Exclusive online payment processing at point of sale
- All transactions occur digitally
- Customers receive immediate order receipts upon purchase

**Shipping & Cancellation Policy**
- Customers bear all shipping costs
- Free order cancellations within 12 hours of purchase
- Late cancellations (after 12 hours) incur a shipping cost deduction
- Customers responsible for return shipping costs

---

## 🎯 Key Features

### Business Questions Addressed

The data warehouse is designed to answer the following critical business questions:

1. **Sales Performance** - What is the total sales performance across all channels?
2. **Order Fulfillment** - How many orders were successfully delivered vs. total orders placed?
3. **Revenue Impact** - What is the impact of returns and cancellations on overall revenue?
4. **Product Insights** - Which are the top-selling books, and do they show customer preference patterns?
5. **Seasonality & Growth** - How does revenue trend by month/quarter?
6. **Shipping Preferences** - Which shipping methods do customers prefer (Standard, Express, International)?

---

## 🏗️ Architecture

### Solution Components

The project follows a classic data warehouse architecture:

```
┌─────────────────────────────────────────────────────────┐
│                    OLTP Source Systems                    │
│            (Operational Databases & Transactions)        │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                    ETL Layer (SSIS)                      │
│         Extraction, Transformation & Loading             │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                   Data Warehouse                         │
│            (Dimensional Schema - Star Model)             │
├─────────────────────────────────────────────────────────┤
│  Dimension Tables: Author, Book, Customer, Date, ...    │
│  Fact Tables: Orders, Order Items, Returns, ...         │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                Business Intelligence Layer               │
│          Analytics, Reports & Insights                   │
└─────────────────────────────────────────────────────────┘
```

---

## 📐 Project Scope

### Development Phases

**Phase 1: Business Case & Objectives**
- Understand the strategic need for data warehouse implementation
- Define business requirements and KPIs
- Identify stakeholders and their information needs

**Phase 2: Key Business Questions**
- Document critical business questions
- Define metrics and KPIs for analysis
- Prioritize analytical requirements

**Phase 3: Dimensional Modeling**
- Design OLTP-to-DWH mapping
- Create dimensional model (star schema)
- Define dimensions and fact tables

**Phase 4: ETL Process Implementation**
- Build SSIS packages for data extraction
- Implement transformation logic
- Configure data loading into warehouse

**Phase 5: Data Exploration & Cleaning**
- Identify and handle missing values
- Validate data quality
- Implement data cleansing procedures

**Phase 6: Data Analysis & Insights**
- Perform exploratory data analysis
- Generate business reports
- Deliver actionable insights

---

## 🔧 Dimensional Modeling

### Data Model Architecture

The dimensional model uses a star schema approach with the following components:

**Dimension Tables**

| Dimension | Key Fields | Purpose |
|-----------|-----------|---------|
| **Author** | AuthorID, Name, Biography | Author information & metrics |
| **Book** | BookID, Title, ISBN, Category | Book catalog & attributes |
| **Customer** | CustomerID, Name, Email, Address | Customer demographics |
| **Date** | DateID, Date, Month, Quarter, Year | Temporal analysis |
| **Shipping** | ShippingID, Method, Cost | Shipping preferences & costs |

**Fact Tables**

| Fact Table | Dimensions | Measures | Purpose |
|-----------|-----------|----------|---------|
| **Orders** | Customer, Date, Shipping | OrderID, Amount, Status | Order transactions |
| **Order Items** | Order, Book, Author | Quantity, Price, Discount | Line-item detail |
| **Returns** | Order, Customer, Date | ReturnID, Reason, Cost | Return transactions |
| **Cancellations** | Order, Customer, Date | CancellationID, Fee | Cancellation tracking |

---

## 🔄 ETL Pipeline

### Data Integration Process

The ETL process utilizes **SQL Server Integration Services (SSIS)** to automate data movement and transformation:

**Extraction Phase**
- Connect to source OLTP systems
- Extract Author, Book, Customer, and Transaction data
- Implement incremental load patterns for efficiency

**Transformation Phase**
- Map source columns to dimensional attributes
- Apply business rules and calculations
- Implement Slowly Changing Dimensions (SCD) for dimension tracking
- Calculate derived metrics (revenue, margins, discounts)

**Loading Phase**
- Load dimension tables using surrogate keys
- Populate fact tables with measures
- Maintain referential integrity
- Update aggregated tables

---

## 🧹 Data Quality & Cleaning

### Data Quality Measures

**Missing Values Handling**
- Identify null values in critical fields
- Apply domain-specific imputation strategies
- Document business rules for missing data

**Data Validation**
- Implement referential integrity checks
- Validate data types and formats
- Perform duplicate detection and removal
- Verify calculated fields and aggregations

**Quality Assurance**
- Compare source-to-target record counts
- Validate foreign key relationships
- Implement row count monitoring
- Document data quality metrics

---

## 📈 Business Insights

The data warehouse enables analysis of:

- **Sales Trends** - Monthly, quarterly, and yearly revenue patterns
- **Product Performance** - Top-selling books and author popularity
- **Customer Behavior** - Purchase patterns and preferences by shipping method
- **Order Fulfillment** - Delivery success rates and cancellation impacts
- **Financial Impact** - Revenue correlation with returns and cancellations
- **Seasonality Patterns** - Peak shopping periods and demand cycles

---

## 🛠️ Technologies Used

| Component | Technology |
|-----------|-----------|
| **Source Systems** | OLTP Databases (SQL Server) |
| **ETL Tool** | SQL Server Integration Services (SSIS) |
| **Data Warehouse** | SQL Server Data Warehouse |
| **Data Modeling** | Star Schema (Dimensional Modeling) |
| **Business Intelligence** | SQL Server Analysis Services / Power BI |
| **Query Language** | T-SQL |

---

## 🚀 Getting Started

### Prerequisites

- SQL Server 2016 or higher
- SQL Server Integration Services (SSIS)
- SQL Server Management Studio (SSMS)
- Source database access (OLTP system)
- Appropriate database permissions

### Installation Steps

1. **Prepare Source Systems**
   ```sql
   -- Verify OLTP database connectivity
   SELECT * FROM source_database.INFORMATION_SCHEMA.TABLES
   ```

2. **Create Data Warehouse Database**
   ```sql
   CREATE DATABASE BookstoreDWH;
   ```

3. **Deploy Dimensional Schema**
   - Execute dimension table creation scripts
   - Execute fact table creation scripts
   - Create primary and foreign key relationships

4. **Configure SSIS Packages**
   - Open SSIS project in Visual Studio
   - Configure source and destination connections
   - Validate transformation logic
   - Deploy packages to SSIS catalog

5. **Execute ETL Pipeline**
   ```sql
   -- Run initial load (full refresh)
   EXEC [ETL].[LoadDimensions]
   EXEC [ETL].[LoadFacts]
   ```

6. **Validate Data**
   - Compare row counts between source and warehouse
   - Verify data quality metrics
   - Validate calculated fields

---

## 📁 Project Structure

```
bookstore-dwh/
├── README.md
├── Documentation/
│   ├── Business_Requirements.md
│   ├── Data_Dictionary.md
│   ├── ETL_Specifications.md
│   └── Data_Model_Design.md
├── SQL_Scripts/
│   ├── 01_Create_DWH_Database.sql
│   ├── 02_Create_Dimensions.sql
│   ├── 03_Create_Facts.sql
│   ├── 04_Create_Relationships.sql
│   └── 05_Create_Indexes.sql
├── SSIS_Packages/
│   ├── ETL_Load_Dimensions.dtsx
│   ├── ETL_Load_Facts.dtsx
│   └── ETL_Data_Quality_Check.dtsx
├── Analysis_Queries/
│   ├── Sales_Performance.sql
│   ├── Top_Books.sql
│   ├── Customer_Behavior.sql
│   └── Revenue_Impact.sql
└── Reports/
    ├── Sales_Dashboard.pbix
    ├── Order_Fulfillment_Report.pbix
    └── Customer_Analytics.pbix
```

---

## 👥 Stakeholders

### Key Stakeholders

**Business Stakeholders**
- Sales & Revenue Management
- Operations & Order Fulfillment
- Customer Service
- Executive Leadership

**Technical Stakeholders**
- Data Engineers - ETL pipeline development and maintenance
- Data Analysts - Analytics and insight generation
- Database Administrators - Infrastructure and performance optimization

---

## 📝 License

This project is provided as an educational and professional data warehouse implementation example.

---

## 📧 Contact & Support

For questions, issues, or contributions related to this data warehouse project, please contact the project team or submit an issue through the repository.

---

## 🙏 Acknowledgments

This project represents a complete implementation of data warehouse concepts including dimensional modeling, ETL best practices, data quality standards, and business intelligence delivery. The online bookstore scenario demonstrates real-world application of data engineering principles in a modern e-commerce environment.

---

**Last Updated**: December 2025  
**Project Version**: 1.0  
**Status**: Production-Ready
