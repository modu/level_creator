class SequencesController < ApplicationController
  def create
    @gameName = params["gameName"]
    @levelNames = Level.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
  end

  def created
    ob = store_sequence params
    Sequence.create ob
  end

  def xml
    sn = params[:sequenceName]
    seqOb = Sequence.all_of('sequenceName' => sn).first
    #binding.pry
    render :xml => seqOb
  end
  
  def show
    @gameName = params[:gameName]
    @sequenceNames = Sequence.where(gameName:@gameName).to_a.map{|x| x["sequenceName"]}
    
  end
  
end
