.PHONY: all clean
all: Marlin/Marlin/Configuration.h Marlin/Marlin/Configuration_adv.h Marlin/Marlin/Version.h

clean:
	touch *.h

Version.h: Version.h.template
	sed -e "s/\$${GIT_COMMIT_HASH}/$$(git rev-parse --short HEAD)/" $< > $@

Marlin/Marlin/%.h: %.h
	cp $< $@
