{% set default_sudogroup = salt['grains.filter_by']({
  'Debian': 'sudo',
  'RedHat': 'wheel',
  'Arch':   'wheel'
}, grain='os_family') %}
{% set sudogroup = salt['pillar.get']('login:sudogroup', default_sudogroup) %}

sudogroup:
  group.present:
    - name: "{{sudogroup}}"
    - system: true

  file.managed:
    - name: /etc/sudoers.d/sudogroup
    - contents: "%{{sudogroup}} ALL=(ALL) ALL"

user_packages:
  pkg.installed:
    - pkgs: {{ salt['pillar.get']('login:packages', []) | yaml }}

{% for username, user in salt['pillar.get']('login:users', {}).items() %}

{% set groups = (user.groups if 'groups' in user else [])
                + ([sudogroup] if user['admin'] else [])
%}

user_{{username}}:
  user.present:
    - name: "{{username}}"
    - password: "{{user['password']}}"
    - gid_from_name: true
    - groups: {{  groups | yaml }}

{% endfor %}
