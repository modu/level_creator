module GameConfigurationsHelper
  $example_out1 = [{:name => 'angleAstroid.levelName', :type => :textBox},
                  {:name => 'angleAstroid.gamePlayMode', :type => :dropDown, :options => [:Angle,:Time]},
                  {:name => 'angleAstroid.background', :type => :dropDown, :options => [:bg1, :bg2, :bg3, :bg4]},
                  {:name => 'angleAstroid.totaltrials', :type => :textBox}]

  $example_out2 = [[{:name => 'angleAstroid.questions.question.angle', :type => :textBox},
                   {:name => 'angleAstroid.questions.question.meteor', :type => :dropDown, :options => [:pinkmetor, :blackmeteor, :bluemeteor]},
                   {:name => 'angleAstroid.questions.question.position', :type => :textBox}
                  ],
                  [{:name => 'angleAstroid.stones.stone.aftertime', :type => :textBox},
                   {:name => 'angleAstroid.stones.stone.time', :type => :textBox},
                   {:name => 'angleAstroid.stones.stone.center', :type => :textBox}
                  ],
                  [{:name => 'angleAstroid.kcs.kc.kcname', :type => :textBox},
                   {:name => 'angleAstroid.kcs.kc.items.item', :type => :textBox},
                  ]
                 ]

  


  def render 
    html = ""
    $example_out1.each do |temp|
      case temp[:type]
      when :textBox
        html << "</br>#{ 
        content_tag :div , :class => "row" do
          content_tag( :label, temp[:name])  +
          text_field_tag( temp[:name],'') 
        end
        }"
      when :dropDown
        @option = ""
        temp[:options].each do |t|
          @option << "#{content_tag :option, t.to_s }"
        end
        html << "</br> #{content_tag :div, :class => "row" do
                  content_tag( :label,  temp[:name].to_s ) +
                  select_tag( temp[:name].to_s, (@option.html_safe))
                  end } "
      end
    end
    html.html_safe
  end  #end of render function
  
  def anything
    html = ''
    
    $example_out2.each do |j|
      j.each do |k|
        case k[:type]
        when :textBox
          @temp1 = "#{content_tag :div, :class => "span4" do
             text_field_tag( k[:name], nil ,:placeholder => k[:name] )
          end }"
          @temp1 << "#{content_tag :div, :class => "span4" do
              label_tag( nil, k[:name] )
          end }"
          html << "</br>#{ content_tag :div, :class => "row" do    
          @temp1.html_safe  
          end } "
        when :dropDown
          @option = ""
          k[:options].each do |t|
            @option << "#{content_tag :option, t.to_s }"
          end
          html << "</br> #{content_tag :div, :class => "row" do
                    content_tag :div, :class => "span4" do
                       content_tag( :label,  k[:name]  ) 
                     end
                    content_tag :div, :class => "span4" do 
                      select_tag( k[:name], (@option.html_safe)) 
                    end
                    
                  end
                     } "
          binding.pry          
        end
                             
      end        #end of inner each 
    end          #end of outer each
    html.html_safe
  end #end of function
    
end
