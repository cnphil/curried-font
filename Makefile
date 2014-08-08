
BDFS := curriedcn-18pt-24px-r.bdf
BDFS += curriedcn-9pt-12px-r.bdf
BDFS += curried-fixed-13b.bdf
BDFS += curried-fixed-13b-i.bdf
BDFS += curried-fixed-13r.bdf
BDFS += curried-fixed-13r-i.bdf
BDFS += curried-fixed-16b.bdf
BDFS += curried-fixed-16b-i.bdf
BDFS += curried-fixed-16r.bdf
BDFS += curried-fixed-16r-i.bdf
BDFS += curried-fixed-20b.bdf
BDFS += curried-fixed-20b-i.bdf
BDFS += curried-fixed-20r.bdf
BDFS += curried-fixed-20r-i.bdf
BDFS += curried-fixed-24b.bdf
BDFS += curried-fixed-24b-i.bdf
BDFS += curried-fixed-24r.bdf
BDFS += curried-fixed-24r-i.bdf
BDFS += curried-fixed-28b.bdf
BDFS += curried-fixed-28b-i.bdf
BDFS += curried-fixed-28r.bdf
BDFS += curried-fixed-28r-i.bdf
BDFS += curried-fixed-32b.bdf
BDFS += curried-fixed-32b-i.bdf
BDFS += curried-fixed-32r.bdf
BDFS += curried-fixed-32r-i.bdf

PCFS := ${BDFS:.bdf=.pcf}

all: fonts.dir fonts.scale ${PCFS}
	xset fp default
	xset +fp `pwd`
	xset fp rehash

fonts.dir: ${PCFS} fonts.scale
	mkfontdir

fonts.scale: ${PCFS}
	mkfontscale

clean:
	rm -rf *.bak *.pcf fonts.dir fonts.scale

.SUFFIXES: .bdf .pcf

.bdf.pcf:
	bdftopcf -o $@ $<
