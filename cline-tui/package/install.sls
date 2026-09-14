# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

include:
{%- if grains.kernel == "Linux" %}
  - cline_tui.package.lin_install
{%- elif grains.kernel == "Windows" %}
  - cline_tui.package.win_install
{%- endif %}

Avoid being a null-router (package/install) - CLIne coding-assistant:
  test.nop: []
