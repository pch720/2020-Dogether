let a = 0;
let b = 0;
let c = 0;
let d = 0;

$('.regclose').click(function () {
    let res = confirm('회원가입 창을 닫으시면 입력하신 정보가 초기화됩니다.\n정말 닫으시겠습니까?');
    if (res) {
        document.getElementById("Regname").value = '';
        document.getElementById("Regemail").value = '';
        document.getElementById("Regpw").value = '';
        document.getElementById("Regpwc").value = '';
        pwc.removeClass("NPI");
        pwc.removeClass("YPI");
        document.getElementById('Nl').innerHTML = '(0/10)';
        document.getElementById('Pl').innerHTML = '(0/15)';
        document.getElementById('Pcl').innerHTML = '(0/15)';
        $('#c1').attr('style', 'display:none');
        $('#c2').attr('style', 'display:none');
        $('#c3').attr('style', 'display:none');
        $('#c4').attr('style', 'display:none');
        $('#nname').attr('style', 'display: none');
        $('#nemail').attr('style', 'display: none');
        $('#npw').attr('style', 'display: none');
        $('#npwc').attr('style', 'display: none');
        a = 0;
        b = 0;
        c = 0;
        d = 0;
    } else {
        return false;
    }
});
const name = $('#Regname');
const email = $('#Regemail');
const pw = $('#Regpw');
const pwc = $('#Regpwc');
let emailRule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
let pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,15}$/;

function PWC() {
    if (pw.val() != pwc.val()) {
        $('#npwc').attr('style', 'display: block');
        $('#c4').attr('style', 'display:none');
        a = 0;
    } else {
        $('#npwc').attr('style', 'display: none');
        $('#c4').attr('style', 'color:#28a745');
        a = 1;
    }
};

function name1() {
    const Nlength = name.val().length;
    document.getElementById('Nl').innerHTML = '(' + Nlength + '/10)';
    if (name.val() === "") {
        $('#nname').attr('style', 'display:block');
        $('#c1').attr('style', 'display:none');
        b = 0;
    } else {
        $('#nname').attr('style', 'display:none');
        $('#c1').attr('style', 'color:#28a745');
        b = 1;
    }
}

function email1() {
    if (!emailRule.test(email.val())) {
        $('#nemail').attr('style', 'display:block');
        $('#c2').attr('style', 'display:none');
        c = 0;
    } else {
        $('#nemail').attr('style', 'display:none');
        $('#c2').attr('style', 'color:#28a745');
        c = 1;
    }
}

function pw1() {
    const Plength = pw.val().length;
    document.getElementById('Pl').innerHTML = '(' + Plength + '/15)';
    PWC();
    if (!pwRule.test(pw.val())) {
        $('#npw').attr('style', 'display:block');
        $('#c3').attr('style', 'display:none');
        d = 0;
    } else {
        $('#npw').attr('style', 'display:none');
        $('#c3').attr('style', 'color:#28a745');
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
                    if (data === 1)
                        alert("회원가입이 정상적으로 처리되었습니다.");
                    else
                        alert("회원가입에 실패하였습니다.");

                },
                error: function (error) {
                    alert("error: " + error);
                }
            });
        }
    }
}
