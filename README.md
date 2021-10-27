# OscillatorIMP Buildroot additional packages (BR2_EXTERNAL)
BR2_EXTERNAL framework for OscillatorIMP supported peripherals, most significantly
software defined radio applications on Raspberry Pi(3,4)

This support has been tested with the latest stable release of buildroot (2021.02.1) and git master branch.

How-to use it
=============

Download the tested buildroot tarball:
```bash
wget https://buildroot.org/downloads/buildroot-2021.02.1.tar.gz
```

### Configure, build and install

Adding support for these packages requires sourcing the **sourceme.ggm** file (``source sourceme.ggm``) 
to add the **BR2_EXTERNAL** variable definition (alternatively, one might want to add <code>export
BR2_EXTERNAL=/somewhere/oscimp_br2_external</code> to the *.bashrc* initialization file).

For compiling ``gr-osmodrr`` with XTRX support, make sure to apply the patch *prior* to configuring Buildroot: from the root Buildroot directory,
```bash
patch -p1 < gr-osmosdr-add_xtrx_support.patch
```

Configuring Buildroot with GNU Radio support is achieved by running from the Buildroot root directory  
```bash
make raspberrypi4_64_gnuradio_defconfig
```
This will configure buildroot for the Raspberry Pi4 supporting the 64 bit instructions and GNU Radio. For
the Compute Module 4,
```bash
make raspberrypicm4_64_gnuradio_defconfig
```
will configure Buildroot for GNU Radio support (700 MB resulting binary image).

Overall, <code>make menuconfig</code> allows for configuring
additional settings of the buildroot environment, especially Target Packages, <code>make</code> builds
the images to be found at the end of the compilation in <code>output/images</code>.
