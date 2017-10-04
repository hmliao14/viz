module GraphsHelper

  def render_bar_graph
    bar_chart @listing.group(:category).group(@graph.x_axis).count
  end

  def render_line_graph
    line_chart @listing.group(:category).group(@graph.x_axis).count
  end
end
