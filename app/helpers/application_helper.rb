module ApplicationHelper
  def label_TextField_helper labelName, textFieldID, placeHolderText
    html = "#{label_tag labelName}"
    html << "#{text_field_tag textFieldID, nil , :placeholder => placeHolderText}"
    html.html_safe 
  end
  
  
 
end
