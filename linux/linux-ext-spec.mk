################################################################################
#
# spec
#
################################################################################

LINUX_EXTENSIONS += spec

define SPEC_PREPARE_KERNEL
	$(SED) 's/$$(CONFIG_FPGA_MGR_BACKPORT)/y/g' $(SPEC_DIR)/software/kernel/Kbuild

	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/Kconfig ]; then \
		sed -i 's:endmenu:source "drivers/wrtd_ref_spec150t_adc/Kconfig"\nendmenu:g' $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Copy sources`; \
	cp -dpfr $(SPEC_DIR)/software/kernel $${DEST_DIR}/spec; \
	rm $${DEST_DIR}/spec/Kbuild; \
	\
	`# Add a Kconfig`; \
	echo "config FMC_GN412X" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\ttristate \"SPEC gn412x drivers for Linux\"" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect FMC" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect FPGA" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\t#select GENERAL_CORES" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect HTVIC" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect I2C_OCORES" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect SPI_OCORES" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e 'config SPEC' >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\ttristate \"SPEC drivers for Linux\"" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect FMC" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect FMC_GN412X" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect FPGA" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\t#select GENERAL_CORES" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect HTVIC" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect I2C_OCORES" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\tselect SPI_OCORES" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\thelp" >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\t  A simple 4-lane PCIe carrier for a low pin count FPGA Mezzanine Card (VITA 5.7)." >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\t  " >> $${DEST_DIR}/spec/Kconfig; \
	echo -e "\t  https://ohwr.org/project/spec" >> $${DEST_DIR}/spec/Kconfig; \
	\
	echo 'source "drivers/wrtd_ref_spec150t_adc/spec/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	\
	`# Edit Makefile`; \
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS)"' > $${DEST_DIR}/spec/Makefile; \
	echo 'ccflags-y += -DVERSION=\"1.2.3.4\"' >> $${DEST_DIR}/spec/Makefile; \
	echo '' >> $${DEST_DIR}/spec/Makefile; \
	echo 'obj-$$(CONFIG_FMC)        += spec-fmc-carrier.o' >> $${DEST_DIR}/spec/Makefile; \
	echo 'obj-$$(CONFIG_FMC_GN412X) += gn412x-gpio.o' >> $${DEST_DIR}/spec/Makefile; \
	echo 'obj-$$(CONFIG_FMC_GN412X) += gn412x-fcl.o' >> $${DEST_DIR}/spec/Makefile; \
	echo 'obj-$$(CONFIG_FMC_GN412X) += spec-gn412x-dma.o' >> $${DEST_DIR}/spec/Makefile; \
	echo '' >> $${DEST_DIR}/spec/Makefile; \
	echo 'spec-fmc-carrier-objs := spec-core.o' >> $${DEST_DIR}/spec/Makefile; \
	echo 'spec-fmc-carrier-objs += spec-core-fpga.o' >> $${DEST_DIR}/spec/Makefile; \
	echo 'spec-fmc-carrier-objs += spec-compat.o' >> $${DEST_DIR}/spec/Makefile; \
	\
	`# Edit global Makefile`; \
	echo 'obj-m += spec/' >> $${DEST_DIR}/Makefile;
endef
