function do_graph() {
    $ = jQuery.noConflict();
    var width = $('#graph').width();
    var height = $('#graph').height();

    var color = d3.scale.category20();

    var force = d3.layout.force()
        .charge(-600)
        .linkDistance(110)
        .gravity(0.06)
        .size([width, height]);

    $( window ).resize(function() {
      width = $('#graph').width();
      height = $('#graph').height();
      force.size([width, height]);
      force.start();
    });

    var svg = d3.select("#graph").append("svg");

    var links = [
        {'source': 0, 'target': 1},
        {'source': 1, 'target': 2}
    ];

    d3.json("/graph/graph.json", function(error, graph) {

        var edges = [];

        graph.links.forEach(function(e) { 
            // Get the source and target nodes
            var sourceNode = graph.nodes.filter(function(n) { return n.id === e.source; })[0],
                targetNode = graph.nodes.filter(function(n) { return n.id === e.target; })[0];

            // Add the edge to the array
            edges.push({source: sourceNode, target: targetNode});
        });

      force
          .nodes(graph.nodes)
          .links(edges)
          .start();

      var link = svg.selectAll(".link")
          .data(edges)
        .enter().append("line")
          .attr("class", "link")
          .style("stroke-width", 1);

      var node = svg.selectAll(".node")
          .data(graph.nodes)
        .enter().append("circle")
          .attr("class", "node")
          .attr("r", 6)
          .style("fill", function(d) { return color(d.id); })
          .call(force.drag);

      var label = svg.selectAll(".label")
        .data(graph.nodes)
        .enter().append("text")
        .attr("class", "graph-label")
        .text(function(d) { return d.name; });
    var rating = svg.selectAll(".rating")
        .data(graph.nodes)
        .enter().append("text")
        .attr("class", "graph-label")
        .text(function(d) { return d.rating; })
        .style("fill", "gray");

      force.on("tick", function() {
        graph.nodes.forEach(function(o, i) {
          if (o.y < 10) o.y = 10;
          if (o.y > height - 20) o.y = height - 20;
          if (o.x < 10) o.x = 10;
          if (o.x > width - 10) o.x = width - 10;
        });
        link.attr("x1", function(d) { return d.source.x; })
            .attr("y1", function(d) { return d.source.y; })
            .attr("x2", function(d) { return d.target.x; })
            .attr("y2", function(d) { return d.target.y; });

        node.attr("cx", function(d) { return d.x; })
            .attr("cy", function(d) { return d.y; });

        label.attr("x", function(d) { return d.x + 7; })
            .attr("y", function(d) { return d.y + 4; });
        rating.attr("x", function(d) { return d.x + 7; })
            .attr("y", function(d) { return d.y + 17; });
      });
    });
}