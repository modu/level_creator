class ExperimentsController < ApplicationController
  def create
    @gameName = params["gameName"]
    @sequenceNames = Sequence.where(gameName:@gameName).to_a.map{|x| x["sequenceName"]}
    
  end

  def created
    ob = store_experiment params
    Experiment.create ob    
    redirect_to "/showGames"
  end

  def xml    
    obj = {}
    expOb = Experiment.where('experimentName' => params[:experimentName]).to_a[0]
    obj['gameName'] = expOb['gameName']
    obj['sequences'] = expOb['sequences']
    obj['experimentName'] = expOb['experimentName']
    out = create_xml(obj, '')
    r = "<hash>"+out+"</hash>\n"
    #binding.pry
    render :xml => r
  end
  #rabel
  def show
    @gameName = params[:gameName]
    @experimentName = Experiment.where(gameName:@gameName).to_a.map{|x| x["experimentName"]}
  end
  
  def ShowSequenceRandomXml
    i = []
    @gameName = params[:gameName]
    @experimentName = params[:experimentName]
    
    @sequenceNames = Experiment.where(gameName:@gameName,experimentName:@experimentName).to_a.first.sequences["sequence"].each{|b| i<<b.values} 
    
    i.delete_at(0)
    i = i.sort_by{rand}
    #i.delete_at(0)
    seqOb = Sequence.all_of('sequenceName' => i[0][0]).first
    
    if seqOb!=nil
      render :xml => seqOb
    end
    
    #binding.pry
  end
  
end
