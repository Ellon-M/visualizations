# gantt charts

import plotly.express as px
import pandas as pd

df = pd.DataFrame([
    dict(Task="Job A", Start='2009-01-01', Finish='2009-02-28', Completion_pct=50),
    dict(Task="Job B", Start='2009-03-05', Finish='2009-04-15', Completion_pct=25),
    dict(Task="Job C", Start='2009-02-20', Finish='2009-05-30', Completion_pct=75),
    dict(Task="Job D", Start='2009-03-30', Finish='2009-05-01', Completion_pct=18),
    dict(Task="Job E", Start='2009-02-01', Finish='2009-05-30', Completion_pct=55),
    dict(Task="Job F", Start='2009-02-20', Finish='2009-04-20', Completion_pct=50),
    dict(Task="Job G", Start='2009-05-01', Finish='2009-05-30', Completion_pct=33),
    dict(Task="Job H", Start='2009-01-31', Finish='2009-06-01', Completion_pct=40),
])

fig = px.timeline(df, x_start="Start", x_end="Finish", y="Task", color="Completion_pct",template = "gridon", color_continuous_scale='picnic')
fig.update_yaxes(autorange="reversed")
fig.show()
