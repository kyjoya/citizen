function stateConverter(pathName) {
  var state = pathNameConverter(pathName);
    var states = new Array (
        {'name':'Alabama', 'abbrev':'AL'},          {'name':'Alaska', 'abbrev':'AK'},
        {'name':'Arizona', 'abbrev':'AZ'},          {'name':'Arkansas', 'abbrev':'AR'},         {'name':'California', 'abbrev':'CA'},
        {'name':'Colorado', 'abbrev':'CO'},         {'name':'Connecticut', 'abbrev':'CT'},      {'name':'Delaware', 'abbrev':'DE'},
        {'name':'Florida', 'abbrev':'FL'},          {'name':'Georgia', 'abbrev':'GA'},          {'name':'Hawaii', 'abbrev':'HI'},
        {'name':'Idaho', 'abbrev':'ID'},            {'name':'Illinois', 'abbrev':'IL'},         {'name':'Indiana', 'abbrev':'IN'},
        {'name':'Iowa', 'abbrev':'IA'},             {'name':'Kansas', 'abbrev':'KS'},           {'name':'Kentucky', 'abbrev':'KY'},
        {'name':'Louisiana', 'abbrev':'LA'},        {'name':'Maine', 'abbrev':'ME'},            {'name':'Maryland', 'abbrev':'MD'},
        {'name':'Massachusetts', 'abbrev':'MA'},    {'name':'Michigan', 'abbrev':'MI'},         {'name':'Minnesota', 'abbrev':'MN'},
        {'name':'Mississippi', 'abbrev':'MS'},      {'name':'Missouri', 'abbrev':'MO'},         {'name':'Montana', 'abbrev':'MT'},
        {'name':'Nebraska', 'abbrev':'NE'},         {'name':'Nevada', 'abbrev':'NV'},           {'name':'New Hampshire', 'abbrev':'NH'},
        {'name':'New Jersey', 'abbrev':'NJ'},       {'name':'New Mexico', 'abbrev':'NM'},       {'name':'New York', 'abbrev':'NY'},
        {'name':'North Carolina', 'abbrev':'NC'},   {'name':'North Dakota', 'abbrev':'ND'},     {'name':'Ohio', 'abbrev':'OH'},
        {'name':'Oklahoma', 'abbrev':'OK'},         {'name':'Oregon', 'abbrev':'OR'},           {'name':'Pennsylvania', 'abbrev':'PA'},
        {'name':'Rhode Island', 'abbrev':'RI'},     {'name':'South Carolina', 'abbrev':'SC'},   {'name':'South Dakota', 'abbrev':'SD'},
        {'name':'Tennessee', 'abbrev':'TN'},        {'name':'Texas', 'abbrev':'TX'},            {'name':'Utah', 'abbrev':'UT'},
        {'name':'Vermont', 'abbrev':'VT'},          {'name':'Virginia', 'abbrev':'VA'},         {'name':'Washington', 'abbrev':'WA'},
        {'name':'West Virginia', 'abbrev':'WV'},    {'name':'Wisconsin', 'abbrev':'WI'},        {'name':'Wyoming', 'abbrev':'WY'}
      );

    var returnthis = false;

    $.each(states, function(index, value) {
          if (value.name == state) {
            returnthis = value.abbrev
          }
        });
      return returnthis;
}

function pathNameConverter(pathName) {
  return pathName.split('/')[2]
}



function buildVisualization() {
  var results = [];
  var keyWords = ["economy", "women", "poverty", "civil rights", "business", "jobs", "health", "energy", "climate change", "workers"]
  for (var i = 0; i < keyWords.length; i++) {

    var query_params = { apikey: '19584ee72a4e48f584e5115096739392',
                        phrase: keyWords[i],
                        state: stateConverter(window.location.pathname) };

    var endpoint = '//capitolwords.org/api/phrases/state.json';

    var options = {
      data: query_params,
      type: 'GET',
      dataType: 'jsonp'
    };


    $.ajax(endpoint, options, results).success(function(data) {
      var count = data.results[0]["count"];
      var dataset = {"word": keyWords[i], "count": count};
      results.push(dataset);
      });
  } // ends for loop


          var diameter = 2000,
          format = d3.format(",d"),
          color = d3.scale.category20c();

            var bubble = d3.layout.pack()
              .sort(null)
              .size([diameter, diameter])
              .padding(1.5);

          var svg = d3.select("#state_chart").append("svg")
              .attr("width", diameter)
              .attr("height", diameter)
              .attr("class", "bubble");
debugger;
          var node = svg.selectAll("circle")
               .data(results)
               .enter()
               .append("circle");

          node.attr("cx", function(d, i) {
                return (i * 250) + 5;
              })
             .attr("cy", diameter/2)
             .attr("r", function(d) {
                  return d["count"] / 250;
             });

          node.append("text")
             .text(function(d) { return d["word"]; })
             .style("font-size", function(d) { return Math.min(2 * d.r, (2 * d.r - 8) / this.getComputedTextLength() * 24) + "px"; })
             .attr("dy", ".35em");
} // ends function
