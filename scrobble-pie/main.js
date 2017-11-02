var title_text = "scrobble-pie";
var title_size = 30;
var subtitle_text = "user ...";
var subtitle_size = 16;

var chart_size = 1000;
var chart_outer = "100%";
var chart_inner = "50%";

d3.json('data.json', function(data) {
	var pie = new d3pie("pieChart", {
		"header": {
			"title": {
				"text": title_text,
				"fontSize": title_size,
				"font": "open sans"
			},/*
			"subtitle": {
				"text": subtitle_text,
				"color": "#999999",
				"fontSize": subtitle_size,
				"font": "open sans"
			},*/
			"location": "pie-center",
			"titleSubtitlePadding": 9
		},
		"footer": {
			"color": "#999999",
			"fontSize": 10,
			"font": "open sans",
			"location": "bottom-left"
		},
		"size": {
			"canvasWidth": chart_size,
			"pieOuterRadius": chart_outer,
			"pieInnerRadius": chart_inner
		},
		"data": {
			"sortOrder": "value-desc",
			"content": data
		},
		"labels": {
			"outer": {
				"format": "label-value1",
				"pieDistance": 32
			},
			"inner": {
				"hideWhenLessThanPercentage": 3
			},
			"mainLabel": {
				"fontSize": 11
			},
			"percentage": {
				"color": "#ffffff",
				"decimalPlaces": 0
			},
			"value": {
				"color": "#adadad",
				"fontSize": 11
			},
			"lines": {
				"enabled": true,
				"style": "straight"
			},
			"truncation": {
				"enabled": true
			}
		},
		"effects": {
			"load": {
				"effect": "default",
				"speed": 1000
			},
			"pullOutSegmentOnClick": {
				"effect": "elastic",
				"speed": 400,
				"size": 8
			},
			"highlightSegmentOnMouseover": true,
			"highlightLuminosity": -0.25
		},
		"misc": {
			"gradient": {
				"enabled": true,
				"percentage": 100
			}
		}
	});
});
