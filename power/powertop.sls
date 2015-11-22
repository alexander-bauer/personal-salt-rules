powertop:
  pkg.latest: []
  file.managed:
    - name: /etc/systemd/system/powertop.service
    - source: salt://power/powertop.service
    - template: jinja
  service.running:
    - enable: true
