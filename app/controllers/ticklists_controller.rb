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
            path = find_path(start, @length*3, @length);
            score = score_path(path)
            if score > bestscore
               bestpath = path 
               bestscore = score
            end
        end
        @climbs = bestpath
    else
        params["difficulty"] = 13
        params["length"] = 5
    end
    
  end

  #find the best possible path
  def find_path(root, parent=nil, depth, length)
    print " "*(@length*3-depth)
    puts "find_path called on #{root.name} with depth=#{depth} length=#{length}\n"
    return [root] if depth == 0 #return the root if we've reached the end of our search depth
    return [root] if length == 1 and root.difficulty <= @maxdiff
    bestscore = 0;
    bestpath = nil;
    root.adjacent_climbs.each do |child|
      next if child == parent #time travel?
      newpath = find_path(child, depth-1, child.difficulty <= @maxdiff ? length-1 : length)
      newscore = score_path(newpath)
      if newscore > bestscore
        bestpath = newpath 
        bestscore = newscore
      end
    end
    return [root] + bestpath
  end

  def score_path(path) 
    score = 0;
    #filter
    eligible = path.select{|c| c.difficulty <= @maxdiff}

    #reward for eligible
    score += eligible.uniq.size

    #penalize for duplicates
    score -= eligible.size - eligible.uniq.size

    #reward for being close to the target length
    score += @length/path.size

    return score

    #the best path is the path with the highest score, where a path's score is equal to (patheligible.size/targetsize)/path.size.
    #This maximizes the eligible size and minimizes the total size. a perfect score will be 1 (all nodes in the path are eligible,
    #and the path size is the same as the target size. 
    #(path.select{|c| c.difficulty <= @maxdiff}.size/@length)*(1/path.size)
  end
end



