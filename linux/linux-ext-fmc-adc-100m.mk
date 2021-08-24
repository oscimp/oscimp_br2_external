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
	echo 'obj-m += fmc-adc-100m/' >> $${DEST_DIR}/Makefile;
endef
