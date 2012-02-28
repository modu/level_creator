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
             repeat = :comma
        end
        ans[:elements] << { :name => hash['elementName'+i.to_s], :type => type, :repeat => repeat }
        i = i+1
     end
     return ans
  end
  
end
