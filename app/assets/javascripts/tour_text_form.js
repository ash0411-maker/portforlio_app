$(function (){
    let count = $(".guide-tour-title-text-field").text().length;
    console.log(count);
    //残りの入力できる文字数を計算
    let now_count = 20 - count;
    console.log(now_count);
    //残りの入力できる文字数を表示
    $(".guide-tour-text-field-count").text( "残り" + now_count + "文字");

    $(".guide-tour-title-text-field").on("keyup", function() {
        let KeyUpCount = $(this).val().length;
        let KeyUpNowCount = 20 - KeyUpCount;

        if (keyUpCount > 20) {
            $(".guide-tour-text-field-count").css("color","red");
            $(".guide-tour-title-text-field").css("background-color","red");
        } else {
            $(".guide-tour-text-field-count").css("color","black");
            $(".guide-tour-title-text-field").css("background-color","white");
        }
        $(".guide-tour-text-field-count").text( "残り" + KeyUpNowCount + "文字");
    });
});



$(function (){
    let count = $(".meeting-point-text-area").text().length;
    //残りの入力できる文字数を計算
    let now_count = 400 - count;
    //残りの入力できる文字数を表示
    $(".meeting-point-text-area-count").text( "残り" + now_count + "文字");

    $(".meeting-point-text-area").on("keyup", function() {
        let keyUpCount = $(this).val().length;
        let keyUpNowCount = 400 - keyUpCount;

        if (keyUpCount > 400) {
            $(".meeting-point-text-area-count").css("color","red");
            $(".meeting-point-text-area").css("background-color","red");
        } else {
            $(".meeting-point-text-area-count").css("color","black");
            $(".meeting-point-text-area").css("background-color","white");
        }
        $(".meeting-point-text-area-count").text( "残り" + keyUpNowCount + "文字");
    });
});


$(function (){
    let count = $(".tour-info-text-area").text().length;
    //残りの入力できる文字数を計算
    let now_count = 800 - count;
    //残りの入力できる文字数を表示
    $(".tour-info-text-area-count").text( "残り" + now_count + "文字");

    $(".tour-info-text-area").on("keyup", function() {
        let keyUpCount = $(this).val().length;
        let keyUpNowCount = 800 - keyUpCount;

        if (keyUpCount > 800) {
            $(".tour-info-text-area-count").css("color","red");
            $(".tour-info-text-area").css("background-color","red");
        } else {
            $(".tour-info-text-area-count").css("color","black");
            $(".tour-info-text-area").css("background-color","white");
        }
        $(".tour-info-text-area-count").text( "残り" + keyUpNowCount + "文字");
    });
});