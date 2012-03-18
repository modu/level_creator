class LevelsController < ApplicationController
  def created
    obj = Level.create store_level(params)
    redirect_to "/showGames"
    #render  :action    "game_configurations/showGames"
  end
  
  def xml
    obj = {}
    obj[params['gameName']] = Level.where(params["gameName"]+'.levelname'=>params["levelName"]).to_a[0][params['gameName']]
    if obj.length == 0
      obj[params['gameName']] = Level.where(params["gameName"]+'.levelName'=>params["levelName"]).to_a[0][params['gameName']]
    end
    out = create_xml(obj, '')
    render :text => out, :content_type => 'text/xml'
  end
  
  def show
    @gameName = params["gameName"]
    @levelNames = Level.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
    if @levelNames.length==0
      @levelNames = Level.where(@gameName+'.levelName'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelName"]}
    end
  end
  
end

