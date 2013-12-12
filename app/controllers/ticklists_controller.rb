class TicklistsController < ApplicationController
  def show
    @debug = String.new
    # If the parameters are set properly, generate a ticklist. Otherwise show the ticklist form.
    visited = Array.new # use an array to track which climbs have been visited
    puts params
    if params["difficulty"] and params["length"]
        @maxdiff = params["difficulty"].to_i
        @length = params["length"].to_i
        
        starts = Climb.all.select do |climb|
            climb.difficulty <= @maxdiff
        end

        bestpath = nil; 
        bestscore = 0;

        starts.each do |start|
            @visited = Hash.new
            path = find_path(start, @length*3, @length);
            score = score_path(path)
            puts "path is:"
            path.each_with_index do |c, i|
              puts "  #{i}. #{c.name}"
            end
            puts "score for this path is #{score}"
            if score > bestscore
               bestpath = path 
               bestscore = score
            end
        end
        @climbs = bestpath
    else
        params["difficulty"] = 16
        params["length"] = 5
    end
    
  end

  #find the best possible path
  def find_path(root, parent=nil, depth, length)
    @visited[root.id] = true
    print " "*(@length*3-depth)
    puts "find_path called on #{root.name} with depth=#{depth} length=#{length}\n"
    return [root] if depth == 0 #return the root if we've reached the end of our search depth
    return [root] if length == 1 and root.difficulty <= @maxdiff
    bestscore = 0;
    bestpath = nil;
    root.adjacent_climbs.each do |child|
      next if child == parent #time travel?
      next if @visited[child.id]
      newpath = find_path(child, depth-1, child.difficulty <= @maxdiff ? length-1 : length)
      newscore = score_path(newpath)
      if newscore > bestscore
        bestpath = newpath 
        bestscore = newscore
      end
    end
    return [root] if bestpath.nil?
    return [root] + bestpath
  end

  def score_path(path) 
    score = 0;
    #filter
    eligible = path.select{|c| c.difficulty <= @maxdiff}

    #reward for eligible
    score += eligible.size*2

    #penalize for ineligible
    score -= path.size - eligible.size

    #reward for being close to the target length
    #score = (@length - path.size).abs

    return score
  end
end



