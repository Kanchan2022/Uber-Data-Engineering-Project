# End-to-End Analytics Platform Using NYC TLC Trip Data
## Overview

This project is an end-to-end data engineering pipeline built to support analytics at scale. It uses publicly available NYC Taxi & Limousine Commission (TLC) trip data (Yellow-taxi Oct'2025) to ingest, transform, and model data for analytics.

Data source:
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

## Architecture

Flow:
Data Ingestion → Transformation & Modeling → Orchestration (Mage) → BigQuery → Analytics (SQL & Looker)

## Data Model

Star schema optimized for analytics:

Fact table: trip-level metrics (fare, distance, taxes, totals)

Dimensions: datetime, passenger count, trip distance, rate code, pickup & drop locations, payment type
This project demonstrates an end-to-end data engineering pipeline using NYC TLC trip data. It covers data ingestion, transformation, star-schema modeling, orchestration with Mage, loading into Google BigQuery, and analytics via SQL and Looker as part of my transition into data engineering.

## Analytics Examples

1. Top pickup locations by trip volume
2. Trips by passenger count
3. Average fare by hour of day
4. Fare component breakdowns

## Key Takeaways

1. Built modular, orchestrated pipelines with Mage
2. Modeled analytics-ready fact & dimension tables
3. Loaded and queried data at scale in BigQuery

## Motivation

This project reflects my transition from analytics toward data engineering, focusing on scalable pipelines and cloud data platforms.
