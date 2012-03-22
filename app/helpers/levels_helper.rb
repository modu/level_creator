module LevelsHelper
  
  def error_message list
    if list.nil?
      return 
    end
      
    html = ''
    html <<"Following Sequence Contains Level you want to delete"
    list.each do |t|
      html <<"</br>"
      html <<t
      end
    return html.html_safe   
     
  end
end
