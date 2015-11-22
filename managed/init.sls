salt-minion:
  pkg.latest:
    - pkgs:
      - salt-zmq
  file.managed:
    - name: /etc/salt/minion
    - source: salt://managed/minion
    - template: jinja
