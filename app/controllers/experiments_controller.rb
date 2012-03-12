class ExperimentsController < ApplicationController
  def create
    @gameName = params["gameName"]
    binding.pry
    @sequenceNames = Level.only(@gameName+'.levelname').to_a.map {|x| x[@gameName]["levelname"]}
  end

  def created
  end

  def xml
  end
end
