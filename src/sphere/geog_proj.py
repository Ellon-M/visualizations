# geographic projections

# aitoff
fig = plt.figure(figsize=(10,10))
fig.patch.set_facecolor('azure')
plt.subplot(projection="aitoff")
plt.title("Aitoff")
plt.grid(True)

# lambert
fig = plt.figure(figsize=(10,10))
fig.patch.set_facecolor('azure')
plt.subplot(projection="lambert")
plt.title("Lambert")
plt.grid(True)

# Mollweide
fig = plt.figure(figsize=(10,10))
fig.patch.set_facecolor('azure')
plt.subplot(projection="mollweide")
plt.title("Mollweide")
plt.grid(True)
