salt-minion:
  pkg.latest:
    - pkgs:
      - salt-zmq
  file.managed:
    - name: /etc/salt/minion
    - source: salt://templates/yaml_file
    - template: jinja
    - context:
      content_pillar: 'minion:config'
