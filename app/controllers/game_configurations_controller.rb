require 'game_configurations_helper'
include GameConfigurationsHelper
class GameConfigurationsController < ApplicationController
  def created
    
    o1 = store_parse(params)
    
    converter(o1)    
    storing = GameConfiguration.new :gameName => o1[:gameName], :nonRepeat => @ans1, :repeat => @ans2
    storing.save
  end
  
  def createGame
    
  end

  def createLevel
    query = GameConfiguration.all(:conditions => {:gameName => params["gameName"]})
    v = query.first
     
    @ans1 = v[:nonRepeat]
    @ans2 = v[:repeat]
    @str0 = '<form method=post action=/createdLevel/'+params['gameName']+'>'
    #@str1 = singleElements ans1
    #@str2 = multipleElements ans2
    @str3 = script @ans2
  end
  
  def showGames
    #@games = GameConfiguration.find(:all).to_a.map {|x| x["gameName"]}
    @games = Active.find(:all).to_a.map {|x| x["gameName"]}
    #query = GameConfiguration.all(:conditions => {:gameName => params["gameName"]})
  end
  
  def activeGames
    @acttiveGames = Active.find(:all).to_a.map {|x| x["gameName"]}

  end
  
  def addToActiveGames
    storing = Active.new :gameName => params["AddGame"]
    
    storing.save
    redirect_to "/all"
  end
  
  def all
    @games = GameConfiguration.find(:all).to_a.map {|x| x["gameName"]}
    
  end
  
  def delete
    gameName = params[:gameName]
    Active.where("gameName" => gameName).delete_all
    redirect_to '/showGames'
  end
  
  def deleteCompletely
     
    @gameName = params[:delGameName]
    GameConfiguration.where(gameName:@gameName).delete_all
    Level.where(@gameName=>{"$exists"=>true}).delete_all
    Sequence.where(gameName:@gameName).delete_all
    Experiment.where(gameName:@gameName).delete_all
    redirect_to "/all"
    
  end
  
end
