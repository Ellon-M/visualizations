Pkg.add("VennDiagrams")

using VennDiagrams

c1 = [0:5] # Can be any iterable
c2 = [3:10]

p = venn(c1, c2)
draw(PDF("beaut1.pdf", 8cm, 10cm), p)

c3 = [0:2:12]

p = venn(c1, c2, c3, proportional=false)
draw(PDF("beaut3.pdf", 8cm, 10cm), p)
