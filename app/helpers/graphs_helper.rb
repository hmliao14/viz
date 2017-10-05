module GraphsHelper

  def render_bar_graph
    bar_chart @listing.group(:category).group(@graph.x_axis).count, download: 'bar_chart',
    xtitle: @graph.x_axis.upcase, ytitle: "Number of Job Listings", height: "100%"
  end

  def render_pie_graph
    pie_chart @listing.group(@graph.x_axis).count,download: 'pie_chart',
    xtitle: @graph.x_axis.upcase, ytitle: "Number of Job Listings", height: "100%"
  end

  def render_line_graph
    line_chart @listing.group(:category).group(@graph.x_axis).count, download: 'line_chart',
    xtitle: @graph.x_axis.upcase, ytitle: "Number of Job Listings", height: "100%"
  end

  def render_column_graph
    column_chart @listing.group(:category).group(@graph.x_axis).count, download: 'column_chart',
    xtitle: @graph.x_axis.upcase, ytitle: "Number of Job Listings", height: "100%"
  end

  def filter_listing_by_top_cities
    #grabbing array of cities
    cities = @listing.top(:city,11)
    i = 1
    graph_id = params[:id]
    @graph = Graph.find_by_id(graph_id)
    category_restricts = @graph.search_categories.map { |category|
      category = 'category = ' + "'#{category.name}'"
    }
    category_restricts = category_restricts.join(" OR ")
    filtered_association =  JobListing.where("city = '#{cities.keys[0]}'
            AND city <> 'City N/A' AND (#{category_restricts}) ")
    (cities.length-1).times do
      new_record = JobListing.where("city = '#{cities.keys[i]}'
            AND city <> 'City N/A' AND (#{category_restricts}) ")
      filtered_association = filtered_association.or(new_record)
      i = i + 1
    end
    @listing = filtered_association
  end
end
