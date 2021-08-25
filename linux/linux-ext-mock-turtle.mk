################################################################################
#
# mock-turtle
#
################################################################################

LINUX_EXTENSIONS += mock-turtle

define MOCK_TURTLE_PREPARE_KERNEL
	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/Kconfig ]; then \
		sed -i 's:endmenu:source "drivers/wrtd_ref_spec150t_adc/Kconfig"\nendmenu:g' $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Copy headers`; \
	cp -dpfr $(MOCK_TURTLE_DIR)/software/include/* $(LINUX_DIR)/include; \
	\
	`# Copy sources`; \
	cp -dpfr $(MOCK_TURTLE_DIR)/software/kernel $${DEST_DIR}/mock-turtle; \
	\
	`# Add a Kconfig`; \
	echo 'config MOCK_TURTLE' >> $${DEST_DIR}/mock-turtle/Kconfig; \
	echo -e "\ttristate \"Mock Turtle driver for Linux\"" >> $${DEST_DIR}/mock-turtle/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/mock-turtle/Kconfig; \
	echo -e "\thelp" >> $${DEST_DIR}/mock-turtle/Kconfig; \
	echo -e "\t  Mock Turtle is an HDL core of a generic control system node," >> $${DEST_DIR}/mock-turtle/Kconfig; \
	echo -e "\t  based on a deterministic multicore CPU architecture." >> $${DEST_DIR}/mock-turtle/Kconfig; \
	echo -e "\t  " >> $${DEST_DIR}/mock-turtle/Kconfig; \
	echo -e "\t  https://ohwr.org/project/mock-turtle" >> $${DEST_DIR}/mock-turtle/Kconfig; \
	\
	echo 'source "drivers/wrtd_ref_spec150t_adc/mock-turtle/Kconfig"' >> $${DEST_DIR}/Kconfig; \
	\
	`# Edit Makefile`; \
	echo 'obj-m += mock-turtle/' >> $${DEST_DIR}/Makefile;
endef
