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



function buildVisualization() {
  $.getJSON(window.location.pathname + '.json', function(data) {
          var data = data.states;
          var newDataSet = [];

          for(var i in data) {

            newDataSet.push({
              name: data[i]["word_count_information"], className: data[i]["word_count_information"], size: data[i]
            });
            debugger;
            return {children: newDataSet}
          }




          var diameter = 960
          format = d3.format(",d"),
          color = d3.scale.category20c();

            var bubble = d3.layout.pack()
              .size([d, d])
              .padding(1.5);

          var svg = d3.select("#state_chart").append("svg")
              .attr("width", w)
              .attr("height", h)
              .attr("class", "bubble");

          var node = svg.selectAll("circle")
               .data(data)
               .enter()
               .append("circle")
               .attr("cx", function(d, i) {
                return (i * 125) + 35;
              })
             .attr("cy", w/5)
             .attr("r", function(d) {
                  return d["count"] / 125;
             })
            .transition()
            .duration(2000);

          var labels = svg.selectAll("text")
             .data(data)
             .enter()
             .append("text")
             .text(function(d) {
                  return d["word"];
             })
             .attr("cx", function(d, i) {
                return (i * 125) + 35;
              })
             .attr("cy", w/5)

          // node.append("text")
          //    .attr("font-size", "24px")
          //    .attr("font-family", "sans-serif")
          //    .attr("fill", "black")
          //    .text(function(d) { return d["word"]; });
  });
} // ends function
