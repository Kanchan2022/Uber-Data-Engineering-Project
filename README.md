# End-to-End Analytics Platform Using NYC TLC Trip Data
## Overview

This project is an end-to-end data engineering pipeline built to support analytics at scale. It uses publicly available NYC Taxi & Limousine Commission (TLC) trip data (Yellow-taxi Oct'2025) to ingest, transform, and model data for analytics.

The pipeline is designed with modular components and analytics-optimized data models to support scalable querying and business intelligence use cases.

Data source: 
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

Data dictionary: 
https://www.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf

## Architecture

Flow:
Data Ingestion → Transformation & Modeling → Orchestration (Mage) → BigQuery → Analytics (SQL & Looker Studio)

![architecture](https://github.com/user-attachments/assets/6eb0b303-fd61-4ca2-86ce-c0463f80e213)

## Data Model

Star schema optimized for analytics:

Fact table: trip-level metrics (fare, distance, taxes, totals)

Dimensions: datetime, passenger count, trip distance, rate code, pickup & drop locations, payment type

![Star Schema Data Model](https://github.com/user-attachments/assets/4cc37379-3255-40f8-9b34-768f0cbed24e)

## Analytics Examples

1. Top pickup locations by trip volume
2. Trips by passenger count
3. Average fare by hour of day
4. Fare component breakdowns
