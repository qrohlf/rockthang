class GraphsController < ApplicationController
  def show
    # Show a graph of all the climbs in the database
    # hideously hacky solution that should be done client-side.
    @addnodejs = ""
    Climb.all.each do |climb| 
        @addnodejs += "nodes.push({'id': #{climb.id}', 'name': label: '#{climb.name}');\n"
    end
    @edgesjs = ""
    Path.all.each do |path|
        @edgesjs += "sigInst.addEdge('#{path.id}', '#{path.climb1.id}', '#{path.climb2.id}');\n"
    end
  end

  def json
    @climbs = Climb.all
    @paths = Path.all
    render "graph.json"
  end
end
