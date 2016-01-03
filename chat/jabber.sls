jabber-client:
  pkg.latest:
    - pkgs:
      - pidgin

jabber-client-service:
  file.managed:
    - name: /etc/xdg/systemd/user/pidgin.service
    - source: salt://chat/pidgin.service
  cmd.wait:
    - name: 'systemctl enable pidgin.service --user'
    - watch:
      - file: jabber-client-service
