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
      if valid_dates == false
        redirect_back fallback_location: new_graph_path
      elsif params["search_categories"]["name"].length > 1
        @graph = current_user.graphs.build(graph_params)
        @user = current_user
        insert_categories
        if @graph.save
          redirect_to graph_path(@graph)
        else
          flash[:error] = "A graphs title must be between 1 and 200 characters."
          redirect_back fallback_location: new_graph_path
        end
      else
        flash[:error] = "Search categories cannot be empty"
        redirect_back fallback_location: new_graph_path
      end
    else
      flash[:error] = "Not permitted action"
      redirect_back fallback_location: new_graph_path
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
    date_restricts = " AND post_date >= '#{@graph.job_begin_date}'
    AND post_date <= '#{@graph.job_end_date}' "
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
      if valid_dates == false
        redirect_back fallback_location: edit_graph_path
      elsif params["search_categories"]["name"].length > 1
        @graph.update(graph_params)
        @graph.search_categories.destroy_all
        insert_categories
        if @graph.valid?
          redirect_to graph_path(@graph)
        else
          flash[:error] = "A graphs title must be between 1 and 200 characters."
          redirect_back fallback_location: edit_graph_path
        end
      else
        flash[:error] = "Search categories cannot be empty"
        redirect_back fallback_location: edit_graph_path
      end
    else
      flash[:error] = "Not permitted action"
      redirect_back fallback_location: edit_graph_path
    end
  end

  private
  def valid_dates
    bDate = params["graph"]["job_begin_date"]
    eDate = params["graph"]["job_end_date"]
    if bDate.empty? || eDate.empty? || bDate > eDate || bDate > Time.now.strftime('%Y-%m-%d')
      flash[:error] = "Invalid date range"
      return false
    end
  end

  def insert_categories
    @scParams = params["search_categories"]["name"]
    if @scParams.include?('All')
      JobCategory.all[0..-2].each do |category|
        new_category = SearchCategory.new
        new_category[:name] = category[:name]
        @graph.search_categories << new_category
      end
    else
      @scParams.each do | category|
        if !category.empty?
          new_category = SearchCategory.new
          new_category[:name] = category
          @graph.search_categories << new_category
        end
      end
    end
  end

  def graph_params
    params.require(:graph).permit(:title, :x_axis, :width, :height,
      :y_axis, :graph_type, :job_begin_date, :job_end_date)
    end

  def search_categories_params
      params.require(:search_categories).permit(:name)
  end

end
