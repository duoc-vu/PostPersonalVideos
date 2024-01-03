function toggleOptions(menuId) {
    var optionsMenu = document.getElementById(menuId);
    optionsMenu.style.display = (optionsMenu.style.display === 'block') ? 'none' : 'block';
}

let form = document.getElementById("form-U");
let btn = document.getElementById("upLoad");


btn.addEventListener("click", function () {
    form.style.display = (form.style.display === 'block') ? 'none' : 'block';
});

let btnSearch = document.querySelector("#search");
let txtSearch = document.querySelector("#txtInput");
let file_video = document.querySelector("#file");
let btnSubmit = document.querySelector("#btnSubmit");
let title = document.querySelector("#name");
let loi = document.getElementById("LoiRongVideo")


btnSubmit.addEventListener("click", function () {
    var selectedFile = file_video.files[0];
    if (!selectedFile) {
        event.preventDefault();
        loi.innerText = "Thiếu file";

    }
    if (title.value.trim() == "") {
        event.preventDefault();
        loi.innerText = "Cần phải có title";
    }
})