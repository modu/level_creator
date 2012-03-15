class ExperimentsController < ApplicationController
  def create
    @gameName = params["gameName"]
    @sequenceNames = Sequence.where(gameName:@gameName).to_a.map{|x| x["sequenceName"]}
    #@sequenceNames = Sequence.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
  end

  def created
    ob = store_experiment params
    Experiment.create ob    
  end

  def xml
    sn = params[:experimentName]
    seqOb = Experiment.all_of('experimentName' => sn).first
    
    render :xml => seqOb
  end
  
  def show
    @gameName = params[:gameName]
    @experimentName = Experiment.where(gameName:@gameName).to_a.map{|x| x["experimentName"]}
    
  end
  
  def ShowSequenceRandomXml
    i = []
    @gameName = params[:gameName]
    @experimentName = params[:experimentName]
    #@sequenceNames = Experiment.where(gameName:@gameName).where({gameName:@gameName,experimentName:@experimentName}).to_a.map{|x| x["sequenceName"]}
    #@sequenceNames = Experiment.where(gameName:@gameName).where(experimentName:"firstone").to_a 
    @sequenceNames = Experiment.where(gameName:@gameName).where(experimentName:@experimentName).to_a.first.sequences.each {|b| b.each_value{|v| i.push(v)}} 
    i.delete_at(0)
    i = i.sort_by{rand}
    #i.delete_at(0)
    seqOb = Sequence.all_of('sequenceName' => i[1]).first
    
    if seqOb!=nil
      render :xml => seqOb
    end
    #binding.pry
  end
  
end
