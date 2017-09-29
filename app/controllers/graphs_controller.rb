class GraphsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @graphs = Graph.all
  end

  def new
    @graph = current_user.graphs.build

  end

  def create
    @graph = current_user.graphs.build(graph_params)
    @user = current_user
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
  end

  private

  def graph_params
    params.require(:graph).permit(:title, :x_axis, :y_axis, :graph_type)
  end

end
