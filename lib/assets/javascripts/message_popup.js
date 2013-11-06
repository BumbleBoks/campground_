MessagePopup = function(main_div) {
	var popup_element = "<div id=\"message_popup\"><div id=\"popup_box\"><button id=\"xbutton\">x</button></div></div>";
	main_div.append(popup_element);
	this.addCloseButton(this);	
}

MessagePopup.prototype.addCloseButton = function(messagePopup) {
	$("#xbutton").bind('click', function(event) {
		event.preventDefault();
		messagePopup.close();
		return
     });
};

MessagePopup.prototype.show = function(text) {	
  var popup = $("#message_popup #popup_box");
  popup.append("<div id=\"message_text\">" + text + "</div>");	
  return popup.css("display", "block");
};

MessagePopup.prototype.close = function() {
	$("#message_popup").remove();
};
