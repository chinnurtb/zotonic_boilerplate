<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<meta name="robots" content="noindex" />

	<title>{% block title %}base{% endblock %} &mdash; unitech</title>

	<link rel="icon" href="/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
	
	{% lib
    "css/zp-compressed.css"
		"css/zp-project.css"
		"css/zp-growl.css"
		"css/jquery.loadmask.css" 
	%}

	<!--[if IE]>
	{% lib	
    "css/zp-ie.css" 
  %}
	<![endif]-->
	
	{% lib
    "js/modules/cufon.js"
    "js/apps/modernizr.js" 
  %}

	{% block html_head_extra %}{% endblock %}
</head>

<body class="{% block body_class %}{% endblock %}">
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
</body>
</html>
