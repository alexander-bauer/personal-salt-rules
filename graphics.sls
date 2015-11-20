X-packages:
  pkg.installed:
    - pkgs:
      - xorg-server
      - xorg-xinit

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
