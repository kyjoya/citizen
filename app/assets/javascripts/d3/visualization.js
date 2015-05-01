// function stateConverter(pathName) {
//   var state = pathNameConverter(pathName);
//     var states = new Array (
//         {'name':'Alabama', 'abbrev':'AL'},          {'name':'Alaska', 'abbrev':'AK'},
//         {'name':'Arizona', 'abbrev':'AZ'},          {'name':'Arkansas', 'abbrev':'AR'},         {'name':'California', 'abbrev':'CA'},
//         {'name':'Colorado', 'abbrev':'CO'},         {'name':'Connecticut', 'abbrev':'CT'},      {'name':'Delaware', 'abbrev':'DE'},
//         {'name':'Florida', 'abbrev':'FL'},          {'name':'Georgia', 'abbrev':'GA'},          {'name':'Hawaii', 'abbrev':'HI'},
//         {'name':'Idaho', 'abbrev':'ID'},            {'name':'Illinois', 'abbrev':'IL'},         {'name':'Indiana', 'abbrev':'IN'},
//         {'name':'Iowa', 'abbrev':'IA'},             {'name':'Kansas', 'abbrev':'KS'},           {'name':'Kentucky', 'abbrev':'KY'},
//         {'name':'Louisiana', 'abbrev':'LA'},        {'name':'Maine', 'abbrev':'ME'},            {'name':'Maryland', 'abbrev':'MD'},
//         {'name':'Massachusetts', 'abbrev':'MA'},    {'name':'Michigan', 'abbrev':'MI'},         {'name':'Minnesota', 'abbrev':'MN'},
//         {'name':'Mississippi', 'abbrev':'MS'},      {'name':'Missouri', 'abbrev':'MO'},         {'name':'Montana', 'abbrev':'MT'},
//         {'name':'Nebraska', 'abbrev':'NE'},         {'name':'Nevada', 'abbrev':'NV'},           {'name':'New Hampshire', 'abbrev':'NH'},
//         {'name':'New Jersey', 'abbrev':'NJ'},       {'name':'New Mexico', 'abbrev':'NM'},       {'name':'New York', 'abbrev':'NY'},
//         {'name':'North Carolina', 'abbrev':'NC'},   {'name':'North Dakota', 'abbrev':'ND'},     {'name':'Ohio', 'abbrev':'OH'},
//         {'name':'Oklahoma', 'abbrev':'OK'},         {'name':'Oregon', 'abbrev':'OR'},           {'name':'Pennsylvania', 'abbrev':'PA'},
//         {'name':'Rhode Island', 'abbrev':'RI'},     {'name':'South Carolina', 'abbrev':'SC'},   {'name':'South Dakota', 'abbrev':'SD'},
//         {'name':'Tennessee', 'abbrev':'TN'},        {'name':'Texas', 'abbrev':'TX'},            {'name':'Utah', 'abbrev':'UT'},
//         {'name':'Vermont', 'abbrev':'VT'},          {'name':'Virginia', 'abbrev':'VA'},         {'name':'Washington', 'abbrev':'WA'},
//         {'name':'West Virginia', 'abbrev':'WV'},    {'name':'Wisconsin', 'abbrev':'WI'},        {'name':'Wyoming', 'abbrev':'WY'}
//       );
//
//     var returnthis = false;
//
//     $.each(states, function(index, value) {
//           if (value.name == state) {
//             returnthis = value.abbrev
//           }
//         });
//       return returnthis;
// }
//
// function pathNameConverter(pathName) {
//   return pathName.split('/')[2]
// }


function processData(data) {
      var data = data.states;
      var newDataSet = [];

      for(var i in data) {

        newDataSet.push({
          name: data[i]["word"], className: data[i]["word"], size: data[i]["count"]
        });
      }
        return {children: newDataSet};
    }

function buildVisualization() {
  $.getJSON(window.location.pathname + '.json', function(data) {

        var h = 1000
        var w = 1300
            format = d3.format(",d");

        var bubble = d3.layout.pack()
            .size([w, h])
            .padding(1.5)
            .value(function(d) {return d.size});

        var vis = d3.select('#state_chart').append('svg')
            .attr('width', w)
            .attr('height', h)
            .attr("class", "bubble")

        var nodes = bubble.nodes(processData(data))
            .filter(function(d) { return !d.children; });

        var node = vis.selectAll("g.node")
            .data(nodes, function(d) { return d.name; })
            .enter().append("g")
            .attr("class", "node")
            .attr("transform", function(d) {
                return "translate(" + d.x + "," + d.y + ")";
            });

        node.append("title")
            .text(function(d) {
                return d.className + " Word count: " + d.size;
            });

        node.append("circle")
            .attr("r", function(d) { return d.r; })
            .attr('class', function(d) { return d.className; })
            .style("fill", "#ECF0F1")
            .style("stroke", "#00263C")
            .on("mouseover", function(d){
                  d3.select(this)
                      .transition()
                      .duration(400)
                      .style("fill", "#3498DB")
              })
              .on("mouseout", function(d){
                  d3.select(this)
                      .transition()
                      .duration(400)
                      .style("fill", "#6F270B")
              });

        node.append("text")
            .attr("text-anchor", "middle")
            .text(function(d) {
                return d.className;
              })
            .style("fill", "#00263C")
            .style("font-size", "1px")
            .each(getSize)
            .style("font-size", function(d) { return d.scale - 5 + "px"; });

        function getSize(d) {
          var bbox = this.getBBox(),
              cbbox = this.parentNode.getBBox(),
              scale = Math.min(cbbox.width/bbox.width, cbbox.height/bbox.height);
          d.scale = scale;
        };

// future animation guidance
// function animateCircle () {
//   d3.select(this).transition().attr("transform", "r(" + (Math.random() * 1.2) + 10 + ")");
// };
//
// window.setInterval(function () {
//   vis.selectAll("circle").each(animateCircle);
// }, 500);

  });
} // ends function
