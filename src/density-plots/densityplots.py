# Density (KDE) plots

import pandas as pd
import numpy as np
import matplotlib.cm as cmp
import matplotlib.colors as cl
import matplotlib.pyplot as plt
import plotly.express as px
import plotly.graph_objects as go



#matplotlib 
#- don't use. Its extremely hard to visualise these plots accurately with most data.
# However they can be implemented to some degree
s = np.random.normal(2, 3, 1000)
count, bins, ignored = plt.hist(s, 30, density=True, histtype='step') # increase bins to normalize edges
plt.plot(bins, 1/(3 * np.sqrt(2 * np.pi)) * np.exp( - (bins - 2)**2 / (2 * 3**2) ),
linewidth=2, color='r')
plt.show()


# seaborn kdeplots
fig = plt.subplots(1, figsize=(20,12))
sns.kdeplot(data=event_count_summer, x="Event", color='orange', bw=0.1).set(
            title='\nSUMMER OLYMPIC EVENTS \nOVER THE GENERATIONS\n'
            )
plt.show()


# stacked kdeplots
fig = plt.subplots(1, figsize=(20,12))
sns.kdeplot(data=all_events_count, x="Event", hue="Season", fill=True, palette="rocket_r", bw=0.1, common_grid=True).set(
            title='\nSUMMER OLYMPIC EVENTS \nOVER THE GENERATIONS\n'
            )
plt.show()


# plotly
# Plotly distplots are basically just histograms with a density estimate curve, smoothed by a gaussian function.
import plotly.figure_factory as ff
x1 = np.random.randn(200) - 2
x2 = np.random.randn(200
hist_data = [x1, x2]
group_labels = ['Group 1', 'Group 2']


fig = ff.create_distplot(hist_data, group_labels, bin_size=.2)
fig.update_layout(title_text='Distplot with Kernel Density Estimation Distribution')
fig.show()


# the kde can be overriden to plot a normal curve instead
x1 = np.random.randn(200)
x2 = np.random.randn(200) + 2

group_labels = ['Group 1', 'Group 2']

colors = ['slategray', 'magenta']

# Create distplot with curve_type set to 'normal'
fig = ff.create_distplot([x1, x2], group_labels, bin_size=.5,
                         curve_type='normal', # override default 'kde'
                         colors=colors)

# Add title
fig.update_layout(title_text='Distplot with Normal Distribution')
fig.show()



# if you only want to see the curve, you can hide the histogram by setting showHist to False

x1 = np.random.randn(200) - 1
x2 = np.random.randn(200)
x3 = np.random.randn(200) + 1

hist_data = [x1, x2, x3]

group_labels = ['Group 1', 'Group 2', 'Group 3']
colors = ['#333F44', '#37AA9C', '#94F3E4']

fig = ff.create_distplot(hist_data, group_labels, show_hist=False, colors=colors)
fig.show()



# Important reminder to read and interpret distribution plots correctly Histograms are not bar graphs Kdeplots are not line graphs



