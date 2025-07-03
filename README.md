# Trading Framework

This project provides a skeleton for an automated stock trading system using
Python and Cython for performance. Market data is fetched via REST APIs, and the
processing pipeline is structured as follows:

1. **Data Fetcher** – Retrieves raw market data from an API.
2. **Preprocessor** – Parses JSON or XML data into Python objects.
3. **Analysis Modules** – Cython modules performing technical analysis.
4. **Aggregator** – Collects results from analysis modules.
5. **Decision Maker** – Determines buy/sell/hold decisions.
6. **Trade Executor** – Executes trades (stub for brokerage integration).

The Cython sources are located under `trading/cy` so that compiled
extensions remain separate from pure Python modules.

Cython extensions can be compiled with `pip` since the project now uses a
`pyproject.toml` based build. Install Cython and build the package in-place:

```bash
pip install cython
pip install -e .
```

Run the example:

```bash
python -m trading.main
```

The example fetches data from a REST endpoint. If the request fails, mock price
data is used instead. Analysis results are aggregated and a trade decision is
printed to stdout.
