# isotype

!pip install  pywaffle
from pywaffle import Waffle
import matplotlib.pyplot as plt

data = {"Democratic": 48, "Republican": 46, "Libertarian": 3}
fig = plt.figure(
    figsize=(10,10),
    FigureClass=Waffle,
    rows=5,
    values=data,
    colors=["#232066", "#983D3D", "#DCB732"],
    legend={"loc": "upper left", "bbox_to_anchor": (1, 1)},
    icons="child",
    font_size=12,
    icon_legend=True,
)
plt.show()
