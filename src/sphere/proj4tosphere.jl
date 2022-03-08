# proj4 to sphere

# Pkg.add("NPZ")
# Pkg.add("FileIO")

using GLMakie, Proj4, NPZ, FileIO
using Colors
GLMakie.activate!()
let
    # download the data from here:
    # https://github.com/lazarusA/BeautifulMakie/tree/main/_assets/data
    x = npzread("aggregationOSMx.npy")
    y = npzread("aggregationOSMy.npy")
    aggOSM = npzread("aggregationOSM.npy")'
    img = load("osm_kbc.png") # osm_bmy.png
    # getting back to lon and lat coordinates
    source = Projection("+proj=webmerc +datum=WGS84")
    dest = Projection("+proj=longlat +datum=WGS84")
    lonlat = transform(source, dest, [x y])

    function toCartesian(lon, lat; r = 1, cxyz = (0, 0, 0))
        x = cxyz[1] + r * cosd(lat) * cosd(lon)
        y = cxyz[2] + r * cosd(lat) * sind(lon)
        z = cxyz[3] + r * sind(lat)
        return x, y, z
    end
    function lonlat3D(lon, lat, data; cxyz = (0.0, 0.0, 0.0))
        xyzw = zeros(size(data)..., 3)
        for (i, lon) in enumerate(lon), (j, lat) in enumerate(lat)
            x, y, z = toCartesian(lon, lat; cxyz = cxyz)
            xyzw[i, j, 1] = x
            xyzw[i, j, 2] = y
            xyzw[i, j, 3] = z
        end
        xyzw[:, :, 1], xyzw[:, :, 2], xyzw[:, :, 3]
    end
    x, y, z = lonlat3D(lonlat[:, 1], lonlat[:, 2], aggOSM)

    fig = Figure(resolution = (1200, 800), backgroundcolor = "#141414")
    ax = LScene(fig[1, 1], show_axis = false)
    GLMakie.surface!(ax, x, y, z; color = rotr90(img), shading = false,
        transparency = true)
    zoom!(ax.scene, cameracontrols(ax.scene), 0.65)
    GLMakie.rotate!(ax.scene, 12.0)
    display(fig)
end
