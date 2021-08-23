################################################################################
#
# fpga-manager
#
################################################################################

LINUX_EXTENSIONS += fpga-manager

define FPGA_MANAGER_PREPARE_KERNEL
	`# Remove the existing driver if it exists`; \
	if [ -e $(LINUX_DIR)/drivers/fpga ]; then \
		rm -r $(LINUX_DIR)/drivers/fpga; \
		sed -i '\:source "drivers/fpga/Kconfig":d' $(LINUX_DIR)/drivers/Kconfig; \
		sed -i '\:obj-$$(CONFIG_FPGA)\t\t+= fpga/:d' $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/Kconfig ]; then \
		sed -i 's:endmenu:source "drivers/wrtd_ref_spec150t_adc/Kconfig"\nendmenu:g' $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Copy headers`; \
	cp -dpfr $(FPGA_MANAGER_DIR)/include/* $(LINUX_DIR)/include; \
	\
	`# Copy sources`; \
	cp -dpfr $(FPGA_MANAGER_DIR)/drivers/fpga $${DEST_DIR}/fpga-manager; \
	\
	echo 'source "drivers/wrtd_ref_spec150t_adc/fpga-manager/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	\
	`# Edit Makefile`; \
	echo 'obj-m += fpga-manager/' >> $${DEST_DIR}/Makefile;
endef
