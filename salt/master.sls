salt-master:
  pkg.latest:
    - pkgs:
      - salt-zmq
      {%- if 'git' in salt['pillar.get']('master:config:fileserver_backend', []) %}
      - python2-pygit2
      {%- endif %}
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
    - source: salt://templates/yaml_file
    - template: jinja
    - context:
      content:
        update_fileserver:
          runner.fileserver.update
