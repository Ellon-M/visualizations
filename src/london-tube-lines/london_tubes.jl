# London Tube Lines

#import Pkg; Pkg.add("VegaLite")
#Pkg.add("VegaDatasets")
using VegaLite, VegaDatasets

londonBoroughs = dataset("londonBoroughs")
londonCentroids = dataset("londonCentroids")
londonTubeLines = dataset("londonTubeLines")

@vlplot(
    width=700, height=500,
    config={
        view={
            stroke=:transparent
        }
    }
) +
@vlplot(
    data={
        values=londonBoroughs,
        format={
            type=:topojson,
            feature=:boroughs
        }
    },
    mark={
        :geoshape,
        stroke=:white,
        strokeWidth=2
    },
    color={value="#d1ffc2"}
) +
@vlplot(
    data=londonCentroids,
    transform=[{
        calculate="indexof (datum.name,' ') > 0  ? substring(datum.name,0,indexof(datum.name, ' ')) : datum.name",
        as=:bLabel
    }],
    mark=:text,
    longitude="cx:q",
    latitude="cy:q",
    text="bLabel:n",
    size={value=8},
    opacity={value=0.6}
) +
@vlplot(
    data={
        values=londonTubeLines,
        format={
            type=:topojson,
            feature=:line
        }
    },
    mark={
        :geoshape,
        filled=false,
        strokeWidth=2
    },
    color={
        "id:n",
        legend={
            title=nothing,
            orient="bottom-right",
            offset=0
        },
        scale={
            domain=[
                "Bakerloo",
                "Central",
                "Circle",
                "District",
                "DLR",
                "Hammersmith & City",
                "Jubilee",
                "Metropolitan",
                "Northern",
                "Piccadilly",
                "Victoria",
                "Waterloo & City"
            ],
            range=[
                "rgb(137,78,36)",
                "rgb(220,36,30)",
                "rgb(255,206,0)",
                "rgb(1,114,41)",
                "rgb(0,175,173)",
                "rgb(215,153,175)",
                "rgb(106,114,120)",
                "rgb(114,17,84)",
                "rgb(0,0,0)",
                "rgb(0,24,168)",
                "rgb(0,160,226)",
                "rgb(106,187,170)"
            ]
        }
    }
)
