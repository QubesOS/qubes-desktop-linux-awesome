AWESOME FOR QUBES RPM
=====================

This is an rpm package for awesome with the patches for qubes from
https://gitlab.com/markwalters1009/awesome-source-for-qubes (which is
a mildly tweaked version of
https://github.com/woju/qubes-desktop-linux-awesome)

See that repository for details of the changes.

BUILD
=====

The following steps (done in FC23 VM) should give you a binary rpm
ready for installing.

1. Clone this repository
```
git clone https://github.com/QubesOS/qubes-desktop-linux-awesome
```
2. Enter the repository
```
cd qubes-desktop-linux-awesome/
```
2. Install build tools etc needed
```
sudo dnf install @development-tools fedora-packager rpmdevtools
```
3. Install awesome specific build tools 
```
sudo dnf builddep awesome.spec
```
4. Download original awesome source files
```
spectool -g awesome.spec
```
5. Verify downloaded sources
```
make verify-sources
```
6. Build the rpms with
```
make rpms
```
7. Finally copy the rpm somewhere convenient with
```
cp ../rpm/x86_64/awesome-3.5.9-1.fc23.x86_64.rpm /tmp/awesome.rpm
```

The full list of commands is

```
git clone https://github.com/QubesOS/qubes-desktop-linux-awesome
cd qubes-desktop-linux-awesome/
sudo dnf install @development-tools fedora-packager rpmdevtools
sudo dnf builddep awesome.spec
spectool -g awesome.spec
make verify-sources
make rpms
cp ../rpm/x86_64/awesome-3.5.9-1.fc23.x86_64.rpm /tmp/awesome.rpm
```

INSTALL
=======

The build process above should have left the rpm in
     ../rpm/

All of the commands below should be run in dom0

1. Install unqubified awesome to get dependencies, and dex-autostart
that we will need later.
```
sudo qubes-dom0-update awesome dex-autostart
```
2. Copy the rpm to dom0 with
```
qvm-run --pass-io <build-rpm> 'cat /tmp/awesome.rpm' > awesome.rpm
```
3. Now install the new rpm with
```
sudo dnf install awesome.rpm
```
4. Logout and select awesome when logging back in.

Finally, you can customise awesome as usual by creating/editing
`~/.config/awesome/rc.lua`



