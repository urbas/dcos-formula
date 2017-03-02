{% from "dcos/map.jinja" import config with context %}
{% from "dcos/map.jinja" import os_config with context %}

testing:
  cmd.run:
    - name: echo {{ os_config.echo }}