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
a, bins, c = plt.hist(x, bins=10, label='Event count - over time', rwidth=0.96, histtype='step') #hist first
l=list(bins)
l.insert(0,0)
l.insert(len(bins)+1,bins[len(bins)-1])
mid=[]
for i in range(len(l)-1):
      ele=(l[i]+l[i+1])/2
      mid.append(ele)
x=list(a)
x.insert(0,0)
x.insert(len(a)+1,0)
plt.plot(mid,x,'go--', color='r')
plt.title('\nSUMMER OLYMPIC EVENTS \nOVER THE GENERATIONS\n', fontsize=44)


