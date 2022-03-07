# source modelling from volume image data

using Neuroimaging
data_path = joinpath("..", "..", "..", "test", "data", "test-3d.dat")

t = read_VolumeImage(data_path)

NeuroImaging.plot(t)


