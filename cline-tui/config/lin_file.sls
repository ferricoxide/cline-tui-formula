# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

include:
  - {{ sls_package_install }}

Cline TUI Config Lin File Managed Skel Directory:
  file.directory:
    - group: {{ cline_tui.rootgroup }}
    - makedirs: True
    - mode: '0755'
    - name: {{ cline_tui.config.skel_dir }}
    - require:
      - sls: {{ sls_package_install }}
    - user: root

{%- for rel_path, file_content in cline_tui.config.files.items() %}
  {%- set full_path = cline_tui.config.skel_dir ~ '/' ~ rel_path %}
  {%- set state_id = rel_path | replace('/', ' ') | replace('_', ' ') | title %}
Cline TUI Config Lin File Managed {{ state_id }}:
  file.managed:
    - contents: {{ file_content | json }}
    - group: {{ cline_tui.rootgroup }}
    - makedirs: True
    - mode: '0644'
    - name: {{ full_path }}
    - require:
      - file: Cline TUI Config Lin File Managed Skel Directory
    - user: root
{%- endfor %}
