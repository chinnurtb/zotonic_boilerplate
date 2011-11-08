<!DOCTYPE html>

{# == IMPORTS/OTHER ======================================== #}


{# == BASIC BLOCKS ======================================== #}


{# == FRONTEND ======================================== #}

<html lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="robots" content="noindex" />

	<title>{% block title %}base{% endblock %} &mdash; UNITECH</title>

	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
	
	{% lib
    "css/compass/stylesheets/global.css"
    "css/compass/stylesheets/project.css"
    "css/compass/stylesheets/page.css"
    "css/compass/stylesheets/print.css"
    "css/compass/stylesheets/mobile.css"
	%}

	<!--[if IE]>
	{% lib	
    "css/compass/stylesheets/ie.css" 
  %}
	<![endif]-->

	{% block html_head_extra %}{% endblock %}
</head>

<body class="{% block body_class %}base{% endblock %}">

  {% include "_header.tpl" %}
  
  <div class="container">
  {% block main_content %}
    <div class="main-content">
      <h1>Anything!</h1>
      <p>Anything!</p>
    </div>
  {% endblock %}
  </div>
  
  {% include "_footer.tpl" %}
  
  {% block base_js %}
  	{% lib
      "js/plugins.js"
      "js/global.js" 
      "js/project.js" 
    %}
  {% endblock %}
  
</body>
</html>
