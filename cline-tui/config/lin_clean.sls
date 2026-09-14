# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

CLIne TUI Config Lin Clean Profile Script Absent:
  file.absent:
    - name: /etc/profile.d/cline.sh

CLIne TUI Config Lin Clean Skel Directory Absent:
  file.absent:
    - name: {{ cline_tui.config.skel_dir }}
