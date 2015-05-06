$('.delete-list').bind('ajax:success', function() {  
        $(this).parent().remove();
});