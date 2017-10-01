class GraphsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @graphs = Graph.all
  end

  def new
    @graph = current_user.graphs.build

  end

  def create
    if search_categories_params.permitted? && graph_params.permitted?
      @graph = current_user.graphs.build(graph_params)
      @user = current_user

      if params["search_categories"]["name"].length > 2
        params["search_categories"]["name"].each do | category|
          if !category.empty?
            new_category = SearchCategory.new
            new_category[:name] = category
            @graph.search_categories << new_category
          end
        end
      else
        render new_graph_path(@user)
      end

    else
      render new_graph_path(@user)
    end
    if @graph.save
      redirect_to graph_path(@graph)
    end
  end

  def destroy
    graph_id = params[:id]
    graph = Graph.find_by_id(graph_id)
    graph.destroy
    redirect_back(fallback_location: root_path)
  end

  def show
    graph_id = params[:id]
    @graph = Graph.find_by_id(graph_id)
    category_restricts = @graph.search_categories.map { |category|
      category = 'category = ' + "'#{category.name}'"
    }
    category_restricts = category_restricts.join(" OR ")
    date_restricts = " AND post_date >= '#{@graph.job_begin_date}'"
    conditions = "(" + category_restricts + ")" + date_restricts
    @listing = JobListing.where(conditions)

  end

  def edit
    graph_id = params[:id]
    @graph = Graph.find_by_id(graph_id)
  end

  def update
    if search_categories_params.permitted? && graph_params.permitted?
      graph_id = params[:id]
      @graph = Graph.find_by_id(graph_id)
      @graph.search_categories.destroy_all
      @graph.update(graph_params)

      if params["search_categories"]["name"].length > 1
        params["search_categories"]["name"].each do | category|
          if !category.empty?
            new_category = SearchCategory.new
            new_category[:name] = category
            @graph.search_categories << new_category
          end
        end
      else
        render edit_graph_path(@graph)
      end

    else
      render edit_graph_path(@graph)
    end
    redirect_to graph_path(@graph)
  end

  private

  def graph_params
    params.require(:graph).permit(:title, :x_axis, :y_axis, :graph_type, :job_begin_date)
  end

  def search_categories_params
    params.require(:search_categories).permit(:name)
  end

end
