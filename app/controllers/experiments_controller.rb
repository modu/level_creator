class ExperimentsController < ApplicationController
  def create
    @gameName = params["gameName"]
    @sequenceNames = Sequence.where(gameName:@gameName).to_a.map{|x| x["sequenceName"]}
    #@sequenceNames = Sequence.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
  end

  def created
    ob = store_experiment params
    binding.pry
    Experiment.create ob    
  end

  def xml
    sn = params[:experimentName]
    seqOb = Experiment.all_of('experimentName' => sn).first
    #binding.pry
    render :xml => seqOb
  end
end
