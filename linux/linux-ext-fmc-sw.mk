################################################################################
#
# fmc-sw
#
################################################################################

LINUX_EXTENSIONS += fmc-sw

define FMC_SW_PREPARE_KERNEL
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc/fmc_sw; \
	\
	`# Copy headers`; \
	cp -dpfr $(FMC_SW_DIR)/include/* $(LINUX_DIR)/include; \
	\
	`# Copy sources`; \
	mkdir -p $${DEST_DIR}; \
	cp -dpfr $(FMC_SW_DIR)/drivers/fmc/* $${DEST_DIR}; \
	\
	`# Add a Kconfig`; \
	echo "config FMC_SW" >> $${DEST_DIR}/Kconfig; \
	echo -e "\ttristate \"FMC software driver for Linux\"" >> $${DEST_DIR}/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/Kconfig; \
	echo -e "\thelp" >> $${DEST_DIR}/Kconfig; \
	echo -e "\t  This project aims to provide basic support to FMC modules with respect" >> $${DEST_DIR}/Kconfig; \
	echo -e "\t  to the VITA 57.1 standard." >> $${DEST_DIR}/Kconfig; \
	echo -e "\t  " >> $${DEST_DIR}/Kconfig; \
	echo -e "\t  https://ohwr.org/project/fmc-sw" >> $${DEST_DIR}/Kconfig
endef
