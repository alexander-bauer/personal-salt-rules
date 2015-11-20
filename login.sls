sasha:
  group.present:
    - gid: 1000
  user.present:
    - uid: 1000
    - groups:
      - sasha
      - wheel
    - require:
      - group: sasha

sudo:
  pkg.installed: []
  file.line:
    - name: /etc/sudoers
    - mode: ensure
    - content: '%wheel ALL=(ALL) ALL'
    - after: root ALL=(ALL) ALL
