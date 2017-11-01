var title_text = "scrobble-pie";
var title_size = 30;
var subtitle_text = "user ...";
var subtitle_size = 16;

var chart_size = 1000;
var chart_outer = "100%";
var chart_inner = "50%";

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
		"content": [
			{
				"label": "JavaScript",
				"value": 264131,
				"color": "#2484c1"
			},
			{
				"label": "Ruby",
				"value": 218812,
				"color": "#0c6197"
			},
			{
				"label": "Java",
				"value": 157618,
				"color": "#4daa4b"
			},
			{
				"label": "PHP",
				"value": 114384,
				"color": "#90c469"
			},
			{
				"label": "Python",
				"value": 95002,
				"color": "#daca61"
			},
			{
				"label": "C+",
				"value": 78327,
				"color": "#e4a14b"
			},
			{
				"label": "C",
				"value": 67706,
				"color": "#e98125"
			},
			{
				"label": "Objective-C",
				"value": 36344,
				"color": "#cb2121"
			},
			{
				"label": "Shell",
				"value": 28561,
				"color": "#830909"
			},
			{
				"label": "Cobol",
				"value": 24131,
				"color": "#923e99"
			},
			{
				"label": "C#",
				"value": 100,
				"color": "#ae83d5"
			},
			{
				"label": "Coldfusion",
				"value": 68,
				"color": "#bf273e"
			},
			{
				"label": "Fortran",
				"value": 218812,
				"color": "#ce2aeb"
			},
			{
				"label": "Coffeescript",
				"value": 157618,
				"color": "#bca44a"
			},
			{
				"label": "Node",
				"value": 114384,
				"color": "#618d1b"
			},
			{
				"label": "Basic",
				"value": 95002,
				"color": "#1ee67b"
			},
			{
				"label": "Cola",
				"value": 36344,
				"color": "#b0ec44"
			},
			{
				"label": "Perl",
				"value": 32170,
				"color": "#a4a0c9"
			},
			{
				"label": "Dart",
				"value": 28561,
				"color": "#322849"
			},
			{
				"label": "Go",
				"value": 264131,
				"color": "#86f71a"
			},
			{
				"label": "Groovy",
				"value": 218812,
				"color": "#d1c87f"
			},
			{
				"label": "Processing",
				"value": 157618,
				"color": "#7d9058"
			},
			{
				"label": "Smalltalk",
				"value": 114384,
				"color": "#44b9b0"
			},
			{
				"label": "Scala",
				"value": 95002,
				"color": "#7c37c0"
			},
			{
				"label": "Visual Basic",
				"value": 78327,
				"color": "#cc9fb1"
			},
			{
				"label": "Scheme",
				"value": 67706,
				"color": "#e65414"
			},
			{
				"label": "Rust",
				"value": 36344,
				"color": "#8b6834"
			},
			{
				"label": "FoxPro",
				"value": 32170,
				"color": "#248838"
			}
		]
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