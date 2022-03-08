import pandas as pd
import numpy as np
import matplotlib.cm as cmp
import matplotlib.colors as cl
import matplotlib.pyplot as plt
import warnings
import squarify

# matplotlib
cmap_ages = cmp.get_cmap('YlOrBr')
fig, ax = plt.subplots(figsize=(10,60))
im = ax.imshow(age_values, cmap = cmap_ages)

ax.set_xticks(np.arange(len(trimmed_ages.index.get_level_values('Games').unique())))
ax.set_yticks(np.arange(len(trimmed_ages.index.get_level_values('Team').unique())))
ax.set_xticklabels(trimmed_ages.index.get_level_values('Games').unique())
ax.set_yticklabels(trimmed_ages.index.get_level_values('Team').unique())
ax.tick_params(axis='x', colors="rebeccapurple", size=6)
ax.tick_params(axis='y', colors="rebeccapurple", size=6)
ax.spines['left'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
plt.title("AVERAGE AGE OF THE TOP 4 MOST REPRESENTED TEAMS \n (OVER 3 GENERATIONS OF GAMES)",
          fontsize=20,
          color= 'rebeccapurple',
          pad=20,
          loc="center")

plt.xticks(fontsize=15)
plt.yticks(fontsize=15)
plt.setp(ax.get_xticklabels(), rotation=45, ha='right', rotation_mode='anchor')

cax = fig.add_axes([ax.get_position().x1+0.15, ax.get_position().y0, 0.05, ax.get_position().height])
fig.colorbar(im, orientation="vertical", shrink=.96, cax=cax)

cax.tick_params(axis='x', colors="rebeccapurple", size=10)
cax.tick_params(axis='y', colors="rebeccapurple", size=10)


for i in range(len(trimmed_ages.index.get_level_values('Team').unique())):
    for j in range(len(trimmed_ages.index.get_level_values('Games').unique())):
        text = ax.text(j, i, f'{np.round(age_values[i, j], 2)} years', ha="center", va="center", color="w", fontsize=20)
fig.tight_layout()
plt.show()



