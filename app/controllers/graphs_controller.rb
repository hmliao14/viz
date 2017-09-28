class GraphsController < ApplicationController
  def new
    @graph = current_user.graphs.build
  end

  def create
    @graph = current_user.graphs.build(graph_params)
  end

  private

  def graph_params
    params.require(:graph).permit(:title, :description, :id, :image)
  end

end
