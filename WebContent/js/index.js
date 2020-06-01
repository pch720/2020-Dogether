$('.regclose').click(function(){
    let res = confirm('회원가입 창을 닫으시면 입력하신 정보가 초기화됩니다.\n정말 닫으시겠습니까?');
    if(res){
        document.getElementById("Regname").value='';
        document.getElementById("Regemail").value='';
        document.getElementById("Regpw").value='';
        document.getElementById("Regpwc").value='';
        $('#Reg').removeClass("was-validated");
        document.getElementById('Nl').innerHTML = '(0/10)';
        document.getElementById('Pl').innerHTML = '(0/15)';
        document.getElementById('Pcl').innerHTML = '(0/15)';
    }else{
        return false;
    }
});
$('#Regname').keyup (function () {
    const Nlength = $('#Regname').val().length;
    console.log(Nlength>10);
    document.getElementById('Nl').innerHTML = '('+Nlength+'/10)';
});
$('#Regpw').keyup (function () {
    const Plength = $('#Regpw').val().length;
    console.log(Plength>10);
    document.getElementById('Pl').innerHTML = '('+Plength+'/15)';
});
$('#Regpwc').keyup (function () {
    const Pclength = $('#Regpwc').val().length;
    const pw=$('#Regpw').val();
    const pwc=$('#Regpwc').val();
    console.log(Pclength>10);
    document.getElementById('Pcl').innerHTML = '('+Pclength+'/15)';
    console.log(pw)
    console.log(pwc)
    if (pw!=pwc){
        console.log("hello")
        return false;
    }
});

function Reg(){

    let res=confirm("입력하신 정보로 가입하시겠습니까?")
    if(!res){
        document.getElementById('Regpw')
    }
    let data = {
        name: document.getElementById('Regname').value,
        email: document.getElementById('Regemail').value,
        password: document.getElementById('Regpw').value
    };

    $.ajax({
        type: 'POST',
        url: '/api/v1/Member',
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(data)
    }).then(function(res) {
        console.log(res);
        alert("회원가입에 성공하였습니다!");
        location.href = '/';
    }, function(error) {
        console.log(error);
        alert("회원가입에 실패하였습니다!");
        location.href = '#'
    });
}
