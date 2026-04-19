# Plusly AppImage

Plusly is provided as an AppImage too.

## Building

- Ensure you install `appimagetool`

```shell
flutter build linux

# copy binaries to appimage dir
cp -r build/linux/{x64,arm64}/release/bundle appimage/Plusly.AppDir
cd appimage

# prepare AppImage files
cp Extera.desktop Plusly.AppDir/
mkdir -p Plusly.AppDir/usr/share/icons
cp ../assets/logo.svg Plusly.AppDir/plusly.svg
cp AppRun Plusly.AppDir/

# build the AppImage
appimagetool Plusly.AppDir
```
