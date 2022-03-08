# stacked bars - 

import pandas as pd
import numpy as np
import matplotlib.cm as cmp
import matplotlib.colors as cl
import matplotlib.pyplot as plt
import plotly.express as px


# matplotlib
bar_width = 1
bar_l = np.arange(0, len(x_ticks))
tick_pos = [i + (bar_width / 2) for i in bar_l]

fig, ax = plt.subplots(1, figsize=(24,12))

plt.bar(x_ticks,
        y_b,
        width=1,
        align='edge',
        edgecolor='w',
        linewidth=1.5,
        color='skyblue',
        label='Medals'
        )

plt.bar(x_ticks,
       y_n,
       bottom = y_b,
       width = 1,
        align='edge',
        edgecolor='w',
        linewidth=1.5,
        color='tan',
        label='No Medals'
       )

plt.xticks(tick_pos, x_ticks, fontsize=22)
plt.legend(prop={'size': 20})
plt.title("MEN'S MARATHON - MEDAL PER PERTICIPANT RATIO", fontsize=44)
plt.show()



# plotly
fig = px.bar(marathon_men_focus_df, x='Team',
             hover_data=['Team', 'Medal'], color='Medal',
             labels={'count':'Medal count'}, title='MARATHON MEDALS -\nMALE ATHLETES', text="Medal", color_discrete_map={
        'Gold': 'yellow',
        'Silver': 'silver',
        'Bronze': 'orange'
    },  template = "plotly_white",)
fig.update_layout()
fig.show()

