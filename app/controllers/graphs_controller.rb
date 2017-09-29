class GraphsController < ApplicationController

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
      redirect_to user_path(@user)
    end
  end

  private

  def graph_params
    params.require(:graph).permit(:title, :x_axis, :y_axis)
  end

end
