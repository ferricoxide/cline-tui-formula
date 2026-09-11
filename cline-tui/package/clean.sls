# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

include:
  - {{ sls_config_clean }}

cline-tui-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ cline_tui.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
