.PHONY: all
all: Marlin/Marlin/Configuration.h Marlin/Marlin/Configuration_adv.h Marlin/Marlin/Version.h

Marlin/Marlin/%.h: %.h
	cp $< $@
