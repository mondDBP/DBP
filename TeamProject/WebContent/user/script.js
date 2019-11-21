function inputCheck(){
	if(document.regForm.u_nm.value==""){
		alert("이름을 다시 입력하세요.");
		document.regForm.u_nm.focus();
		return;
	}
	if(document.regForm.u_email.value==""){
		alert("이메일 다시 입력하세요");
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.u_email.value != document.regForm.emailConfirm.value){
		alert("이메일이 일치하지 않습니다.");
		document.regForm.repwd.value="";
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.u_pwd.value==""){
		alert("비밀번호를 입력하세요");
		document.regForm.repwd.focus();
		return;
	}
	if(document.regForm.u_pwd.value != document.regForm.pwdConfirm.value){
		alert("비번이 일치하지 않습니다.");
		document.regForm.repwd.value="";
		document.regForm.repwd.focus();
		return;
	}
	
	
	
	
    var str=document.regForm.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('Email 다시 입력하세요!');
	      document.regForm.email.focus();
		  return;
    }
    
	document.regForm.submit();
}