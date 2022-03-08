# world countries

# population estimation
import matplotlib.pyplot as plt

world = geopandas.read_file(geopandas.datasets.get_path('naturalearth_lowres'))

fig, ax = plt.subplots(1, 1)
world.plot(column='pop_est', ax=ax, legend=True)
