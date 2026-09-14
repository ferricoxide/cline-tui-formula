# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

include:
{%- if grains.kernel == "Linux" %}
  - cline-tui.config.lin_clean
{%- elif grains.kernel == "Windows" %}
  - cline-tui.config.win_clean
{%- endif %}

Avoid being a null-router (config/clean) - CLIne coding-assistant:
  test.nop: []
