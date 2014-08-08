
BDFS := curriedcn-9pt-12px-r.bdf curried-fixed-13b.bdf curried-fixed-13b-i.bdf
BDFS += curried-fixed-13r.bdf curried-fixed-13r-i.bdf curried-fixed-16b.bdf
BDFS += curried-fixed-16b-i.bdf curried-fixed-16r.bdf curried-fixed-16r-i.bdf
BDFS += curried-fixed-x18b.bdf curried-fixed-x18n.bdf curried-fixed-x20b.bdf
BDFS += curried-fixed-x20n.bdf curried-fixed-x22b.bdf curried-fixed-x22n.bdf
BDFS += curried-fixed-x24b.bdf curried-fixed-x24n.bdf curried-fixed-x28b.bdf
BDFS += curried-fixed-x28n.bdf curried-fixed-x32b.bdf curried-fixed-x32n.bdf
BDFS += curriedcn-18pt-24px-r.bdf

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
