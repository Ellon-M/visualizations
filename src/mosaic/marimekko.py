# mosaic/marimekko charts
# Marimekko: Commonly referred to as Mosaic plots; spine plots or just Mekko.

# In essence, they are just stacked bar charts where the bar widths are used to display another variable - usually the group's proportion to the total.

import pandas as pd
import numpy as np
import matplotlib.cm as cmp
import matplotlib.colors as cl
import matplotlib.pyplot as plt
import plotly.express as px

from statsmodels.graphics.mosaicplot import mosaic

fig, ax = plt.subplots(figsize=(20, 14))
props = {}
props[('United States', 'Gold')] = {'facecolor': 'xkcd:gold',
                       'edgecolor':'xkcd:light grey',
                       'hatch':'o'}
props[('Japan', 'Gold')] = {'facecolor': 'salmon',
                       'edgecolor':'xkcd:light grey',
                       'hatch':'o'}
props[('Kenya', 'Gold')] = {'facecolor': 'lightgreen',
                       'edgecolor':'xkcd:light grey',
                       'hatch':'o'}
props[('Ethiopia', 'Gold')] = {'facecolor': 'xkcd:aqua',
                       'edgecolor':'xkcd:light grey',
                       'hatch':'o'}
props[('Portugal', 'Gold')] = {'facecolor': 'xkcd:pink',
                       'edgecolor':'xkcd:light grey',
                       'hatch':'o'}
props[('Japan', 'Silver')] = {'facecolor': 'coral',
                       }
props[('Kenya', 'Silver')] = {'facecolor': 'green',
                      }
props[('Ethiopia', 'Silver')] = {'facecolor': 'black',
                       }
props[('United States', 'Bronze')] = {'facecolor': 'xkcd:khaki',

                       }
props[('Japan', 'Bronze')] = {'facecolor': 'crimson',
                       }
props[('Kenya', 'Bronze')] = {'facecolor': 'xkcd:lime',
                      }
props[('Ethiopia', 'Bronze')] = {'facecolor': 'xkcd:azure',
                       }
props[('Portugal', 'Bronze')] = {'facecolor': 'orchid',
                       }
ax.tick_params(axis='x', colors="black", size=30, labelsize=21)
ax.tick_params(axis='y', colors="black", size=20, labelsize=21)
plt.rcParams.update({'font.size': 27})
mosaic(marathon_women_mosaic, ["Team", "Medal"], gap=0.015, ax=ax, properties=props)
plt.title("Marathon Medals - Female Athletes", fontsize = 36)
plt.show()


# The bar widths here represent the volume/number of medals won by each specific Nation/Team; something that regular stacked bars cannot visualize.
