################################################################################
#
# fmc-sw
#
################################################################################

LINUX_EXTENSIONS += fmc-sw

define FMC_SW_PREPARE_KERNEL
	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/Kconfig ]; then \
		sed -i 's:endmenu:source "drivers/wrtd_ref_spec150t_adc/Kconfig"\nendmenu:g' $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Copy headers`; \
	cp -dpfr $(FMC_SW_DIR)/include/* $(LINUX_DIR)/include; \
	\
	`# Copy sources`; \
	cp -dpfr $(FMC_SW_DIR)/drivers/fmc $${DEST_DIR}/fmc-sw; \
	\
	`# Add a Kconfig`; \
	echo 'config FMC' >> $${DEST_DIR}/fmc-sw/Kconfig; \
	echo -e "\ttristate \"FMC software driver for Linux\"" >> $${DEST_DIR}/fmc-sw/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/fmc-sw/Kconfig; \
	echo -e "\thelp" >> $${DEST_DIR}/fmc-sw/Kconfig; \
	echo -e "\t  This project aims to provide basic support to FMC modules with respect" >> $${DEST_DIR}/fmc-sw/Kconfig; \
	echo -e "\t  to the VITA 57.1 standard." >> $${DEST_DIR}/fmc-sw/Kconfig; \
	echo -e "\t  " >> $${DEST_DIR}/fmc-sw/Kconfig; \
	echo -e "\t  https://ohwr.org/project/fmc-sw" >> $${DEST_DIR}/fmc-sw/Kconfig; \
	\
	echo 'source "drivers/wrtd_ref_spec150t_adc/fmc-sw/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	\
	`# Edit Makefile`; \
	echo 'obj-m += fmc-sw/' >> $${DEST_DIR}/Makefile;
endef
