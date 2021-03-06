{% from "lynis/map.jinja" import lynis with context %}

{% if lynis.use_repo %}
include:
  - lynis.repo
{% endif %}

lynis.packages:
  pkg.installed:
    - pkgs:
      - lynis
      {% if lynis.repo.use_customers_repo and lynis.repo.install_plugins %}
      - lynis-plugins
      {% endif %}
    {% if lynis.use_repo %}
    - refresh_db: True
    - require:
      - sls: lynis.repo
    {% endif %}
