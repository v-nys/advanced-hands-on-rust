{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell rec {
  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    udev alsa-lib vulkan-loader vulkan-tools
    xorg.libX11 xorg.libXcursor xorg.libXi xorg.libXrandr # To use the x11 feature
    libxkbcommon wayland # To use the wayland feature
  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;

  shellHook = ''
    export WGPU_BACKEND=vulkan
    export VK_INSTANCE_LAYERS=VK_LAYER_KHRONOS_validation
  '';
}
