jQuery.fn.hide_toggler=function(){return this.on("click",function(){$(this).closest(".toggler_parent").find(".togger_child").slideToggle("fast"),event.preventDefault()}),this};