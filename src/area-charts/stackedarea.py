#Stacked area plots -
#These work in the same way as area graphs do, but they use multiple data series that start each point 
#from the point left by the previous data series. The entire graph represents the total of all data plotted. 
#They are useful, overall, for comparing multiple variables changing over an interval.

#It can be said that they represent the evolution of values of similar groups over a period of time on the same graphic.

import pandas as pd
import numpy as np
import matplotlib.cm as cmp
import matplotlib.colors as cl
import matplotlib.pyplot as plt
import matplotlib.patches as mp
import plotly.graph_objects as go
import plotly.express as px
from scipy import stats

#Matplotlib representation of a stacked area plot

area_labels = ['Breaststroke', 'Backstroke', 'Butterfly', 'Medley']

fig, ax = plt.subplots(figsize=(10, 7))

# patches for the legend
breast_patch = mp.Patch( color ='dodgerblue',
         label ='Breaststroke')
back_patch = mp.Patch(color ='firebrick',
         label ='Backstroke')
butter_patch = mp.Patch(color ='springgreen',
         label ='Butterfly')
medley_patch = mp.Patch(color ='rebeccapurple',
         label ='Medley')

plt.title("MEN'S WEIGHT VARIATION \nFROM 1950 W.R.T DIFFRENT STROKES", fontsize=20,
          color= 'rebeccapurple',
          pad=20,
          loc="center")
plt.xlabel('Games')
plt.ylabel('Weight (in kg)')
ax.stackplot(x, y1, y2, y3, y4, colors=['dodgerblue', 'firebrick', 'springgreen', 'rebeccapurple'])
box = ax.get_position()
ax.set_position([box.x0, box.y0 + box.height * 0.1,
                 box.width, box.height * 0.9])
plt.legend(loc='upper center',  bbox_to_anchor=(0.5, -0.12), ncol=5, fancybox=True, shadow=True, handles = [breast_patch, back_patch, butter_patch, medley_patch])
plt.show()


#Plotly express representation of the above chart

fig = px.area(strokes, x="Year", y="Weight",
              color="Event", title="MEN'S WEIGHT VARIATION \nFROM 1950 W.R.T DIFFRENT STROKES"
	      )
fig.update_layout(
    font_color="rebeccapurple",
    title_font_family="Times New Roman",
    title_font_color="navy",
    legend_title_font_color="rebeccapurple"
)
fig.update_xaxes(title_font_family="Arial")
fig.show()



# Plotly - graph objects

fig = go.Figure()
fig.add_trace(go.Scatter(
    x=strokes['Year'], y=y1,
    hoverinfo='x+y',
    mode='lines',
    line=dict(width=0.5, color='rgb(131, 90, 241)'),
    stackgroup='one',
    name="Breaststroke"
))
fig.add_trace(go.Scatter(
    x=strokes['Year'], y=y2,
    hoverinfo='x+y',
    mode='lines',
    line=dict(width=0.5, color='rgb(111, 231, 219)'),
    stackgroup='one',
    name="Backstroke",
))
fig.add_trace(go.Scatter(
    x=strokes['Year'], y=y3,
    hoverinfo='x+y',
    mode='lines',
    line=dict(width=0.5, color='rgb(184, 247, 212)'),
    stackgroup='one',
    name="Butterfly",
))
fig.add_trace(go.Scatter(
    x=strokes['Year'], y=y4,
    hoverinfo='x+y',
    mode='lines',
    line=dict(width=0.5, color='rgb(144, 200, 272)'),
    stackgroup='one',
    name="Medley"
))

fig.update_layout( title="MEN'S WEIGHT VARIATION \nFROM 1950 W.R.T DIFFRENT STROKES",
    xaxis_title="Games",
    yaxis_title="Weight (kg)",
    legend_title="Strokes",
    font=dict(
#         family="Courier New, monospace",
        size=18,
        color="RebeccaPurple"
    ))

fig.show()




