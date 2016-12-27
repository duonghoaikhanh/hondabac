//responsive menu
$("#menu-toggle").click(function(e) {
	var $moveOnMenuOpen = $('#wrapper, #menu-wrapper, #header, #body_overlay, #menu-toggle');
	e.preventDefault();
	$moveOnMenuOpen.toggleClass("toggled");
});
$("#body_overlay").click(function(e) {
	e.preventDefault();
	var $showNav = $('#wrapper, #menu-wrapper, #header, #body_overlay, #menu-toggle');
	$showNav.removeClass("toggled");
});
//end responsive menu 

// top link toggle
$(window).load(function() {
	if($(window).width() <= 991) {
		$(document).click(function() {
			$('.top-links').hide();
		});
		$('#top_link_trigger').click(function(e) {
			e.preventDefault();
			e.stopPropagation();
			$('.top-links').toggle();
		});
	}
});
// end top link toggle

// change state of collapse arrow
$('.filter_group a').click(function() {
	$(this).find('i').toggleClass('icon-angle-down');
	$(this).find('i').toggleClass('icon-angle-right');
});
// end change state of collapse arrow

// mark the chosen color
$('.color_block').click(function() {
	$(this).parent().toggleClass('bordercolor');
});
// end mark the chosen color 


/*** top search ***/

$(window).load(function() {
	$(this).scroll(function() {
		if($('#header').hasClass('sticky-header')) {
			$('.top_search').addClass('top_search_sticker');
		}
		else {
			$('.top_search').removeClass('top_search_sticker');
		}
	});
});


/*** four proudct group ***/
$(window).load(function() {
	if($(window).width() <= 767) {
		$(document).click(function() {
			$('.tab_nav_mb').hide();
		});
		$('.index_group_btn').click(function(e) {
			e.preventDefault();
			e.stopPropagation();
			$('.tab_nav_mb').toggle();
		});
		$('.tab_nav_mb li a').click(function(e) {
			$('.index_group_btn').html($(this).html()+' <i class="icon-sort-down"></i>');
		});
	}
});


/*
$('.top_search form a').click(function(e) {
	e.preventDefault();
	setSearchStorage('.top_search form');
	searchCollection();
});

$('.top_search input').keypress(function(e) {
	if(e.which == 13) {
		e.preventDefault();
		setSearchStorage('.top_search form');
		searchCollection();
	}
});

function searchCollection() {
	var collectionId = $('.top_search .collection').val();
	var searchVal = $('.top_search input[type="text"]').val();
	var url = '';
	if(collectionId == 0) {
		url = '/search?query='+ searchVal;
	}
	else {
		if(searchVal != '') {
			url = '/search?query=' + searchVal + '&filter=(collectionid:product=' + collectionId + ')';
		}
		else {
			url = '/search?query=filter=(collectionid:product=' + collectionId + ')';
		}
	}
	window.location=url;
}


function setSearchStorage(form_id) {
	//alert($(form_id).find('.search_input').val());
	var seach_input = $(form_id).find('.search_input').val();
	var search_collection = $(form_id).find('.search_collection').val();
	sessionStorage.setItem('search_input', seach_input);
	sessionStorage.setItem('search_collection', search_collection);
}
function getSearchStorage(form_id) {
	var search_input_st = ''; // sessionStorage.getItem('search_input');
	var search_collection_st = ''; // sessionStorage.getItem('search_collection');
	if(sessionStorage.search_input != '') {
		search_input_st = sessionStorage.search_input;
	}
	if(sessionStorage.search_collection != '') {
		search_collection_st = sessionStorage.search_collection;
	}
	$(form_id).find('.search_input').val(search_input_st);
	$(form_id).find('.search_collection option[value="'+search_collection_st+'"]').prop('selected', true);
}
function resetSearchStorage() {
	sessionStorage.removeItem('search_input');
	sessionStorage.removeItem('search_collection');
}
$(window).load(function() {
	getSearchStorage('.top_search form');
	resetSearchStorage();
});
*/
/*** end top search ***/