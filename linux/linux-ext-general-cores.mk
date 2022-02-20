################################################################################
#
# general-cores
#
################################################################################

LINUX_EXTENSIONS += general-cores

define GENERAL_CORES_PREPARE_KERNEL
	`# Remove the existing I2C driver if it exists`; \
	if [ -e $(LINUX_DIR)/drivers/i2c/busses/i2c-ocores.c ]; then \
		rm -r $(LINUX_DIR)/drivers/i2c/busses/i2c-ocores.c; \
		sed -i '/^config I2C_OCORES/,/^config/{/$$/d}' $(LINUX_DIR)/drivers/i2c/busses/Kconfig; \
		sed -i '/obj-$$(CONFIG_I2C_OCORES)\t+= i2c-ocores.o/d' $(LINUX_DIR)/drivers/i2c/busses/Makefile; \
	fi; \
	\
	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc/general-cores; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/../Kconfig ]; then \
		sed -i "s:endmenu:source \"drivers/wrtd_ref_spec150t_adc/Kconfig\"\nendmenu:g" $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	echo 'source "drivers/wrtd_ref_spec150t_adc/general-cores/Kconfig"' >> $${DEST_DIR}/../Kconfig; \
	echo 'obj-y += general-cores/' >> $${DEST_DIR}/../Makefile; \
	\
	`# Copy headers`; \
	cp -dpfr $(GENERAL_CORES_DIR)/software/i2c-ocores/include/* $(LINUX_DIR)/include; \
	cp -dpfr $(GENERAL_CORES_DIR)/software/spi-ocores/include/* $(LINUX_DIR)/include; \
	\
	`# Copy sources`; \
	cp -dpfr $(GENERAL_CORES_DIR)/software/htvic/drivers $${DEST_DIR}/htvic; \
	cp -dpfr $(GENERAL_CORES_DIR)/software/i2c-ocores/drivers/i2c/busses $${DEST_DIR}/i2c-ocores; \
	cp -dpfr $(GENERAL_CORES_DIR)/software/spi-ocores/drivers/spi $${DEST_DIR}/spi-ocores; \
	rm $${DEST_DIR}/htvic/Kbuild; \
	rm $${DEST_DIR}/i2c-ocores/Kbuild; \
	rm $${DEST_DIR}/spi-ocores/Kbuild; \
	\
	`# Add Kconfigs`; \
	echo "config HTVIC" >> $${DEST_DIR}/htvic/Kconfig; \
	echo -e "\ttristate \"HTVIC driver for Linux\"" >> $${DEST_DIR}/htvic/Kconfig; \
	echo -e "\tdefault m\n" >> $${DEST_DIR}/htvic/Kconfig; \
	echo "config I2C_OCORES" >> $${DEST_DIR}/i2c-ocores/Kconfig; \
	echo -e "\ttristate \"I2C OpenCores driver for Linux\"" >> $${DEST_DIR}/i2c-ocores/Kconfig; \
	echo -e "\tdefault m\n" >> $${DEST_DIR}/i2c-ocores/Kconfig; \
	echo "config SPI_OCORES" >> $${DEST_DIR}/spi-ocores/Kconfig; \
	echo -e "\ttristate \"SPI OpenCores driver for Linux\"" >> $${DEST_DIR}/spi-ocores/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/spi-ocores/Kconfig; \
	\
	echo 'source "drivers/wrtd_ref_spec150t_adc/general-cores/htvic/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	echo 'source "drivers/wrtd_ref_spec150t_adc/general-cores/i2c-ocores/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	echo 'source "drivers/wrtd_ref_spec150t_adc/general-cores/spi-ocores/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	\
	`# Edit htvic Makefile`; \
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS-y)"' > $${DEST_DIR}/htvic/Makefile; \
	echo 'ccflags-y += -DGIT_VERSION=\"1.2.3.4\"' >> $${DEST_DIR}/htvic/Makefile; \
	echo 'obj-$$(CONFIG_HTVIC) += htvic.o' >> $${DEST_DIR}/htvic/Makefile; \
	\
	`# Edit i2c-ocores Makefile`; \
	echo 'ccflags-y += -DGIT_VERSION=\"1.2.3.4\"' > $${DEST_DIR}/i2c-ocores/Makefile; \
	echo 'obj-$$(CONFIG_I2C_OCORES) += i2c-ocores.o' >> $${DEST_DIR}/i2c-ocores/Makefile; \
	\
	`# Edit spi-ocores Makefile`; \
	echo 'ccflags-y += -DGIT_VERSION=\"1.2.3.4\"' > $${DEST_DIR}/spi-ocores/Makefile; \
	echo 'obj-$$(CONFIG_SPI_OCORES) += spi-ocores.o' >> $${DEST_DIR}/spi-ocores/Makefile; \
	\
	`# Edit global Makefile`; \
	echo 'obj-m += htvic/' >> $${DEST_DIR}/Makefile; \
	echo 'obj-m += i2c-ocores/' >> $${DEST_DIR}/Makefile; \
	echo 'obj-m += spi-ocores/' >> $${DEST_DIR}/Makefile;
endef
