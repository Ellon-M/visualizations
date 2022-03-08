# fancharts - BOE style
from twopiece.scale import tpnorm
import numpy as np
import matplotlib.ticker as ticker
import matplotlib.dates as mdates

def fan(data, p):
    """Given mode, median, mean, uncertainty, and skewness by date,
    and a set of quantiles, returns the values of a two-piece normal
    distribution at each quantile.
    """
    results = np.zeros((data.shape[0], len(p)))
    for index, _ in enumerate(results):
        mode = data["Mode"][index]
        sigma = data["Uncertainty"][index]
        gamma = data["Skewness"][index]
        dist = tpnorm(loc=mode, sigma=sigma, gamma=gamma, kind="boe")
        results[index] = dist.ppf(p)
    results = pd.DataFrame(results, columns=p, index=data["Date"])
    results = results.sort_index()
    return results


p = [0.05, 0.20, 0.35, 0.65, 0.80, 0.95]
fcast = fan(cpi_future, p=p)
# Now we extend the dataframe by one entry--the known values of the last outturn.
fcast = fcast.append(
    pd.DataFrame(
        [[hist_cpi["CPI"].iloc[-1]] * len(p)],
        index=[hist_cpi["Date"].iloc[-1]],
        columns=p,
    )
).sort_index()

# This is the fan part, using 'fill_between'
fig, ax = plt.subplots(figsize=(9, 5))
n_bands = int(np.floor(len(fcast.columns) / 2))
for i in range(n_bands):
    # Choose alpha in a range of values
    alpha = 0.5 * (i + 1) / n_bands
    # Fill in colour between bands (ie between each 'fan')
    ax.fill_between(
        fcast.index,
        fcast[fcast.columns[i]],
        fcast[fcast.columns[-i - 1]],
        color="xkcd:tomato red",
        alpha=alpha,
        zorder=1,
    )

# Plot historical data
ax.plot(hist_cpi["Date"], hist_cpi["CPI"], color="red", lw=1.5, zorder=3)
# Show inflation target
ax.axhline(y=2.0, color="k", lw=2, zorder=2)
# Grey background for forecast area
ax.axvspan(fcast.index[0], fcast.index[-1], facecolor="grey", alpha=0.2, zorder=0)


# The rest is just dressing: ie other decorations in
# Inflation Report/Monetary Policy Report style
ax.grid(False, which="both")
for spine_loc in ["bottom", "left", "right", "top"]:
    ax.spines[spine_loc].set_color("k")
    ax.spines[spine_loc].set_linewidth(3)
ax.yaxis.set_label_position("right")
ax.xaxis.set_minor_locator(mdates.MonthLocator((1, 4, 7, 10)))
ax.yaxis.set_major_locator(ticker.MultipleLocator(1.0))
ax.tick_params(
    labelbottom=True,
    labeltop=False,
    labelleft=True,
    labelright=True,
    bottom=True,
    top=False,
    left=True,
    right=True,
    direction="in",
    which="both",
)
ax.tick_params(which="major", width=3, length=10, color="k")
ax.tick_params(which="minor", width=3, length=5, color="k")
ax.set_title(
    "Percentage increase in prices on a year earlier", loc="right", fontsize=18
)
ax.set_ylim(-3, 7)
plt.show()
