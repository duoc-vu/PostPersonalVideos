function validateForm(event) {
    event.preventDefault(); // Ngăn chặn việc gửi form

    // Lấy giá trị username, email, password và repassword từ các ô input
    var usernameInput = document.getElementById('username');
    var username = usernameInput.value;
    var emailInput = document.getElementById('email');
    var email = emailInput.value;
    var passwordInput = document.getElementById('password');
    var password = passwordInput.value;
    var repasswordInput = document.getElementById('repassword');
    var repassword = repasswordInput.value;
    var MSTv = document.getElementById("MST");
    var MST = MSTv.value;

    // Kiểm tra lỗi trống
    if (username.trim() === '') {
        document.getElementById('usernameError').textContent = 'Vui lòng nhập tên đăng nhập.';
        return;
    }

    if (email.trim() === '') {
        document.getElementById('emailError').textContent = 'Vui lòng nhập địa chỉ email.';
        return;
    }

    if (password.trim() === '') {
        document.getElementById('passwordError').textContent = 'Vui lòng nhập mật khẩu.';
        return;
    }

    if (repassword.trim() === '') {
        document.getElementById('passwordError').textContent = 'Vui lòng xác nhận mật khẩu.';
        return;
    }

    // Kiểm tra định dạng email
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        document.getElementById('emailError').textContent = 'Email không hợp lệ.';
        return;
    }
    /*Ít nhất 3 kí tự*/
    //var itBa = /^.{3,}$/;
    //if (!itBa.test(username)) {
    //    document.getElementById('usernameError').textContent = 'Tên đăng nhập ít nhất 3 .';
    //    return;
    //}



    // Kiểm tra lỗi ký tự đặc biệt trong username và email
    var specialChars = /[!#$%^&*()_+\-=\[\]{};':"\\|,<>\/?]+/;
    if (specialChars.test(username)) {
        document.getElementById('usernameError').textContent = 'Tên đăng nhập không được chứa ký tự đặc biệt.';
        return;
    }

    if (specialChars.test(email)) {
        document.getElementById('emailError').textContent = 'Email không được chứa ký tự đặc biệt.';
        return;
    }

     /*Kiểm tra username có viết hoa chữ cái đầu*/
    var firstChar = username.charAt(0);
    if (firstChar !== firstChar.toUpperCase()) {
        document.getElementById('usernameError').textContent = 'Tên đăng nhập phải viết hoa chữ cái đầu.';
        return;
    }

    // Kiểm tra mật khẩu và xác nhận mật khẩu trùng khớp
    if (password !== repassword) {
        document.getElementById('passwordError').textContent = 'Mật khẩu không trùng khớp.';
        return;

    }
    var rege = /^.{8,}$/;
    var firstMST = MST.charAt(0);
    //MST
    if (!rege.test(MST))
    {
        document.getElementById('passwordError').textContent = "MST phải lớn hơn 8 kí tự";
        return;
    }
    if (isNaN(firstMST))
    {
        document.getElementById('passwordError').textContent = "MST phải bắt đầu bằng số ";
        return;
    }
    if (firstMST <= 0) {
        document.getElementById('passwordError').textContent = "MST phải bắt đầu bằng số lớn hơn không ";
        return;
    }

    // Gửi form nếu không có lỗi
    document.getElementById('registrationForm').submit();
}



























































//// Lựa chọn các yếu tố mật khẩu
//var strongPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
//var mediumPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{6,}$/;

//// Lấy đối tượng input mật khẩu
//var passwordInput = document.getElementById("password");

//// Gắn sự kiện khi người dùng nhập mật khẩu
//passwordInput.addEventListener("input", function () {
//    var password = this.value;
//    var passwordStrengthMessage = document.getElementById("passwordError");

//    if (strongPassword.test(password)) {
//        passwordStrengthMessage.innerHTML = "Mật khẩu mạnh";
//    } else if (mediumPassword.test(password)) {
//        passwordStrengthMessage.innerHTML = "Mật khẩu bình thường";
//    } else {
//        passwordStrengthMessage.innerHTML = "Mật khẩu yếu";
//    }
//});