# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

{%- if cline_tui.pkg.deps %}
Cline Tui Package Install Dependencies Installed:
  pkg.installed:
    - pkgs: {{ cline_tui.pkg.deps | json }}
{%- endif %}

Cline Tui Package Install Npm Installed:
  npm.installed:
    - name: {{ cline_tui.pkg.name }}
    {%- if cline_tui.pkg.deps %}
    - require:
      - pkg: Cline Tui Package Install Dependencies Installed
    {%- endif %}
