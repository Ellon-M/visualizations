# pyramid

fig, ax = plt.subplots()
group_col = "Gender"
order_of_bars = df.Stage.unique()[::-1]
colors = [
    plt.cm.Spectral(i / float(len(df[group_col].unique()) - 1))
    for i in range(len(df[group_col].unique()))
]

for c, group in zip(colors, df[group_col].unique()):
    sns.barplot(
        x="Users",
        y="Stage",
        data=df.loc[df[group_col] == group, :],
        order=order_of_bars,
        color=c,
        label=group,
        ax=ax,
        lw=0,
    )

divisor = 1e6
ax.set_xticklabels([str(abs(x) / divisor) for x in ax.get_xticks()])
plt.xlabel("Users (millions)")
plt.ylabel("Stage of Purchase")
plt.yticks(fontsize=12)
plt.title("Population Pyramid of the Marketing Funnel", fontsize=22)
plt.legend(frameon=False)
plt.show()
