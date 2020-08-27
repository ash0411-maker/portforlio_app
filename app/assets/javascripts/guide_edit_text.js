$(function (){
    var count = $(".GuideEditTextArea").text().length;
    //残りの入力できる文字数を計算
    var now_count = 400 - count;
    //残りの入力できる文字数を表示
    $(".GuideEditTextAreaCount").text( "残り" + now_count + "文字");

    $(".GuideEditTextArea").on("keyup", function() {
        var count = $(this).val().length;
        var now_count = 400 - count;

        if (count > 400) {
            $(".GuideEditTextAreaCount").css("color","red");
            $(".GuideEditTextArea").css("background-color","red");
        } else {
            $(".GuideEditTextAreaCount").css("color","black");
            $(".GuideEditTextArea").css("background-color","white");
        }
        $(".GuideEditTextAreaCount").text( "残り" + now_count + "文字");
    });
});