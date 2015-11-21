wpa_supplicant:
  pkg.installed: []

rfkill:
  pkg.installed: []

{% if 'wireless_interfaces' in pillar %}
{% for iface in pillar.wireless_interfaces %}
wpa_supplicant_{{iface}}:
  file.managed:
    - name: /etc/wpa_supplicant/wpa_supplicant-{{iface}}.conf
    - source: salt://wireless/iface.conf
    - template: jinja
    - context:
      networks: {{ pillar.wireless_networks }}
      ctrl_interface: /run/wpa_supplicant
{% endfor %}
{% endif %}
