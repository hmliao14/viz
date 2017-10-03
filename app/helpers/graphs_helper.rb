module GraphsHelper

  def render_bar_graph
    bar_chart @listing.group(@graph.x_axis).count, height: "100%", library: {
      download: 'column_chart',
      xtitle: @graph.x_axis.upcase,ytitle: "Number of Job Listings",
      yAxis: {
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
