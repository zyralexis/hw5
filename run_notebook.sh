#!/bin/bash
# Run the ESG Analysis notebook
# Usage: ./run_notebook.sh   (or: bash run_notebook.sh)

cd "$(dirname "$0")"

# Use venv if present
if [ -d ".venv" ]; then
  source .venv/bin/activate
fi

# Optional: set your LSEG App Key so the notebook can fetch live data
# export LSEG_APP_KEY="your_key_here"

# Start Jupyter so you can open and run the notebook in your browser
echo "Starting Jupyter. Open: ESG_Analysis_Notebook.ipynb"
echo "Press Ctrl+C to stop the server."
jupyter notebook "ESG_Analysis_Notebook.ipynb"
