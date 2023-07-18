.PHONY: all clean
all: Marlin/Marlin/Configuration.h Marlin/Marlin/Configuration_adv.h Marlin/Marlin/Version.h

clean:
	touch *.h

Marlin/Marlin/%.h: %.h
	cp $< $@
