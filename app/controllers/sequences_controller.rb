class SequencesController < ApplicationController
  def create
    @gameName = params["gameName"]
    @levelNames = Level.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
  end

  def created
    
    ob = store_sequence params
    Sequence.create ob
    redirect_to "/showGames"
  end

  def xml
    obj = {}
    seqOb = Sequence.where('sequenceName' => params[:sequenceName]).to_a[0]
    obj['gameName'] = seqOb['gameName']
    obj['levels'] = seqOb['levels']
    obj['sequenceName'] = seqOb['sequenceName']
    out = create_xml(obj, '')
    r = "<hash>"+out+"</hash>\n"
    render :xml => r
  end
  
  def show
    @gameName = params[:gameName]
    @sequenceNames = Sequence.where(gameName:@gameName).to_a.map{|x| x["sequenceName"]}
  end 
  
  def delete
    @i = []
    @gameName = params["gameName"]
    @SequenceName = params["delSequenceName"]
    t = Experiment.where(gameName:@gameName,"sequences.sequence" => @SequenceName).to_a.map {|x| @i<<x["experimentName"]}    
    if t.empty?
      @t = Sequence.where(gameName:@gameName,sequenceName:@SequenceName).delete_all
       
      render 'delete'
      return
    end
    
    render 'message'
  end
  def update
    @i = []
    @gameName = params["gameName"]
    @sequenceName = params["upSequenceName"]
    @levelNames = Level.where(@gameName+'.levelname'=>{"$exists"=>true}).to_a.map {|x| x[@gameName]["levelname"]}
    t = Sequence.where(gameName:@gameName,sequenceName:@sequenceName).to_a.map{|t| t["levels"]["level"]}
    t[0].each do |x|
      @i << x
    end
     
  end
  
  def updated
    @gameName = params[:gameName]
    @sequenceName = params[:oldSequenceName]
    ob = store_sequence params
     
    Sequence.where(gameName:@gameName,sequenceName:@sequenceName).update_all(ob)
    
    
  end
  
end
