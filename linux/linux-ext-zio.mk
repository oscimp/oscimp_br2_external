################################################################################
#
# zio
#
################################################################################

LINUX_EXTENSIONS += zio
ZIO_LINUX_VERSION = -D__ZIO_MAJOR_VERSION=1 -D__ZIO_MINOR_VERSION=4 -D__ZIO_PATCH_VERSION=2
ZIO_LINUX_GIT_VERSION = 1.4.2-0-g14f5bc8

define ZIO_PREPARE_KERNEL
	$(SED) 's/$$(ZIO_VERSION)/${ZIO_LINUX_VERSION}/g' $(ZIO_DIR)/drivers/zio/Kbuild

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
	rm $${DEST_DIR}/zio/Kbuild; \
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
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS)"' > $${DEST_DIR}/zio/Makefile; \
	echo 'ccflags-y += -DGIT_VERSION=\"${ZIO_LINUX_GIT_VERSION}\"' >> $${DEST_DIR}/zio/Makefile; \
	echo 'ccflags-y += ${ZIO_LINUX_VERSION}' >> $${DEST_DIR}/zio/Makefile; \
	echo '' >> $${DEST_DIR}/zio/Makefile; \
	echo 'zio-y := core.o chardev.o sysfs.o misc.o' >> $${DEST_DIR}/zio/Makefile; \
	echo 'zio-y += bus.o objects.o helpers.o dma.o' >> $${DEST_DIR}/zio/Makefile; \
	echo 'zio-y += buffers/zio-buf-kmalloc.o triggers/zio-trig-user.o' >> $${DEST_DIR}/zio/Makefile; \
	echo 'ccflags-$$(CONFIG_ZIO_DEBUG) += -DDEBUG' >> $${DEST_DIR}/zio/Makefile; \
	echo '' >> $${DEST_DIR}/zio/Makefile; \
	echo '# Waiting for Kconfig...' >> $${DEST_DIR}/zio/Makefile; \
	echo '#CONFIG_ZIO_SNIFF_DEV:=y' >> $${DEST_DIR}/zio/Makefile; \
	echo '' >> $${DEST_DIR}/zio/Makefile; \
	echo 'zio-y += sniff-dev.o' >> $${DEST_DIR}/zio/Makefile; \
	echo '' >> $${DEST_DIR}/zio/Makefile; \
	echo 'obj-$$(CONFIG_ZIO) += zio.o' >> $${DEST_DIR}/zio/Makefile; \
	echo 'obj-$$(CONFIG_ZIO_DEVICES) += devices/' >> $${DEST_DIR}/zio/Makefile; \
	echo 'obj-$$(CONFIG_ZIO_BUFFERS) += buffers/' >> $${DEST_DIR}/zio/Makefile; \
	echo 'obj-$$(CONFIG_ZIO_TRIGGERS) += triggers/' >> $${DEST_DIR}/zio/Makefile; \
	\
	`# Edit buffers Makefile`; \
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS)"' > $${DEST_DIR}/zio/buffers/Makefile; \
	echo '' >> $${DEST_DIR}/zio/buffers/Makefile; \
	echo 'ccflags-y += -DGIT_VERSION=\"${ZIO_LINUX_GIT_VERSION}\"' >> $${DEST_DIR}/zio/buffers/Makefile; \
	echo 'ccflags-$(CONFIG_ZIO_DEBUG) += -DDEBUG' >> $${DEST_DIR}/zio/buffers/Makefile; \
	echo '' >> $${DEST_DIR}/zio/buffers/Makefile; \
	echo '# zio-buf-kmalloc.o is now part of zio-core' >> $${DEST_DIR}/zio/buffers/Makefile; \
	echo 'obj-m += zio-buf-vmalloc.o' >> $${DEST_DIR}/zio/buffers/Makefile; \
	\
	`# Edit devices Makefile`; \
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS)"' > $${DEST_DIR}/zio/devices/Makefile; \
	echo '' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'ccflags-y += -DGIT_VERSION=\"${ZIO_LINUX_GIT_VERSION}\"' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'ccflags-y += "${ZIO_LINUX_VERSION}"' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo '' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-zero.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-loop.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-irq-tdc.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-fake-dtc.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-mini.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-gpio.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo '' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'ifdef CONFIG_USB' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-vmk8055.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'endif' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo '' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'ifdef CONFIG_SPI' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'obj-m += zio-ad788x.o' >> $${DEST_DIR}/zio/devices/Makefile; \
	echo 'endif' >> $${DEST_DIR}/zio/devices/Makefile; \
	\
	`# Edit triggers Makefile`; \
	echo 'ccflags-y += -DADDITIONAL_VERSIONS="$$(SUBMODULE_VERSIONS)"' > $${DEST_DIR}/zio/triggers/Makefile; \
	echo '' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo 'ccflags-y += -DGIT_VERSION=\"${ZIO_LINUX_GIT_VERSION}\"' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo 'ccflags-$(CONFIG_ZIO_DEBUG) += -DDEBUG' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo '' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo '# zio-trig-user.o is now part of zio-core' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo 'obj-m += zio-trig-timer.o' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo 'obj-m += zio-trig-irq.o' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo 'ifdef CONFIG_HIGH_RES_TIMERS' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo 'obj-m += zio-trig-hrt.o' >> $${DEST_DIR}/zio/triggers/Makefile; \
	echo 'endif' >> $${DEST_DIR}/zio/triggers/Makefile; \
	\
	`# Edit global Makefile`; \
	echo 'obj-m += zio/' >> $${DEST_DIR}/Makefile;
endef
