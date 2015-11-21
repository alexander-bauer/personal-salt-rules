{% if 'admins' in pillar %}
{% for admin, attributes in pillar.admins.items() %}
admin_{{admin}}:
  user.present:
    - name: {{admin}}
    - enforce_password: true
    - remove_groups: false
    {% for attrname, attr in attributes.items() %}
    - {{attrname}}: {{attr}}
    - groups:
      - {{admin}}
      - wheel
    {% endfor %}
{% endfor %}
{% endif %}

sudo:
  pkg.installed: []
  file.line:
    - name: /etc/sudoers
    - mode: ensure
    - content: '%wheel ALL=(ALL) ALL'
    - after: root ALL=(ALL) ALL

ssh:
  pkg.installed:
    - name: openssh
  service.running:
    - name: sshd
    - enable: true
    - require:
      - pkg: ssh
