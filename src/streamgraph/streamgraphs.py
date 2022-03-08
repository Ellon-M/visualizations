# Stream Graphs- In contrary to stacked area plots, areas are displaced around the central axis, and the edges are rounded.
#There's no specific function to create these graphs in either matplotlib or plotly.

np.random.seed(19680801)

def gaussian_mixture(x, n=3):
    """Return a random mixture of *n* Gaussians, evaluated at positions *x*."""
    def add_random_gaussian(a):
        amplitude = 1 / (.1 + np.random.random())
        dx = x[-1] - x[0]
        x0 = (2 * np.random.random() - .5) * dx
        z = 10 / (.1 + np.random.random()) / dx
        a += amplitude * np.exp(-(z * (x - x0))**2)
    a = np.zeros_like(x)
    for j in range(n):
        add_random_gaussian(a)
    return a

x2 = np.linspace(0, 100, 101)
y_val = [y1, y2, y3, y4]
y = [gaussian_mixture(x2) for _ in y_val]


fig, ax = plt.subplots(figsize=(10, 7))
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
ax.stackplot(x2, y, colors=['dodgerblue', 'firebrick', 'springgreen', 'rebeccapurple'], baseline="sym")
ax.axhline(0, color="black", ls="--")
box = ax.get_position()
ax.set_position([box.x0, box.y0 + box.height * 0.1,
                 box.width, box.height * 0.9])
plt.legend(loc='upper center',  bbox_to_anchor=(0.5, -0.12), ncol=5, fancybox=True, shadow=True, handles = [breast_patch, back_patch, butter_patch, medley_patch])
plt.show()

