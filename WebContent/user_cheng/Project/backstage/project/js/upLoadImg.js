var loadFile = function (event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function () {
        URL.revokeObjectURL(output.src) // free memory
    }
};
// 參考資料 https://stackoverflow.com/questions/4459379/preview-an-image-before-it-is-uploaded
//  https://progressbar.tw/posts/47 