# concentric plot

# inner radius
inner = 0.8
inner1 = 0.6
inner2 = 0.5
inner3 = 0.4
inner4 = 0.3
inner5 = 0.2
inner6 = 0


thetas = np.linspace(0,2*np.pi, 200)

x_unit_circle = np.cos(thetas)
y_unit_circle = np.sin(thetas)

x_eigens = x_unit_circle * inner
y_eigens = y_unit_circle * inner

x_eigensb = x_unit_circle * inner1
y_eigensb = y_unit_circle * inner1

x_eigensc = x_unit_circle * inner2
y_eigensc = y_unit_circle * inner2

x_eigensd = x_unit_circle * inner3
y_eigensd = y_unit_circle * inner3

x_eigense = x_unit_circle * inner4
y_eigense = y_unit_circle * inner4

x_eigensf = x_unit_circle * inner5
y_eigensf = y_unit_circle * inner5

x_eigensg = x_unit_circle * inner6
y_eigensg = y_unit_circle * inner6

xs = np.linspace(-1.1,1.1, 201)
ys = np.linspace(-1.1,1.1, 201)

xv,yv = np.meshgrid(xs,ys)

# generate the level map
r = xv**2 + yv**2

plt.figure(figsize=(8,8))


plt.contourf(xv, yv, r, levels=[inner6, inner5**2, inner4**2, inner3**2,inner2**2,inner1**2,inner**2, 1], colors=('midnightblue', 'navy','darkslateblue', 'slateblue', 'mediumslateblue','steelblue', 'lightsteelblue','lightsteelblue'))


plt.plot(x_unit_circle, y_unit_circle, color='b', linewidth=3)
plt.plot(x_eigens, y_eigens, color='black', linewidth=2, linestyle='--')
plt.plot(x_eigensb, y_eigensb, color='black', linewidth=2, linestyle='--')
plt.plot(x_eigensc, y_eigensc, color='black', linewidth=2, linestyle='--')
plt.plot(x_eigensd, y_eigensd, color='black', linewidth=2, linestyle='--')
plt.plot(x_eigense, y_eigense, color='black', linewidth=2, linestyle='--')
plt.plot(x_eigensf, y_eigensf, color='black', linewidth=1, linestyle='--')
plt.plot(x_eigensg, y_eigensg, color='black', linewidth=1, linestyle='--')

plt.show()
