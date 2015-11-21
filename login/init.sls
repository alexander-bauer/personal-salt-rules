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
  file.managed:
    - name: /etc/sudoers
    - source: salt://login/sudoers
sudo_wheel:
  file.managed:
    - name: /etc/sudoers.d/wheel
    - content: '%wheel ALL=(ALL) ALL'

ssh:
  pkg.installed:
    - name: openssh
  service.running:
    - name: sshd
    - enable: true
    - require:
      - pkg: ssh
