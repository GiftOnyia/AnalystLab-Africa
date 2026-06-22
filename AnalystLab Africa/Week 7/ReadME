# weather_etl.py — README

**Weather ETL Pipeline | AnalystLab Africa Internship — Week 7**
**Author:** Gift Nkiruka Onyia | **Date:** June 2026

---

## 1. File Overview

`weather_etl.py` is a self-contained Python script that implements a four-stage ETL (Extract → Transform → Load → Analyse) pipeline for real-time weather data. It connects to the OpenWeather API, collects weather information for five global cities, cleans and structures the data with Pandas, exports it to CSV, and prints a short analytical summary to the console.

| Detail | Value |
|---|---|
| File | weather_etl.py |
| Language | Python 3 |
| Environment | Google Colab (also runs locally) |
| Output | weather_report.csv |
| API | OpenWeatherMap Current Weather API |
| Cities | London, New York, Tokyo, Paris, Lagos |
| Author | Gift Nkiruka Onyia |
| Project | AnalystLab Africa Internship — Week 7 |

---

## 2. Dependencies

All libraries are pre-installed in Google Colab. For a local environment, install with:

```bash
pip install requests pandas
```

| Library | Type | Purpose |
|---|---|---|
| requests | Third-party | Send HTTP GET requests to the OpenWeather API |
| pandas | Third-party | Create DataFrame, transform data, export to CSV |
| datetime | Standard | Convert Unix timestamps to readable date strings |
| os | Standard | File system utilities |
| json | Standard | JSON parsing support |

---

## 3. Configuration

Three variables at the top of the script control all runtime behaviour:

```python
API_KEY  = ""
BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
cities   = ['London', 'New York', 'Tokyo', 'Paris', 'Lagos']
```

To change the cities, edit the `cities` list. Any valid city name accepted by the OpenWeather API can be added. The API key is tied to a free-tier OpenWeatherMap account and supports up to 1,000 calls/day.

---

## 4. How to Run

### Option A — Google Colab (recommended)

1. Open a new notebook at [colab.research.google.com](https://colab.research.google.com)
2. Upload `weather_etl.py`, or paste the code into a cell
3. Run all cells (**Runtime → Run all**)
4. Download `weather_report.csv` from the Files panel on the left

### Option B — Local Machine

```bash
# 1. Install dependencies
pip install requests pandas

# 2. Run the script
python weather_etl.py

# 3. Output file is created in the same directory
# → weather_report.csv
```

> **Note:** New OpenWeather API keys can take up to 2 hours to activate after account creation. If you receive a `401 Unauthorized` error, wait and retry.

---

## 5. Script Walkthrough

### Stage 1 — Extract

The script loops through the `cities` list and calls the OpenWeather API once per city. The API key and `units=metric` are passed as query parameters so temperatures are returned in Celsius.

```python
params = {"q": city, "appid": API_KEY, "units": "metric"}
response = requests.get(BASE_URL, params=params)
response.raise_for_status()  # raises exception on 4xx / 5xx
```

A `try/except` block catches `RequestException` (network/HTTP errors) and `KeyError` (missing fields). Failed cities are printed and skipped without stopping the loop.

---

### Stage 2 — Transform

Six fields are extracted from each JSON response. The Unix timestamp from `data["dt"]` is converted to a human-readable string:

```python
date_time = datetime.fromtimestamp(data["dt"]).strftime("%Y-%m-%d %H:%M:%S")
```

The list of dictionaries is passed to `pd.DataFrame()` to produce a clean tabular structure.

| Column | Source Field | Type |
|---|---|---|
| City Name | `data["name"]` | str |
| Temperature (°C) | `data["main"]["temp"]` | float |
| Humidity (%) | `data["main"]["humidity"]` | int |
| Weather Condition | `data["weather"][0]["description"]` | str |
| Wind Speed (m/s) | `data["wind"]["speed"]` | float |
| Date and Time | `datetime.fromtimestamp(data["dt"])` | str |

---

### Stage 3 — Load

The DataFrame is exported to CSV with a single line:

```python
df.to_csv("weather_report.csv", index=False)
```

`index=False` prevents Pandas from writing the row number as an extra column. The output file is immediately compatible with Excel, Power BI, Tableau, and any Python/R workflow.

---

### Stage 4 — Analyse

Three analytical queries run on the DataFrame and print to the console:

- **Temperature table** — all cities and their °C values
- **Most humid city** — identified with `df.loc[df['Humidity (%)'].idxmax()]`
- **Conditions table** — side-by-side weather descriptions for all cities

---

## 6. Output File — weather_report.csv

The script produces one output file with a header row and one data row per city.

```
City Name,Temperature (°C),Humidity (%),Weather Condition,Wind Speed (m/s),Date and Time
London,22.78,70,Overcast clouds,4.02,2026-06-17 17:51:45
New York,24.86,54,Scattered clouds,3.13,2026-06-17 17:49:49
Tokyo,20.62,90,Heavy intensity rain,4.28,2026-06-17 17:55:00
Paris,31.06,38,Scattered clouds,0.89,2026-06-17 17:56:00
Lagos,26.21,82,Overcast clouds,2.49,2026-06-17 17:54:03
```

---

## 7. Key Findings

| City | Temp (°C) | Humidity (%) | Condition | Wind (m/s) |
|---|---|---|---|---|
| London | 22.78 | 70 | Overcast clouds | 4.02 |
| New York | 24.86 | 54 | Scattered clouds | 3.13 |
| Tokyo | 20.6 | 90 | Heavy intensity rain | 4.28 |
| Paris | 31.06 | 38 | Scattered clouds | 0.89 |
| Lagos | 26.21 | 82 | Overcast Clouds | 2.49 |

- **Hottest city:** Paris at 31.4 °C — driven by its equatorial West African climate
- **Coolest city:** Tokyo at 20.6 °C — typical northern European June conditions
- **Most humid:** Tokyo at 90% — coastal tropical location
- **Least humid:** Paris at 38% — moderate continental summer
- **Conditions:** Every city recorded a different weather condition simultaneously — demonstrating the value of multi-location data collection

---



*weather_etl.py — AnalystLab Africa Internship Week 7 | Gift Nkiruka Onyia | June 2026*
