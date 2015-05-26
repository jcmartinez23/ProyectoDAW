$(document).ready(function() {
    $(".btnMessage").click(function() {
        
        var row = $(this).parent().parent();
        var modal = $("#full-width");
        
        $("#title-message").text($(row).children(".message-title").text());
        $("#date-message").text($(row).children(".message-date").text());
        $("#body-message").text($(row).children(".message-body").children(".body-hidden").text());
        $("#author").text($(row).children(".message-user").text());                
    });
});