class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def store_parse(hash)
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
        ans[:elements][-1][:options] = hash['elementOptions'+i.to_s].split(',') if type == :dropDown
        i = i+1
     end
     puts ans
     return ans
  end
  
  def store_sequence(hash)
       ans = {}
       ans[:gameName] = hash["gameName"]
       ans[:sequenceName] = hash["sequenceName"]     
       ans[:levels] = {}
       ans[:levels][:level] = []
       i = 1
       while hash.has_key? 'level'+i.to_s
          ans[:levels][:level] << hash['level'+i.to_s]
          i = i+1
       end
       return ans
  end
  
  def store_experiment(hash)
     ans = {}
     ans[:gameName] = hash["gameName"]
     ans[:experimentName] = hash["experimentName"]     
     ans[:sequences] = {}
     ans[:sequences][:sequence] = []
     i = 1
     while hash.has_key? 'sequence'+i.to_s
        ans[:sequences][:sequence] << hash['sequence'+i.to_s] 
        i = i+1
     end
     return ans
  end  
  
  def converter(hash)
     @ans1 = []
     @ans2 = []
     hash[:elements].each do |e|
        h = { :name => e[:name], :type => e[:type] }
        if e[:type] == :dropDown
           h[:options] = e[:options]
        end
        if e[:repeat] == :single
           @ans1 << h
        else
           ary = e[:name].split('.')
           
           st = ary[0]+'.'+ary[1]+'.'+ary[2]
           found = false
           @ans2.each do |b|
              ary2 = b[0][:name].split('.')
              st2 = ary2[0] + '.' + ary2[1] + '.' + ary2[2]
              if st == st2
                 found = true
                 b << h
                 break
              end
           end
           if !found
              @ans2 << [h]
           end
        end
     end
  end
  
  def nest(words, hash)
     out = hash
     words.each do |w|
        out[w] = {} unless out.has_key? w
        out = out[w]
     end
     return out
  end

  def num(str)
     ans = ''
     str.reverse.each_char do |c|
        break unless c.to_i != 0 or (c.to_i == 0 and c == '0')
        ans = c + ans
     end
     return ans.to_i
  end

  def nnum(str)
     ans = ''
     str.each_char do |c|
        break if c.to_i != 0 or (c.to_i == 0 and c == '0')
        ans = ans + c
     end
     return ans
  end

  def extend(ary, sz)
     until ary.size >= sz
        ary.push nil
     end
  end

  def store_level(input_hash)
     ans = {}
     input_hash.each do |key,value|
        key_type = key.count '.'
        keys = key.split('.')
        case key_type
           when 1
              h = nest(keys[0...-1], ans)
              h[keys[-1]] = value
           when 2
              idx = num(keys[-1])
              if idx == 0
                 h = nest(keys[0...-1], ans)
                 h[keys[-1]] = value.split(',')
              else
                 h = nest(keys[0...-1], ans)
                 x = num(keys[-1])
                 k = nnum(keys[-1])
                 h[k] = [] unless h.has_key? k
                 extend(h[k], x)
                 h[k][x-1] = value
              end
           when 3
              h = nest(keys[0...-2], ans)
              x = num(keys[-1])
              k = nnum(keys[-1])
              h[keys[-2]] = [] unless h.has_key? keys[-2]
              extend(h[keys[-2]], x)
              h[keys[-2]][x-1] = {}  if h[keys[-2]][x-1] == nil
              h[keys[-2]][x-1][k] = value
           when 4
              h = nest(keys[0...2], ans)
              x = num(keys[-1])
              k = nnum(keys[-1])
              h[keys[2]] = [] unless h.has_key? keys[2]
              extend(h[keys[2]], x)
              h[keys[2]][x-1] = {} if h[keys[2]][x-1] == nil
              h = nest(keys[3...-1], h[keys[2]][x-1])
              h[k] = value.split(',')
        end 
     end
     return ans
  end
  
  def create_xml(hash, space)
     xml = ''
     hash.each do |k,v|
        # 
        if v.class == String
           xml << space + "<#{k}>#{v}</#{k}>\n"
        else
           if v.class == Array
              v.each do |ih|
                unless ih.class == String
                 xml << space + "<#{k}>\n"
                 xml << create_xml(ih, space+'  ')
                 xml << space + "</#{k}>\n"
                else
                  xml <<  space + "<#{k}>#{ih}</#{k}>\n"
                end  
              end
           else
              xml << space + "<#{k}>\n"
              xml << create_xml(v, space+'  ')
              xml << space + "</#{k}>\n"
           end
        end
     end
     return xml
  end
  
  
end
