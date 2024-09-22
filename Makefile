.PHONY: upload compile clean
upload: compile
	arduino-cli upload -b arduino:avr:mega build/Marlin -p /dev/ttyUSB*

compile: build/Marlin build/Marlin/Version.h build/Marlin/Configuration.h build/Marlin/Configuration_adv.h
	arduino-cli compile -b arduino:avr:mega --build-cache-path build/cache $<

clean:
	rm -rf build

build:
	mkdir -p $@

build/Marlin: Marlin/Marlin build
	cp -ap $< $@

#build/Marlin/src/inc/Version.h: Version.h.template build/Marlin
build/Marlin/Version.h: Version.h.template build/Marlin
	sed -e "s/\$${GIT_COMMIT_HASH}/$$(git rev-parse --short HEAD)/" $< > $@

build/Marlin/Configuration.h: Configuration.h build/Marlin
	cp $< $@

build/Marlin/Configuration_adv.h: Configuration_adv.h build/Marlin
	cp $< $@
