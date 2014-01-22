{% if include.name %}
<h2>{{include.name}}</h2>
{% endif %}

<ul class="list-gallery">
	{% for item in {{include.theGallery}} %}
		{% include gallery_item.html path=item.path thumb=item.thumb alt=item.alt %}
	{% endfor %}		
</ul>
