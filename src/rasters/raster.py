# raster

# holoviews
import numpy as np
import holoviews as hv
hv.extension('bokeh')

xvals = np.linspace(0,4,202)
ys,xs = np.meshgrid(xvals, -xvals[::-1])
hv.Raster(np.sin(((ys)**3)*xs))
