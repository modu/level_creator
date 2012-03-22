// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function() {
	$('#DelSequenceButton').attr('disabled',true)
	$('#itembuttondelete').attr('disabled',true)
	
	
	$('#buttonadd').click(gen_add('clone', 'cloneId', ['elementName','elementInputType', 'elementRepeatability', 'elementOptions'], 'itembuttondelete') )

	$('#itembuttondelete').click(del_but('itemclone','item','itembuttonadd','itembuttondelete'))

	$('#AddSequenceButton').click(gen_add('clone','cloneID',['level'],'DelSequenceButton'))
	$('#DelSequenceButton').click(del_but('clone','cloneID','AddSequenceButton','DelSequenceButton'))
	$('#AddExperimentButton').click(gen_add('clone','cloneID',['sequence'],'DelExperimentButton'))
	$('#DelExperimentButton').click(del_but('clone','cloneID','AddExperimentButton','DelExperimentButton'))
	
	
	
	
	function gen_add(class_name, div_name, button_id, del_button_id) {
		return function() {
 		var num = $('.'+class_name).length;
	    var newNum  = new Number(num + 1);      // the numeric ID of the new input field being added
		var newElem = $('#'+div_name + num).clone().attr('id', div_name + newNum);
        for(var i in button_id) {
	       newElem.children('#'+button_id[i]+num).attr('id', button_id[i]+newNum).attr('name', button_id[i]+newNum).attr('value', '');
        }
        $('#'+div_name+num).after(newElem);
        if(newNum == 1) {
	       $('#'+del_button_id).attr('disabled', true);
        } else {
	       $('#'+del_button_id).attr('disabled', false);	
        }
        } // end return function
	}
	function del_but(class_name, div_name, add_button_id, del_button_id) {
		return function() {
			var num = $('.'+class_name).length;
			$('#'+div_name+num).remove();
			$('#'+add_button_id).attr('disabled', false);
		    if (num-1 == 1)
		      $('#'+del_button_id).attr('disabled', true);
		
		} //end of return function
	}	
	
	//function to show hide element by ID,class 
	function show_hide(show_list_id ,show_list_class, hide_list_id, hide_list_class){
		return function() {			
			if(show_list_id.length > 1){
			for(var i in show_list_id){
				$("#"+show_list_id[i]).show();
			
			   }
		    }
			if(show_list_class.length > 1){
			for(var i in show_list_class){
				$("."+show_list_class[i]).show();
			
			}
		}
		
			if(hide_list_id.length >1 ){
			for(var x in hide_list_id){
				$("#"+hide_list_id[x]).hide();				
			}
		}
			if(hide_list_id.length >1) {
			for(var x in hide_list_class){
				$("."+hide_list_class[x]).hide();
			}
		}
			
		} //end of return function
	}		//end of show_hide
	
	
	
	jQuery.expr[':'].regex = function(elem, index, match) {
	    var matchParams = match[3].split(','),
	        validLabels = /^(data|css):/,
	        attr = {
	            method: matchParams[0].match(validLabels) ? 
	                        matchParams[0].split(':')[0] : 'attr',
	            property: matchParams.shift().replace(validLabels,'')
	        },
	        regexFlags = 'ig',
	        regex = new RegExp(matchParams.join('').replace(/^\s+|\s+$/g,''), regexFlags);
	    return regex.test(jQuery(elem)[attr.method](attr.property));
	}



});

