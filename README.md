# ESG Analysis & Stock Performance

Jupyter notebook for **Lecture 5: Data Preprocessing & Events** (Quantitative Finance). Analyzes how ESG scores relate to stock performance, with **Shopify (SHOP)** as the focus company and other names (AAPL, MSFT, JPM, JNJ, XOM) as peers.

---

## How to run

### 1. Go to the project folder

```bash
cd "/Users/nancy/Desktop/quant finance"
```

### 2. (Optional) Use a virtual environment and install dependencies

```bash
source .venv/bin/activate
pip install -r requirements.txt
pip install jupyter
```

### 3. Set LSEG App Key for live data

**Recommended: use a `.env` file** (keeps the key out of the repo and the notebook):

```bash
cp .env.example .env
# Edit .env and set: LSEG_APP_KEY=your_app_key_here
```

The notebook loads `LSEG_APP_KEY` from `.env` automatically (via `python-dotenv`). **Do not commit `.env`** — it is listed in `.gitignore`.

**Alternatively:** set the environment variable before starting Jupyter:

```bash
export LSEG_APP_KEY="your_app_key_here"
```

If you skip this, the notebook uses **simulated ESG data** and **placeholder returns**.

### 4. Open and run the notebook

**From terminal (Jupyter in browser):**

```bash
jupyter notebook ESG_Analysis_Notebook.ipynb
```

Then in the browser: **Cell → Run All**.

**From Cursor / VS Code:**

1. Open `ESG_Analysis_Notebook.ipynb`.
2. Select the Python kernel (e.g. `.venv`).
3. Click **Run All** or run cells with **Shift+Enter**.

**Using the script:**

```bash
chmod +x run_notebook.sh
./run_notebook.sh
```

### 5. Run all cells

Use **Run All** (or run each cell in order). The notebook will load data, preprocess, and show ESG vs stock performance (Shopify vs peers).

---

## What it does

- **Data:** ESG scores (LSEG Refinitiv: TR.TRESGScore, pillars, controversies) and stock prices; fallback to simulated data when LSEG is not configured.
- **Preprocessing (Lecture 5):** Cleaning, missing data (forward fill, interpolation, KNN), outlier detection and winsorization, normalization.
- **Analysis:** Point-in-time aligned ESG vs annual market-relative returns; correlation; OLS regression (ESG → return); conceptual framework (positive ESG vs ESG cost) and limitations.
- **Focus:** Shopify-centered tables and plots; peers used for comparison only.

## Requirements

- Python 3.10+
- See `requirements.txt` (pandas, numpy, matplotlib, seaborn, scipy, scikit-learn, statsmodels; optional: refinitiv-data for LSEG).

## Project layout

| File | Purpose |
|------|--------|
| `ESG_Analysis_Notebook.ipynb` | Main analysis (ESG + returns, preprocessing, regression, interpretation). |
| `requirements.txt` | Python dependencies. |
| `run_notebook.sh` | Optional script to start Jupyter on the notebook. |

## Data and configuration

- **Companies:** SHOP (focus), AAPL, MSFT, JPM, JNJ, XOM. LSEG RICs use exchange suffixes (e.g. SHOP.N, AAPL.O).
- **Date range:** Configurable in the notebook (default 2020–2024).
- **Benchmark:** S&P 500 (`.SPX`) for market-relative returns.

