module GameConfigurationsHelper
  def singleElements ary
      html = ''
      ary.each do |elem|
        case elem["type"]
           when :textBox
            html << "#{content_tag :label, elem["name"]}"
            html << "#{text_field_tag elem["name"],''}"
            html << '<br><br />'
           when :dropDown
            option = ""
            elem["options"].each do |t|
              option << "#{content_tag :option, t.to_s} "
            end  
            html << "#{content_tag :label, elem["name"].to_s}"
            html << "#{select_tag elem["name"].to_s,(option.html_safe) } <br><br />"
            
        end           #end of case statement
      end             #end of each.do       
      return html
  end
  
  def multipleElements ary
      html = ''
      ary.each_index do |i|
        div = ary[i]
        html << "<hr style=\"background-color:#000000;height:2px\"/>"
        html << "<div id=\"#{i.to_s+'d'+1.to_s}\" class=\"#{'c'+i.to_s}\" >"
        html << "<hr/>"
        div.each do |elem|
          case elem["type"]
             when :textBox
               html << "<label>#{elem["name"]}</label>"
               html << "<input type=\"text\" name=\"#{elem["name"]}1\" id=\"#{elem["name"]}1\" />"
               html << '<br><br />'
             when :dropDown
               option = ""
               elem["options"].each do |t|
                 option << "#{content_tag :option, t.to_s} "
               end  
               html << "#{content_tag :label, elem["name"].to_s}"
               html << "#{select_tag elem["name"].to_s+'1',option.html_safe } <br><br />"
          end
        end
        html << "</div><br><br />"
        html << "<input type=\"button\" id=\"b#{i}\" value=\"add\">"
      end
      return html
  end
  
  def script ary
    javascript = ''
    #binding.pry
    ary.each_index do |i|
      str = ary[i].map { |x| '\'' + x["name"].gsub('.', '\\\\\\\\.') + '\'' }.join ','
      javascript << '$("#b' + i.to_s + '").click(gen_add("' + 'c'+i.to_s+'","'+ i.to_s+'d' + '",[' + str + '], "nil"))'
      javascript << ';'
    end
    javascript.html_safe
  end
  	
end
