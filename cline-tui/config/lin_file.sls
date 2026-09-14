# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}

{%- set providers_raw = cline_tui.config.files.get(
    'data/settings/providers.json', '{}'
) %}
{%- set providers_data = providers_raw | load_json %}
{%- set gemini_key = providers_data | traverse(
    'providers:gemini:settings:geminiApiKey', ''
) %}

include:
  - {{ sls_package_install }}

{%- if gemini_key %}
CLIne TUI Config Lin File Managed Profile Script:
  file.managed:
    - contents: |
        export GEMINI_API_KEY="{{ gemini_key }}"
    - group: {{ cline_tui.rootgroup }}
    - mode: '0644'
    - name: /etc/profile.d/cline.sh
    - require:
      - sls: {{ sls_package_install }}
    - user: root
{%- endif %}

CLIne TUI Config Lin File Managed Skel Directory:
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
  {%- set clean_rel = rel_path | replace('/', ' ') | replace('_', ' ') %}
  {%- set st_id = clean_rel | replace('.', ' ') | title %}
CLIne TUI Config Lin File Managed {{ st_id }}:
  file.managed:
    - contents: {{ file_content | json }}
    - group: {{ cline_tui.rootgroup }}
    - makedirs: True
    - mode: '0644'
    - name: {{ full_path }}
    - require:
      - file: 'CLIne TUI Config Lin File Managed Skel Directory'
    - user: root
{%- endfor %}
