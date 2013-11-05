class GraphsController < ApplicationController
  def show
    # Show a graph of all the climbs in the database
    # hideously hacky solution that should be done client-side.
    
  end

  def json
    @climbs = Climb.all
    @paths = Path.all
    render "graph.json"
  end
end
