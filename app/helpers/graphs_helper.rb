module GraphsHelper

  def render_bar_graph
    bar_chart @listing.group(@graph.x_axis).count, yAxis: {title: {text: 'hello'}}, height: "100%",
    ytitle: "Number of Job Listings",
    colors: ["#b00", "#666"],
     library: {
      download: 'column_chart',
      xtitle: @graph.x_axis.upcase,ytitle: "Number of Job Listings",
      yAxis: {
        title: {text: 'hellloooooooo'},
          ytitle: "Number of Job Listings",
          labels: {
              enabled: false
          }
      },
    }

  end

  def render_line_graph
    line_chart @listing.group(@graph.x_axis).count,download: 'line_chart',
     xtitle: @graph.x_axis.upcase, ytitle: "asdasda", height: "100%",
     library: {backgroundColor: "#eee"}
  end
end
