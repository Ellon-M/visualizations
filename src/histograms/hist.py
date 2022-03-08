# histograms

# visualizes distributions of partiular variables:

import pandas as pd
import numpy as np
import matplotlib.cm as cmp
import matplotlib.colors as cl
import matplotlib.pyplot as plt
import plotly.express as px
import plotly.graph_objects as go

# matplotlib
fig, ax = plt.subplots(1, figsize=(24,15))
x = np.array(event_count_summer['Event'])
ax.tick_params(axis='x', colors='brown', labelsize=30)
ax.tick_params(axis='y', colors='brown', labelsize=30)
plt.hist(x, bins=10, label='Event count distribution', rwidth=0.96, color='xkcd:orange', density=True)
plt.legend(prop={'size': 36},  shadow=True)
plt.title('\nSUMMER OLYMPIC EVENTS \nOVER THE GENERATIONS\n', fontsize=44)
plt.show()


# seaborn, cause why not
import seaborn as sns

fig = sns.displot(x, bins=11, kde=True, height=8.27, aspect=11.7/8.27, color='orange',
            shrink=0.96
           ).set(
            title='\nSUMMER OLYMPIC EVENTS \nOVER THE GENERATIONS\n'
            )
plt.show()


# plotly
fig = px.histogram(event_count_summer, x="Event", title="SUMMER OLYMPIC EVENTS OVER THE GENERATIONS", nbins=10, template = "seaborn", color_discrete_sequence=['orangered'])
fig.update_layout(bargap=0.1)
fig.show()


#plotly histograms with marginals
fig = px.histogram(event_count_winter, x="Event", title="WINTER OLYMPIC EVENTS OVER THE GENERATIONS", nbins=10, template = "plotly_dark", color_discrete_sequence=['azure'], marginal="rug")
fig.update_layout(bargap=0.1)
fig.show()

# plotly - with box-plot
fig = px.histogram(event_count_winter, x="Event", title="WINTER OLYMPIC EVENTS OVER THE GENERATIONS", nbins=10, template = "plotly_dark", color_discrete_sequence=['azure'], marginal="box")
fig.update_layout(bargap=0.1)
fig.show()

# plotly - with violin
fig = px.histogram(event_count_winter, x="Event", title="WINTER OLYMPIC EVENTS OVER THE GENERATIONS", nbins=10, template = "plotly_dark", color_discrete_sequence=['azure'], marginal="violin")
fig.update_layout(bargap=0.1)
fig.show()


