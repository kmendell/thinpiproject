## Get the custom gtk theme to use 
mkdir compile
cd compile
git clone https://github.com/vinceliuice/Orchis-theme.git theme
cd theme
./install.sh -t red
cd ../..
## Compile and install ThinPi
mkdir build && cd build
meson
ninja
sudo ninja install
## cleanup
cd ..
rm -Rf compile