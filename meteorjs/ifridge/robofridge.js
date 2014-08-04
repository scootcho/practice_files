var clearValues = function(){
	$('#member').val("").focus();
    $('#topic').val("");
    $('#due').val("");
	$('#comment').val("");
}


// Returns an event map that handles the "escape" and "return" keys and
// "blur" events on a text input (given by selector) and interprets them
// as "ok" or "cancel".
var okCancelEvents = function (selector, callbacks) {
  var ok = callbacks.ok || function () {};
  var cancel = callbacks.cancel || function () {};

  var events = {};
  events['keyup '+selector+', keydown '+selector+', focusout '+selector] =
    function (evt) {
      if (evt.type === "keydown" && evt.which === 27) {
        // escape = cancel
        cancel.call(this, evt);

  } else if (evt.type === "keyup" && evt.which === 13 ||
             evt.type === "focusout") {
    // blur/return/enter = ok/submit if non-empty
    var value = String(evt.target.value || "");
    if (value)
      ok.call(this, value, evt);
    else
      cancel.call(this, evt);
  }
};
  return events;
};
//end ok cancelevents

Lists = new Meteor.Collection("myPosts");

MsgBoards = new Meteor.Collection('msgboards');

if (Meteor.isClient) {
	Template.main.msgboards = function(){
    return MsgBoards.find();
	}
Template.main.events(okCancelEvents(
	'#comment',
    {
        ok: function (text, evt) {
            var member = $('#member').val();
            var topic = $('#topic').val();
            var due = $('#due').val();
            MsgBoards.insert({member:member,topic:topic,due:due,comment:text});
        clearValues();
    	}
	}));
    
    Template.side.events({
    "submit form": function(e){
      e.preventDefault();
      var item = {
        "item": $(e.target).find("[name=item]").val()
      };

      list._id = Lists.insert(list);

      $(e.target).find("[name=item]").val("");

    }
  });
}


if (Meteor.isServer) {

}

