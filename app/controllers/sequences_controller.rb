class SequencesController < ApplicationController
  def create
    @gameName = params["gameName"]
    @levelNames = Level.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
  end

  def created
    binding.pry
    ob = store_sequence params
    Sequence.create ob
  end

  def xml
    obj = {}
    seqOb = Sequence.where('sequenceName' => params[:sequenceName]).to_a[0]
    obj['gameName'] = seqOb['gameName']
    obj['levels'] = seqOb['levels']
    obj['sequenceName'] = seqOb['sequenceName']
    out = create_xml(obj, '')
    #binding.pry
    r = "<hash>"+out+"</hash>\n"
    #binding.pry
    render :xml => r
  end
  
  def show
    @gameName = params[:gameName]
    @sequenceNames = Sequence.where(gameName:@gameName).to_a.map{|x| x["sequenceName"]}
    
  end
  
end
