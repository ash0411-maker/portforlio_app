$(function (){
    // 現在の文字数をカウント
    let count = $(".GuideEditTextArea").text().length;
    //残りの入力できる文字数を計算
    let now_count = 400 - count;
    //残りの入力できる文字数を表示
    $(".GuideEditTextAreaCount").text( "残り" + now_count + "文字");


    $(".GuideEditTextArea").on("keyup", function() {
        let keyUpCount = $(this).val().length;
        let keyUpNowCount = 400 - keyUpCount;

        if (keyUpCount > 400) {
            $(".GuideEditTextAreaCount").css("color","red");
            $(".GuideEditTextArea").css("background-color","red");
        } else {
            $(".GuideEditTextAreaCount").css("color","black");
            $(".GuideEditTextArea").css("background-color","white");
        }
        $(".GuideEditTextAreaCount").text( "残り" + keyUpNowCount + "文字");
    });
});