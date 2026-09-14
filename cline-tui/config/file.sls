# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}
{%- if grains.kernel == "Linux" %}
  - cline-tui.config.lin_file
{%- elif grains.kernel == "Windows" %}
  - cline-tui.config.win_file
{%- endif %}

Avoid being a null-router (config/file) - CLIne coding-assistant:
  test.nop: []

