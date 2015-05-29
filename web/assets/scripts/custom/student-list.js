$(document).ready(function () {

    $(".edit-student").click(function () {
        var row = $(this).parent().parent();

        $("#name-student").text(
                $(row).find(".student-fullName").text()
                );

        $("#mail-student").val(
                $(row).find(".student-mail").text().trim()
                );        
    });
});

