$(function (){
  var count = $(".js-text-200").text().replace(/\n/g, "改行").length;

  var now_count = 200 - count;
  $(".js-text-count-200").text( "残り" + now_count + "文字");

  $(".js-text-200").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 200 - count;

    if (count > 200) {
      $(".js-text-count-200").css("color","red");
    } else {
      $(".js-text-count-200").css("color","black");
    }
    $(".js-text-count-200").text( "残り" + now_count + "文字");
  });
});

$(function (){
  var count = $(".js-text-2000").text().replace(/\n/g, "改行").length;

  var now_count = 2000- count;
  $(".js-text-count-2000").text( "残り" + now_count + "文字");

  $(".js-text-2000").on("keyup", function() {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 2000 - count;

    if (count > 2000) {
      $(".js-text-count-2000").css("color","red");
    } else {
      $(".js-text-count-2000").css("color","black");
    }
    $(".js-text-count-2000").text( "残り" + now_count + "文字");
  });
});