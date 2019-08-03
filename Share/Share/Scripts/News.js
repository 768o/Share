$(function () {
    var url = "NewsType/Index";
    $.get(url, function (data) {
        //alert(data);
        var obj = eval('(' + data + ')');
        var baseurl = "News/selectNewsByType?searchField=newstype_id&mode=" + encodeURIComponent("=");
        $.each(obj, function (n, value) {
            var categories = $("#lin_table_td").clone(true);
            categories.attr("id", "newstype" + value.id);
            categories.html("<a>" + value.type + "</a>");
            categories.appendTo("tr");
            $("#newstype" + value.id).click(function () {
                var url = baseurl + "&key=" + value.id;
                $("#news").show();
                getNews(url);
            });
        });
        $("#lin_table_td").hide();
    });
});
$(function () {
    var url = "News/selectNewsByType?searchField=newstype_id&key=1&mode=" + encodeURIComponent("=");
    getNews(url);
});
function getNews(url) {
    $(".news").hide();
    $.get(url, function (data) {
        //alert(data);
        var obj = eval('(' + data + ')');
        var baseurl = "News/Index?searchField=id&mode=" + encodeURIComponent("=");
        $.each(obj, function (n, value) {
            var news = $("#news").clone(true);
            news.attr("id", "news" + value.id);
            news.addClass("news");
            news.children(".title").html(value.title);
            //news.children(".text").html(value.text);
            news.children(".authorandtime").children(".author").html(value.author);
            var time = (value.time).substring(6, 19);
            var time1 = new Date(parseInt(time) * 1000).toLocaleString().replace(/:\d{1,2}$/, ' ');
            news.children(".authorandtime").children(".time").html(time1);
            news.appendTo("newslist");
            news.click(function () {
                var url = baseurl + "&key=" + value.id;
                window.location.href = url;
            });
        });
        $("#news").hide();
    });
}