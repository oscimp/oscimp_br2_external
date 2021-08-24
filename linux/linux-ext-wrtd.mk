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
	\
	`# Copy sources`; \
	cp -dpfr $(WRTD_DIR)/software/drivers $${DEST_DIR}/wrtd; \
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
	echo 'obj-m += wrtd/' >> $${DEST_DIR}/Makefile;
endef
