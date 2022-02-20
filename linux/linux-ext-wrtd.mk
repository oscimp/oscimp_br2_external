################################################################################
#
# wrtd
#
################################################################################

LINUX_EXTENSIONS += wrtd

define WRTD_PREPARE_KERNEL
	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/Kconfig ]; then \
		sed -i 's:endmenu:source "drivers/wrtd_ref_spec150t_adc/Kconfig"\nendmenu:g' $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Copy headers`; \
	cp -dpfr $(WRTD_DIR)/software/include/* $(LINUX_DIR)/include; \
	rm $${DEST_DIR}/wrtd/Kbuild; \
	\
	`# Copy sources`; \
	cp -dpfr $(WRTD_DIR)/software/drivers $${DEST_DIR}/wrtd; \
	rm $${DEST_DIR}/fmc-adc-100m/wrtd; \
	\
	`# Add a Kconfig`; \
	echo 'config WRTD' >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\ttristate \"WRTD driver for Linux\"" >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\tselect MOCK_TURTLE" >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\thelp" >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\t  White Rabbit Trigger Distribution (WRTD) is a generic" >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\t  framework for distributing triggers (events) between" >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\t  Nodes over a White Rabbit network." >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\t  " >> $${DEST_DIR}/wrtd/Kconfig; \
	echo -e "\t  https://ohwr.org/project/wrtd" >> $${DEST_DIR}/wrtd/Kconfig; \
	\
	echo 'source "drivers/wrtd_ref_spec150t_adc/wrtd/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	\
	`# Edit Makefile`; \
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS)"' > $${DEST_DIR}/wrtd/Makefile; \
	echo 'ccflags-y += -DDRV_VERSION=\"1.2.3.4\"' >> $${DEST_DIR}/wrtd/Makefile; \
	echo '' >> $${DEST_DIR}/wrtd/Makefile; \
	echo 'obj-m += wrtd-ref-spec150t-adc.o' >> $${DEST_DIR}/wrtd/Makefile; \
	echo 'obj-m += wrtd-ref-svec-tdc-fd.o' >> $${DEST_DIR}/wrtd/Makefile; \
	echo '' >> $${DEST_DIR}/wrtd/Makefile; \
	echo 'wrtd-ref-spec150t-adc-objs := wrtd-ref-spec150t-adc-core.o' >> $${DEST_DIR}/wrtd/Makefile; \
	echo 'wrtd-ref-svec-tdc-fd-objs := wrtd-ref-svec-tdc-fd-core.o' >> $${DEST_DIR}/wrtd/Makefile; \
	\
	`# Edit global Makefile`; \
	echo 'obj-m += wrtd/' >> $${DEST_DIR}/Makefile;
endef
