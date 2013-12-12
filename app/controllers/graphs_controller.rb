class GraphsController < ApplicationController
  def show
    # Show a graph of all the climbs in the database
    
  end

  def json
    @climbs = Climb.all
    @paths = Path.all
    render "graph.json"
  end
end
