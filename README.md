# last.fm-spelunker

### scraper
Generates an exhaustive SQL database of the user's scrobbles and any related info (e.g. data for scrobbled songs or artists) through [the last.fm API](https://www.last.fm/api).

Usage: `python scraper.py <last.fm username>`
```
~$ python scraper.py sbansal21
Retrieved scrobble history... 444 of 444
```

### spelunker
Generates a series of graphs based on scrobble data. Currently supports pie charts, stacked area charts, and streamgraphs. Note: this requires first generating the database via the scraper tool, as outlined [above](#scraper).

#### scrobble-pie
The `scrobble-pie` function is handled entirely by a single Python script:
```
~$ python vis_scrobble-pie.py
```
This creates a `scrobble-pie.html` file that can be viewed in any browser (Chrome comes highly recommended).

#### scrobble-stacked
Like `scrobble-pie`, the `scrobble-stacked` function is also handled entirely by a single Python script:
```
~$ python vis_scrobble-stacked.py
```
This creates a `scrobble-stacked.html` file that can be viewed in any browser (again, Chrome for best resuts).

#### scrobble-stream
Creating a streamgraph is a bit more involved (for now):

1. Enter the `scrobble-streamgraph` directory and process some data:
```
~$ cd scrobble-streamgraph
```
Usage: `python processor.py <minimum scrobbles>`
```
~$ python processor.py 10
```
`minimum scrobbles` just means the minimum number of scrobbles for an artist in any month to avoid cluttering the graph with random one-time scrobbles&mdash;10's a good number to start off with but larger minimums can reduce both noise and lag on the graph.

2. Set up an HTTP server&mdash;this is pretty simple with Python. The commands differ for Python 2.X and 3.X. The version can be easily checked:
```
~$ python --version
```

For Python 2.X:
```
~$ python -m SimpleHTTPServer 8000
```

For Python 3.X:
```
~$ python -m http.server 8000
```

From here, go to `localhost:8000/index.html` on any browser to view the streamgraph.

![scrobble-streamgraph](https://github.com/sumeet-bansal/last.fm-SQL-scraper/blob/master/images/streamgraph.png)
![focused scrobble-streamgraph](https://github.com/sumeet-bansal/last.fm-SQL-scraper/blob/master/images/selected-streamgraph.png)

## TODO
### Planned Graphs
+ [pie chart in pure D3.js](http://bl.ocks.org/dbuezas/9306799) and [bubble charts](https://bl.ocks.org/mbostock/4063269)
+ [hierarchical edge bundling graphs](https://mbostock.github.io/d3/talk/20111116/bundle.html) for related artists
+ [bullet charts](https://bl.ocks.org/mbostock/4061961) for percentile visualizations
+ [classic last.fm-style hierarchical bar charts](https://mbostock.github.io/d3/talk/20111116/bar-hierarchy.html)
+ historical pattern detection based on probability distribution outliers

### Planned Updates
+ better opts and a full command-line spelunker client
+ implement a working model for scraping related data
+ automate streamgraph generation
+ fully migrate to [pure D3.js](https://d3js.org/) (currently uses the [python-nvd3](https://github.com/areski/python-nvd3) wrapper for pie and stacked area charts)
+ create full webpages (read: pipe dream)