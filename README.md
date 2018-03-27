# last.fm-spelunker

### basic setup
`last.fm-spelunker` has a few requirements:
1. __Python__. Both Python 2.X and 3.X are supported, but Python 3.X is recommended.
2. __Some Python packages__&mdash;these may be easily installed via the `requirements.txt`.

### scraper
Generates an exhaustive SQL database of the user's scrobbles and any related info (e.g. data for scrobbled songs or artists) through [the last.fm API](https://www.last.fm/api). Note: the `artists` functionality is currently disabled but may easily be re-enabled in `scraper.py`.

Usage: `python scraper.py <last.fm username> ... <last.fm username>`
```
~$ python scraper.py sbansal21
Retrieved scrobble history....  444 of 444      for sbansal21.
```

If a user's scrobble history has already been scraped previously, `scraper.py` will automatically update that history with any new scrobbles. Additionally, `scraper.py` supports scraping multiple users' scrobble history at once:

Usage: `python scraper.py <last.fm username> ... <last.fm username>`
```
~$ python scraper.py sbansal21 iuyag
Updated scrobble history with 745 new scrobbles for sbansal21.
Retrieved scrobble history....  47 of 47        for iuyag.
```

### scrubber
Programmatically cleans up a user's scrobble history in the database by renaming "variant" album names. This essentially means if there are multiple variants of the same album name (e.g. `The Sun's Tirade` and `The Sun's Tirade (Explicit)`), those variants will all be standardized to the album's original name (in this example, `The Sun's Tirade`). Optionally applies a SQL script.

Usage: `python scrubber.py <last.fm username> [SQL script]`
```
~$ python scrubber.py sbansal21
Renamed variant album names for sbansal21.

~$ python scrubber.py iuyag scrubscript.sql
Renamed variant album names.
Applied scrubscript.sql to the database.
```

### spelunker
Generates a series of graphs based on scrobble data. Currently supports pie charts and streamgraphs.

#### scrobble-pie
This requires first generating the database via the scraper tool, as outlined [above](#scraper). `scrobble-pie` is currently deprecated as a result of recent schema changes but will be made functional again soon.

1. Enter the `scrobble-pie` directory and process some data:
```
~$ cd scrobble-pie
```
Usage: `node db.js <percentage limit> <artist limit>`
```
~$ node db.js 0.4 25
```
`percentage limit` puts an upper bound on how much of the chart can be taken up by the "Other" category and `artist limit` sets a max number of artists that can be displayed on the chart.

2. Within the main directory, set up an HTTP server&mdash;this is pretty simple with Python. The commands differ for Python 2.X and 3.X. The version can be easily checked:
```
~$ cd ..
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

From here, go to `localhost:8000/scrobble-pie/index.html` on any browser to view the streamgraph.

#### scrobble-streamgraph
1. Run the `spelunker` script, which packages up the scraper, scrubber, and actual streamgraph generation.

Usage: `python spelunker.py <username> <minimum scrobbles>`
```
~$ python spelunker.py sbansal21 75
```
`minimum scrobbles` just means the minimum number of scrobbles for an artist in any month to avoid cluttering the graph with random one-time scrobbles&mdash;`25` can be a good number to start off with but larger minimums can reduce both noise and lag on the graph.

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

From here, go to `localhost:8000/scrobble-streamgraph/index.html` on any browser to view the streamgraph.

![screenshot1](https://github.com/sumeet-bansal/last.fm-SQL-scraper/blob/master/examples/screenshot1.png)
![screenshot2](https://github.com/sumeet-bansal/last.fm-SQL-scraper/blob/master/examples/screenshot2.png)
![screenshot3](https://github.com/sumeet-bansal/last.fm-SQL-scraper/blob/master/examples/screenshot3.png)
![screenshot4](https://github.com/sumeet-bansal/last.fm-SQL-scraper/blob/master/examples/screenshot4.png)

## TODO
### Planned Graphs
+ [pie chart in pure D3.js](http://bl.ocks.org/dbuezas/9306799) and [bubble charts](https://bl.ocks.org/mbostock/4063269)
+ [hierarchical edge bundling graphs](https://mbostock.github.io/d3/talk/20111116/bundle.html) for related artists
+ [bullet charts](https://bl.ocks.org/mbostock/4061961) for percentile visualizations
+ [classic last.fm-style hierarchical bar charts](https://mbostock.github.io/d3/talk/20111116/bar-hierarchy.html)
+ historical pattern detection based on probability distribution outliers

### Planned Updates
+ better opts and a full command-line spelunker client
+ move to a full Node.js or Flask/Django application with an actual routing system instead of just viewing files
+ evolve basic graph pages to full webpages with real CSS
