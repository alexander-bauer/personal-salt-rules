touchpad-drivers:
  pkg.installed:
    - pkgs:
      - xf86-input-synaptics

X-packages:
  pkg.installed:
    - pkgs:
      - xorg-server
      - xorg-xinit
      - xorg-xset
      - xorg-xbacklight
      - xbindkeys

fonts:
  pkg.installed:
    - pkgs:
      - ttf-inconsolata

display-manager:
  pkg.installed:
    - pkgs:
      - lightdm
      - lightdm-gtk-greeter
  service.running:
    - name: lightdm
    - enable: true

window-manager:
  pkg.installed:
    - name: awesome
    - require:
      - pkg: X-packages
