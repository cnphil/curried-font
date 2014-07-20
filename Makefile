
BDFS := curriedcn-9pt-12px-r.bdf curried-fixed-13b.bdf curried-fixed-13b-i.bdf
BDFS += curried-fixed-13r.bdf curried-fixed-13r-i.bdf curried-fixed-16b.bdf
BDFS += curried-fixed-16b-i.bdf curried-fixed-16r.bdf curried-fixed-16r-i.bdf

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
