(function ($) {
    function acknowledgeAlert(alertId) {
        $.ajax({
            type: 'DELETE',
            dataType: 'json',
            url: SERVLET_CONTEXT + '/alerts/' + alertId,
            headers: {
                Accept: "application/json"
            },
            success: function (data) {
                console.dir(data);
                var sel = $('#alertCount');
                var updated = parseInt(sel.text()) - 1;
                sel.text(updated);
                if (updated <= 0) {
                    $('#alertMenuGroup').html('').append('' +
                        '<li class="list-group-item">' +
                        '<div class="alert alert-info alert-dropdown-div">You have no alerts</div>' +
                        '</li>');
                }
            },
            error: function (error) {
                alert("There was an error updating the alerts");
            }
        });
    }


    $(document).ready(function () {
        if ($('#alertMenuGroup').length) {
            $('li.alert-dismissable', '#alertMenuGroup').
                bind('close.bs.alert', function () {
                    var alertId = $(this).attr('data-id');
                    acknowledgeAlert(alertId);
                });
        }
        window.sr = ScrollReveal();

  	  if ($(window).width() < 768) {

  	  	if ($('.timeline-content').hasClass('js--fadeInLeft')) {
  	  		$('.timeline-content').removeClass('js--fadeInLeft').addClass('js--fadeInRight');
  	  	}

  	  	sr.reveal('.js--fadeInRight', {
  		    origin: 'right',
  		    distance: '300px',
  		    easing: 'ease-in-out',
  		    duration: 800,
  		  });

  	  } else {
  	  	
  	  	sr.reveal('.js--fadeInLeft', {
  		    origin: 'left',
  		    distance: '300px',
  			  easing: 'ease-in-out',
  		    duration: 800,
  		  });

  		  sr.reveal('.js--fadeInRight', {
  		    origin: 'right',
  		    distance: '300px',
  		    easing: 'ease-in-out',
  		    duration: 800,
  		  });

  	  }
  	  
  	  sr.reveal('.js--fadeInLeft', {
  		    origin: 'left',
  		    distance: '300px',
  			  easing: 'ease-in-out',
  		    duration: 800,
  		  });

  		  sr.reveal('.js--fadeInRight', {
  		    origin: 'right',
  		    distance: '300px',
  		    easing: 'ease-in-out',
  		    duration: 800,
  		  });

    });
    
    
})(jQuery);

