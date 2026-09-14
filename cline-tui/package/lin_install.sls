# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

{%- if cline_tui.pkg.deps %}
CLIne TUI Package Install Dependencies Installed:
  pkg.installed:
    - pkgs: {{ cline_tui.pkg.deps | json }}
{%- endif %}

CLIne TUI Package Install Npm Installed:
  npm.installed:
    - name: {{ cline_tui.pkg.name }}
    {%- if cline_tui.pkg.deps %}
    - require:
      - pkg: 'CLIne TUI Package Install Dependencies Installed'
    {%- endif %}

CLIne TUI Package Install Permissions Managed:
  file.directory:
    - dir_mode: '0755'
    - file_mode: '0755'
    - name: {{ cline_tui.pkg.npm_dir }}
    - recurse:
      - dir_mode
      - file_mode
    - require:
      - npm: 'CLIne TUI Package Install Npm Installed'
