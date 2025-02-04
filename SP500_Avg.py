import numpy as np
import pandas as pd

df = pd.read_csv('sp500ret.csv')

averages = []
idx = 0
while (idx < len(df)):
    new_idx = idx + 12
    data = df['vwretd'][idx : new_idx]
    averages.append(data.mean())
    idx = new_idx

print(averages)
print(len(averages))
