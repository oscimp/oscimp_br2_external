# OscillatorIMP Buildroot additional packages (BR2_EXTERNAL)
BR2_EXTERNAL framework for OscillatorIMP supported peripherals, most significantly
software defined radio applications on Raspberry Pi(3,4)

This support has been tested with the latest stable release of buildroot (2022.08) and git master branch.

This BR2_EXTERNAL repository is used as a testbed for embedded software not (yet) released on the official
Buildroot repository. Main software applications include the GNU Radio framework, White Rabbit and most significantly
for embedded board such as the Compute Module 4 IO, XTRX SDR platform and gnss-sdr.

How-to use it
=============

Download the tested buildroot tarball:
```bash
wget https://buildroot.org/downloads/buildroot-2022.08.tar.gz
```

### Configure, build and install

Adding support for these packages requires sourcing the **sourceme.ggm** file (``source sourceme.ggm``) 
to add the **BR2_EXTERNAL** variable definition (alternatively, one might want to add <code>export
BR2_EXTERNAL=/somewhere/oscimp_br2_external</code> to the *.bashrc* initialization file).

For compiling ``gr-osmodrr`` with XTRX support for pre-2021.08 Buildroot versions, make sure to apply the 
patch *prior* to configuring Buildroot: from the root Buildroot directory,
```bash
patch -p1 < gr-osmosdr-add_xtrx_support.patch
```
(the update has been integrated in Buildroot in the latest releases and patching is no longer needed).

Configuring Buildroot with GNU Radio support is achieved by running from the Buildroot root directory  
```bash
make raspberrypi4_64_gnuradio_defconfig
```
This will configure buildroot for the Raspberry Pi4 supporting the 64 bit instructions and GNU Radio. For
the Compute Module 4,
```bash
make raspberrypicm4_64_gnuradio_defconfig
```
will configure Buildroot for GNU Radio support (700 MB resulting binary image). Add 39 after gnuradio for the 3.9
version release.

Overall, <code>make menuconfig</code> allows for configuring
additional settings of the buildroot environment, especially Target Packages, <code>make</code> builds
the images to be found at the end of the compilation in <code>output/images</code>.

### Scipy

`package/python-scipy` is now officially integrated.

We provide three configurations that enable `scipy` by default

```bash
make beaglebone_scipy_defconfig
make raspberrypi3_64_scipy_defconfig
make raspberrypi4_64_scipy_defconfig
```

### Sklearn: machine learning toolkit

Package `python-scikitlearn` requires `scipy` and 
an extra buildroot patch to be applied prior anything, similarly to the `gr-osmosdr` tweak:

```bash
source sourceme.ggm
cd buildroot
patch -p1 < $BR2_EXTERNAL/scikitlearn-support.patch
```
