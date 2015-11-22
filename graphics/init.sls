X-packages:
  pkg.installed:
    - pkgs:
      - xorg-server
      - xorg-xinit
      - xorg-xset
      - xorg-xbacklight      # backlight utils
      - xbindkeys            # for key bindings
      - xf86-input-synaptics # touchpad
      - xf86-video-intel     # backlight & graphics

Xorg-synaptics:
  file.managed:
    - name: /etc/X11/xorg.conf.d/50-synaptics.conf
    - source: salt://graphics/synaptics.conf
    - template: jinja

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
