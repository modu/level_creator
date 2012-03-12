class GameConfiguration
  include Mongoid::Document
  
  def self.store_parse(hash)
     ans = {}
     ans[:gameName] = hash["gameName"]
     ans[:elements] = []
     i = 1
     while hash.has_key? 'elementName'+i.to_s
        type = hash['elementInputType'+i.to_s] == 'textBox' ? :textBox : :dropDown
        repeat = nil
        case hash['elementRepeatability'+i.to_s]
           when 'single'
             repeat = :single
           when 'multiple'
             repeat = :multiple
           when 'commaSeperatedMultiple'
             repeat = :multiple
        end
        ans[:elements] << { :name => hash['elementName'+i.to_s], :type => type, :repeat => repeat }
        puts i if type == :dropDown
        ans[:elements][-1][:options] = hash['elementOptions'+i.to_s].split(',') if type == :dropDown
        i = i+1
     end
     puts ans
     return ans
  end  
end
