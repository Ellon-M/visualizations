# treemaps

import pandas as pd
import numpy as np
import matplotlib.cm as cmp
import matplotlib.colors as cl
import matplotlib.pyplot as plt
import warnings
import squarify

cmap_summer = cmp.get_cmap('Wistia')
cmap_winter = cmp.get_cmap('cool')
min_count = min(canada_medal_count['Medal'])
max_count = max(canada_medal_count['Medal'])
norm = cl.Normalize(vmin=min_count, vmax=max_count)
colors = [cmap_winter(norm(value)) if (pd.Series(canada_medal_count[canada_medal_count.index.get_level_values(0) == cnt].index.get_level_values(1)).str.contains("Winter") == True).any() else cmap_summer(norm(value)) for cnt, value in enumerate(canada_medal_count['Medal'])]
labels = ["%s\n%s Medals" % (label) for label in zip(canada_medal_count['Year'], canada_medal_count['Medal'])]

fig = plt.figure(figsize=(50, 30))
ax = fig.add_subplot(111, aspect='auto')
ax = squarify.plot(canada_medal_count['Medal'], color=colors, label=labels, alpha=.8, text_kwargs={'fontsize':27, 'fontweight': 'bold'})
ax.set_title("Winter vs Summer Olympic medals, Canada")
plt.title("WINTER vs SUMMER OLYMPIC MEDALS, CANADA)",
          fontsize=49,
          color= 'rebeccapurple',
          pad=40,
          loc="center")
ax.xaxis.set_visible(False)
ax.yaxis.set_visible(False)
ax.spines['left'].set_visible(False)
ax.spines['bottom'].set_visible(False)
ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)
ax.tick_params(axis='x', colors="rebeccapurple", size=13)
ax.tick_params(axis='y', colors="rebeccapurple", size=13)

img = plt.imshow(medal_count_arr, cmap=cmap_summer)

img_w = plt.imshow(medal_count_arr, cmap=cmap_winter)
img.set_visible(True)
img_w.set_visible(True)
cax = fig.add_axes([ax.get_position().x1+0.03, ax.get_position().y0, 0.02, ax.get_position().height])
cax_w = fig.add_axes([ax.get_position().x1+0.08, ax.get_position().y0, 0.02, ax.get_position().height])
cax_w.tick_params(axis='y', colors="rebeccapurple", size=13, labelsize=30)
cax.tick_params(axis='y', colors="rebeccapurple", size=13, labelsize=30)

fig.colorbar(img, orientation="vertical", shrink=.96, cax=cax)
fig.colorbar(img_w, orientation="vertical", shrink=.96, cax=cax_w)
fig.text(.76, .89, "Summer", fontsize=30, color="orange")
fig.text(.82, .89, "Winter", fontsize=30, color="rebeccapurple")
# plt.savefig("treemap_canada.png")

plt.show()


