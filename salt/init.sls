salt-minion:
  pkg.latest:
    - pkgs:
      - salt-zmq
  file.managed:
    - name: /etc/salt/minion
    - content: |
      # {{ salt['grains.get']('file_managed_warning', '') }}
      {{ salt['pillar.get']('minion:config', {}) | yaml }}
