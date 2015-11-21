makepkg:
  user.present:
    - system: true
    - require:
      - file: makepkg
  file.managed:
    - name: /etc/sudoers.d/makepkg
    - contents: 'makepkg ALL=NOPASSWD: /usr/bin/pacman'

aur_prerequisites:
  pkg.installed:
    - pkgs:
      - yajl
      - expac
  file.symlink:
    - name: /usr/bin/pod2man
    - target: /usr/bin/core_perl/pod2man

cower:
  pkg.installed: []
  cmd.script:
    - source: salt://aur/aur.sh
    - user: makepkg
    - args: 'cower'
    - require:
      - user: makepkg
      - pkg: aur_prerequisites
    - prereq:
      - pkg: cower

pacaur:
  pkg.installed: []
  cmd.script:
    - source: salt://aur/aur.sh
    - user: makepkg
    - args: 'pacaur'
    - require:
      - user: makepkg
      - pkg: cower
      - pkg: aur_prerequisites
    - prereq:
      - pkg: pacaur
