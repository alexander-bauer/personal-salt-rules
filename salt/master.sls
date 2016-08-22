salt-master:
  pkg.latest:
    - pkgs:
      - salt-zmq
  file.managed:
    - name: /etc/salt/master
    - source: salt://templates/yaml_file
    - template: jinja
    - context:
      content_pillar: 'master:config'

salt-master-update-fileserver:
  file.managed:
    - name: /etc/salt/reactor/update_fileserver.sls
    - makedirs: true
    - contents: |
      update_fileserver:
        runner.fileserver.update
