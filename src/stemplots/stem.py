# stem plot

plt.rcParams["figure.figsize"] = (10,6)

x = np.linspace(0.1, 2 * np.pi, 41)
y = np.exp(np.sin(x))
markerline, stemlines, baseline = plt.stem(
    x, y, linefmt='r:', markerfmt='D', bottom=1.1)
markerline.set_markerfacecolor('red')
plt.show()
