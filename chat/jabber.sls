jabber-client:
  pkg.latest:
    - pkgs:
      - pidgin

jabber-client-service:
  file.managed:
    - name: /etc/xdg/systemd/user/pidgin.service
    - source: salt://chat/pidgin.service

{% for user in pillar.get('admins').keys() %}
jabber-client-service_{{user}}:
  cmd.wait:
    - name: 'systemctl enable pidgin.service --user'
    - user: {{ user }}
    - watch:
      - file: jabber-client-service
{% endfor %}
