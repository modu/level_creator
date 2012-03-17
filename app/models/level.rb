class Level
  include Mongoid::Document
  
=begin
  def self.to_hash
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
  end
=end
  
end
