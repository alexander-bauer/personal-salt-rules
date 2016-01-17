cjdns:
  pkg.installed: []
  service.running:
    - require:
      - pkg: cjdns
    - watch:
      - file: cjdroute.conf

cjdroute.conf:
  file.managed:
    - name: /etc/cjdroute.conf
    - source: salt://cjdns/cjdroute.conf
    - mode: 0600
    - template: jinja
    - context: {{ pillar.get('cjdns') | yaml }}
    - require:
      - pkg: cjdns
