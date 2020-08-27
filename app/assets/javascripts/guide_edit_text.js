$(function (){
    // 処理（ページが読み込まれた時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームに入力されている文字数を数える
    //\nは"改行"に変換して2文字にする。オプションフラグgで文字列の最後まで\nを探し変換する
    var count = $(".GuideEditTextArea").text().replace(/\n/g, "改行").length;
    //残りの入力できる文字数を計算
    var now_count = 400 - count;
    //残りの入力できる文字数を表示
    $(".GuideEditTextAreaCount").text( "残り" + now_count + "文字");


    // 処理（キーボードを押した時、フォームに残り何文字入力できるかを数えて表示する）
    //フォームのvalueの文字数を数える
    $(".GuideEditTextArea").on("keyup", function() {
        var count = $(this).val().replace(/\n/g, "改行").length;
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