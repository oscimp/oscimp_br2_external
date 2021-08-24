################################################################################
#
# zio
#
################################################################################

LINUX_EXTENSIONS += zio

define ZIO_PREPARE_KERNEL
	$(SED) 's/$$(ZIO_VERSION)/-D__ZIO_MAJOR_VERSION=1 -D__ZIO_MINOR_VERSION=4 -D__ZIO_PATCH_VERSION=2/g' $(ZIO_DIR)/drivers/zio/Kbuild

	`# Create destination directory`; \
	DEST_DIR=$(LINUX_DIR)/drivers/wrtd_ref_spec150t_adc; \
	mkdir -p $${DEST_DIR}; \
	if [ ! -e $${DEST_DIR}/Kconfig ]; then \
		sed -i 's:endmenu:source "drivers/wrtd_ref_spec150t_adc/Kconfig"\nendmenu:g' $(LINUX_DIR)/drivers/Kconfig; \
		echo 'obj-y += wrtd_ref_spec150t_adc/' >> $(LINUX_DIR)/drivers/Makefile; \
	fi; \
	\
	`# Copy headers`; \
	cp -dpfr $(ZIO_DIR)/include/* $(LINUX_DIR)/include; \
	\
	`# Copy sources`; \
	cp -dpfr $(ZIO_DIR)/drivers/zio $${DEST_DIR}; \
	\
	`# Add a Kconfig`; \
	echo 'menuconfig ZIO' >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\ttristate \"ZIO driver for Linux\"" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\tdefault m" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\thelp" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\t  A software framework for Linux device drivers aimed at" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\t  supporting controls and data acquisition hardware." >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\t  " >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\t  https://ohwr.org/project/zio" >> $${DEST_DIR}/zio/Kconfig; \
	\
	echo -e "source \"drivers/wrtd_ref_spec150t_adc/zio/Kconfig\"\n" >> $${DEST_DIR}/Kconfig; \
	echo -e "if ZIO\n" >> $${DEST_DIR}/zio/Kconfig; \
	echo 'config ZIO_DEVICES' >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\ttristate \"ZIO devices\"" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\tdefault m\n" >> $${DEST_DIR}/zio/Kconfig; \
	echo 'config ZIO_BUFFERS' >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\ttristate \"ZIO buffers\"" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\tdefault m\n" >> $${DEST_DIR}/zio/Kconfig; \
	echo 'config ZIO_TRIGGERS' >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\ttristate \"ZIO triggers\"" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e "\tdefault m\n" >> $${DEST_DIR}/zio/Kconfig; \
	echo -e 'endif' >> $${DEST_DIR}/zio/Kconfig; \
	\
	`# Edit Makefile`; \
	echo 'obj-m += zio/' >> $${DEST_DIR}/Makefile;
endef
