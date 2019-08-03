$(function () {
    $("#insert_news").validate();
}); 
$(function () {
    var i = 0;
    $("#lin_Modal").click(function () {
        if ($("select[name=cmt] option").size() <= 1) {
            var url = "NewsType/Index";
            $.get(url, function (data) {
                alert(data);
                var obj = eval('(' + data + ')');
                $.each(obj, function (n, value) {
                    var categories = $("#news_type_option").clone(true);
                    categories.attr("id", value.id);
                    categories.html(value.type);
                    categories.appendTo("select");
                });
                if (i === 0) {
                    $(".lin_option").eq(1).attr("selected", true);
                    $(".lin_option").eq(0).remove();
                    i = 1;
                } else {
                    $(".lin_option").eq(0).attr("selected", true);
                }
            });
        }
    });
}); 
$(function () {
    $("#insert_news_submit").click(function () {
        var url = "News/InsertNews";
        //alert($("#news_type").find("option:selected").attr("id"));
        $.post(url, {
            title: $("#news_title").val(),
            text: $("#news_text").val(),
            newstype_id: $("#news_type").find("option:selected").attr("id")
        }, function (data) {
            alert(data);
        });
    });
}); 