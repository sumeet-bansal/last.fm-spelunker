chart("stream-data.csv", "blue");

var datearray = [];
var colorrange = [];

function chart(csvpath, color) {

    if (color == "blue") {
        colorrange = ["#045A8D", "#2B8CBE", "#74A9CF", "#A6BDDB", "#D0D1E6", "#F1EEF6"];
    }
    else if (color == "pink") {
        colorrange = ["#980043", "#DD1C77", "#DF65B0", "#C994C7", "#D4B9DA", "#F1EEF6"];
    }
    else if (color == "orange") {
        colorrange = ["#B30000", "#E34A33", "#FC8D59", "#FDBB84", "#FDD49E", "#FEF0D9"];
    }
    strokecolor = colorrange[0];

    var format = d3.time.format("%m/%d/%y");

    var margin = {top: 20, right: 40, bottom: 30, left: 30};
    var width = document.body.clientWidth - margin.left - margin.right;
    var height = 450 - margin.top - margin.bottom;

    var tooltip = d3.select(".chart")
        .append("div")
        .attr("class", "tooltip")

    var x = d3.time.scale()
        .range([0, width]);

    var y = d3.scale.linear()
        .range([height-10, 0]);

    var z = d3.scale.ordinal()
        .range(colorrange);

    // set outerTickSize to zero, distracting non-data ink
    var xAxis = d3.svg.axis()
        .scale(x)
        .orient("bottom")
        .ticks(d3.time.months)
        .outerTickSize(0);

    var stack = d3.layout.stack()
        .offset("silhouette")
        .values(function(d) { return d.values; })
        .x(function(d) { return d.date; })
        .y(function(d) { return d.value; });

    var nest = d3.nest()
        .key(function(d) { return d.key; });

    var area = d3.svg.area()
        .interpolate("cardinal")
        .x(function(d) { return x(d.date); })
        .y0(function(d) { return y(d.y0); })
        .y1(function(d) { return y(d.y0 + d.y); });

    var svg = d3.select(".chart").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var graph = d3.csv(csvpath, function(data) {
        data.forEach(function(d) {
            d.date = format.parse(d.date);
            d.value = +d.value;
        });

        var layers = stack(nest.entries(data));

        x.domain(d3.extent(data, function(d) { return d.date; }));
        y.domain([0, d3.max(data, function(d) { return d.y0 + d.y; })]);

        svg.selectAll(".layer")
            .data(layers)
            .enter().append("path")
            .attr("class", "layer")
            .attr("d", function(d) { return area(d.values); })
            .style("fill", function(d, i) { return z(i); });

        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(xAxis)
            .selectAll("text")
                .attr("y", 0)
                .attr("x", 9)
                .attr("dy", ".35em")
                .attr("transform", "rotate(90)")
                .style("text-anchor", "start");

        svg.selectAll(".layer")
            .attr("opacity", 1)
            .on("mouseover", function(d, i) {
            svg.selectAll(".layer").transition()
            .duration(250)
            .attr("opacity", function(d, j) {
                return j != i ? 0.6 : 1;
            })})

            .on("mousemove", function(d, i) {
                mousex = d3.mouse(this);
                mousex = mousex[0];
                var invertedx = x.invert(mousex);
                // we'll use mouse position to look up date we're hovering above
                // here we map mouse position on X axis to "day" index
                // which is not really 1-365 but works without collisions
                invertedx = ((invertedx.getMonth() + 1) * 31) + invertedx.getDate();
                var selected = (d.values);
                for (var k = 0; k < selected.length; k++) {
                    datearray[k] = selected[k].date
                    // "day" index of the date itself
                    datearray[k] = ((datearray[k].getMonth() + 1) * 31) + datearray[k].getDate();
                }

                // bug in the original code was here
                // mousedate is often inaccurate & sometimes not in datearray (-1)
                // if, for instance, there are dates with no entries in the data
                mousedate = datearray.indexOf(invertedx);
                // we find the nearest data point _less than_ our starting date
                while (mousedate === -1) {
                    mousedate = datearray.indexOf(--invertedx)
                }
                quantity = d.values[mousedate].value
                month = d.values[mousedate].date.toLocaleString("en-us", {month: "long"})
                year = d.values[mousedate].date.getFullYear()
                datestr = month + ' ' + year

                d3.select(this)
                    .classed("hover", true)
                    .attr("stroke", strokecolor)
                    .attr("stroke-width", "0.5px");
                tooltip.html('<p>' + d.key + '<br>' + quantity + ' scrobbles <br> in '  + datestr + '</p>')
                    .style("visibility", "visible");
            })

            .on("mouseout", function(d, i) {
                svg.selectAll(".layer")
                    .transition()
                    .duration(250)
                    .attr("opacity", "1");
                d3.select(this)
                    .classed("hover", false)
                    .attr("stroke-width", "0px");
                tooltip.style("visibility", "hidden");
            })

        var vertical = d3.select(".chart")
                .append("div")
                .attr("class", "remove")
                .style("position", "absolute")
                .style("z-index", "19")
                .style("width", "1px")
                .style("height", "420px")
                // need to adjust for <h1> up top
                .style("top", 30 + d3.select('h1')[0][0].offsetHeight + "px")
                .style("bottom", "30px")
                .style("left", "0px")
                .style("background", "#fff");

        d3.select(".chart")
            .on("mousemove", function() {
                mousex = d3.mouse(this);
                mousex = mousex[0] + 5;
                vertical.style("left", mousex + "px" )
            })
            .on("mouseover", function(){
                mousex = d3.mouse(this);
                mousex = mousex[0] + 5;
                vertical.style("left", mousex + "px")
            });
        });
}
