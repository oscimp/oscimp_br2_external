################################################################################
#
# fmc-adc-100m
#
################################################################################

LINUX_EXTENSIONS += fmc-adc-100m

define FMC_ADC_100M_PREPARE_KERNEL
	$(SED) 's/ZIO_MIN_MAJOR_VERSION=.*$$/ZIO_MIN_MAJOR_VERSION=1/g' $(FMC_ADC_100M_DIR)/kernel/Kbuild
	$(SED) 's/ZIO_MIN_MINOR_VERSION=.*$$/ZIO_MIN_MINOR_VERSION=4/g' $(FMC_ADC_100M_DIR)/kernel/Kbuild

	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/Kconfig ]; then \
		sed -i 's:endmenu:source "drivers/wrtd_ref_spec150t_adc/Kconfig"\nendmenu:g' $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Copy sources`; \
	cp -dpfr $(FMC_ADC_100M_DIR)/kernel $${DEST_DIR}/fmc-adc-100m; \
	rm $${DEST_DIR}/fmc-adc-100m/Kbuild; \
	\
	`# Add a Kconfig`; \
	echo 'config FMC_ADC' >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\ttristate \"FMC ADC driver for Linux\"" >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\tselect FMC" >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\tselect ZIO" >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\thelp" >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\t  FmcAdc100M14b4cha is a 4 channel 100MSPS 14 bit ADC low pin count" >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\t  FPGA Mezzanine Card (VITA 57)." >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\t  " >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	echo -e "\t  https://ohwr.org/project/fmc-adc-100m14b4cha" >> $${DEST_DIR}/fmc-adc-100m/Kconfig; \
	\
	echo 'source "drivers/wrtd_ref_spec150t_adc/fmc-adc-100m/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	\
	`# Edit Makefile`; \
	echo 'obj-m += fmc-adc-100m/' >> $${DEST_DIR}/Makefile; \
	\
	echo 'ccflags-y += -D__ZIO_MIN_MAJOR_VERSION=1' > $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'ccflags-y += -D__ZIO_MIN_MINOR_VERSION=4' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'SUBMODULE_VERSIONS-y += MODULE_INFO(version_zio,\"$$(ZIO_VERSION)\");' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS-y)"' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'ccflags-y += -DGIT_VERSION=\"$$(GIT_VERSION)\" \' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo '' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'obj-$$(CONFIG_FMC_ADC) += fmc-adc-100m14b4ch.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs := fa-core.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += fa-zio-drv.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += fa-calibration.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += fa-regtable.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += fa-zio-trg.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += fa-irq.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += fa-debug.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += fa-dma.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile; \
	echo 'fmc-adc-100m14b4ch-objs += spi.o' >> $${DEST_DIR}/fmc-adc-100m/Makefile;
endef
