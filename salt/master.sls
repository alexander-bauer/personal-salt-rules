salt-master:
  pkg.latest:
    - pkgs:
      - salt-zmq
  file.managed:
    - name: /etc/salt/master
    - contents:
      # {{ salt['grains.get']('file_managed_warning', '') }}
      {{ salt['pillar.get']('master:config', {}) | yaml }}

salt-master-update-fileserver:
  file.managed:
    - name: /etc/salt/reactor/update_fileserver.sls
    - makedirs: true
    - contents: |
      update_fileserver:
        runner.fileserver.update
