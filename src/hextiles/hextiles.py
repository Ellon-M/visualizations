# hextiles

# holoviews
import numpy as np
import holoviews as hv
from holoviews import opts
from holoviews import dim
hv.extension('bokeh')

np.random.seed(44)
hex_tiles = hv.HexTiles(np.random.randn(100000, 2))
hex_tiles.opts(opts.HexTiles(width=500, height=400, tools=['hover'], colorbar=True))
