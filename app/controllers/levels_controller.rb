class LevelsController < ApplicationController
  def created
    obj = Level.create store_level(params)
  end
  
  def xml
    
    obj = Level.all(:conditions => {(params["gameName"]+'.levelname').to_sym => params["levelName"]}).to_a[0]
    if obj == nil
      obj = Level.all(:conditions => {(params["gameName"]+'.levelName').to_sym => params["levelName"]}).to_a[0]
    end
    render :xml => obj
  end
  
  def show
    @gameName = params["gameName"]
    @levelNames = Level.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
    if @levelNames.length==0
      @levelNames = Level.where(@gameName+'.levelName'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelName"]}
    end

  end
end

