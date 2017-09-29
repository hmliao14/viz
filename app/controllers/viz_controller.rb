class VizController < ApplicationController

  def index
    # figaro    gem for hiding specific

    @listings = JobListing.all

  end

  # @response.parsed_response.class = > hash


end
