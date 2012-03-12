class SequencesController < ApplicationController
  def create
    @gameName = params["gameName"]
    binding.pry
    @levelNames = Level.only(@gameName+'.levelname').to_a.map {|x| x[@gameName]["levelname"]}
  end

  def created
    ob = store_sequence params
    binding.pry
    #Sequence.create ob
  end

  def xml
    sn = params[:sequenceName]
    seqOb = Sequence.all_of('sequenceName' => sn).first
    binding.pry
    render :xml => seqOb
  end
end
