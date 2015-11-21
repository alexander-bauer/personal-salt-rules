cups:
  pkg.installed: []
  service.running:
    - name: org.cups.cupsd
    - require:
      - pkg: cups
