let a = 0;
let b = 0;
let c = 0;
let d = 0;
const name = $('#Regname');
const email = $('#Regemail');
const pw = $('#Regpw');
const pwc = $('#Regpwc');
let emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;
function RC(){
    document.getElementById("Regname").value = '';
    document.getElementById("Regemail").value = '';
    document.getElementById("Regpw").value = '';
    document.getElementById("Regpwc").value = '';
    pwc.removeClass("NPI");
    pwc.removeClass("YPI");
    document.getElementById('Nl').innerHTML = '(0/10)';
    document.getElementById('Pl').innerHTML = '(0/15)';
    document.getElementById('Pcl').innerHTML = '(0/15)';
    name.removeClass("is-invalid");
    name.removeClass("is-valid");
    email.removeClass("is-invalid");
    email.removeClass("is-valid");
    pw.removeClass("is-invalid");
    pw.removeClass("is-valid");
    pwc.removeClass("is-invalid");
    pwc.removeClass("is-valid");
    $('#nname').attr('style', 'display: none');
    $('#namejb').attr('style', 'display:none');
    $('#nemail').attr('style', 'display: none');
    $('#eemail').attr('style', 'display: none');
    $('#npw').attr('style', 'display: none');
    $('#npwc').attr('style', 'display: none');
    a = 0;
    b = 0;
    c = 0;
    d = 0;
}
$('.regclose').click(function () {
    let res = confirm('회원가입 창을 닫으시면 입력하신 정보가 초기화됩니다.\n정말 닫으시겠습니까?');
    if (res) {
        RC();
    } else {
        return false;
    }
});
function PWC() {
    if (pw.val() != pwc.val()) {
        $('#npwc').attr('style', 'display: block');
        pwc.addClass("is-invalid");
        pwc.removeClass("is-valid");
        a = 0;
    } else {
        $('#npwc').attr('style', 'display: none');
        pwc.addClass("is-valid");
        pwc.removeClass("is-invalid");
        a = 1;
    }
};
function name1() {
    const Nlength = name.val().length;
    document.getElementById('Nl').innerHTML = '(' + Nlength + '/10)';
    $.ajax({
        url : "/nCheck.do",
        type : 'POST',
        data : {"name":name.val()},
        success : function (data) {
            if (data=="1") {
                $('#nname').attr('style', 'display:none');
                $('#namejb').attr('style', 'display:block');
                name.addClass("is-invalid");
                name.removeClass("is-valid");
                b = 0;
            }else if (name.val() === "") {
                $('#namejb').attr('style', 'display:none');
                $('#nname').attr('style', 'display:block');
                name.addClass("is-invalid");
                name.removeClass("is-valid");
                b = 0;
            } else {
                $('#namejb').attr('style', 'display:none');
                $('#nname').attr('style', 'display:none');
                name.addClass("is-valid");
                name.removeClass("is-invalid");
                b = 1;
            }
        }
    });
}

function email1() {
    $.ajax({
        url: "/eCheck.do",
        type: 'POST',
        data: {"email":email.val()},
        success : function (data) {
            if (data=="1"){
                $('#eemail').attr('style', 'display:block');
                $('#nemail').attr('style', 'display:none');
                email.addClass("is-invalid");
                email.removeClass("is-valid");
                c = 0;
            }else if (!emailRule.test(email.val())) {
                $('#eemail').attr('style', 'display:none');
                $('#nemail').attr('style', 'display:block');
                email.addClass("is-invalid");
                email.removeClass("is-valid");
                c = 0;
            } else {
                $('#eemail').attr('style', 'display:none');
                $('#nemail').attr('style', 'display:none');
                email.addClass("is-valid");
                email.removeClass("is-invalid");
                c = 1;
            }
        }
    });
}

function pw1() {
    const Plength = pw.val().length;
    document.getElementById('Pl').innerHTML = '(' + Plength + '/15)';
    PWC();
    if (!pwRule.test(pw.val())) {
        $('#npw').attr('style', 'display:block');
        pw.addClass("is-invalid");
        pw.removeClass("is-valid");
        d = 0;
    } else {
        $('#npw').attr('style', 'display:none');
        pw.addClass("is-valid");
        pw.removeClass("is-invalid");
        d = 1;
    }
}

function pwc1() {
    const Pclength = pwc.val().length;
    document.getElementById('Pcl').innerHTML = '(' + Pclength + '/15)';
    PWC();
}
function Reg() {
    let res = confirm("입력하신 정보로 가입하시겠습니까?");
    if (!res) {
        console.log("err");
        return false;
    } else {
        if (a === 1 && b === 1 && c === 1 && d === 1) {
            $.ajax({
                url: "/Reg.do",
                type: 'POST',
                data: {
                    "email": email.val(),
                    "name": name.val(),
                    "password": pw.val()
                },
                success: function (data) {
                    if (data === 1) {
                        alert("회원가입이 정상적으로 처리되었습니다.");
                        RC();
                        $('#regModal').modal("hide");
                        $('#loginModal').modal("hide");
                    }else
                        alert("회원가입에 실패하였습니다.");

                },
                error: function (error) {
                    alert("error: " + error);
                }
            });
        }else
            alert("회원가입의 모든 조건을 만족시켜 주세요.")

    }
}
