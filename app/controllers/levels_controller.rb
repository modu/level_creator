class LevelsController < ApplicationController
  def created
    obj = Level.create store_level(params)
  end
  
  def xml
    obj = Level.all(:conditions => {(params["gameName"]+'.levelname').to_sym => params["levelName"]}).to_a[0]
    render :xml => obj
  end
end
