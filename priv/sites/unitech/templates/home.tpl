{% extends "base.tpl" %}

{# == IMPORTS/OTHER ======================================== #}


{# == OVERRIDES ======================================== #}

{% block title %}{_ Home _}{% endblock %}
{% block body_class %}page home{% endblock %}


{# == CHILD BLOCKS ======================================== #}

{% block base_js %}
	{% lib
    "js/plugins.js"
    "js/global.js" 
    "js/project.js" 
    "js/pages/home.js"
  %}
{% endblock %}