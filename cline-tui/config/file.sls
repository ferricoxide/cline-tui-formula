# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as cline_tui with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

cline-tui-config-file-file-managed:
  file.managed:
    - name: {{ cline_tui.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='cline-tui-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ cline_tui.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        cline_tui: {{ cline_tui | json }}
