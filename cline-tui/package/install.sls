# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

cline-tui-package-install-pkg-installed:
  pkg.installed:
    - name: {{ cline_tui.pkg.name }}
