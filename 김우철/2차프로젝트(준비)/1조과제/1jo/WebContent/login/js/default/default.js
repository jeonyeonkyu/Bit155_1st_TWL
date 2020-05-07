addInputEvent('id', 'id_area');
addInputEvent('pw', 'pw_area');
initSmartLevel();
isOldIE();
//initialize 
doBUK();
//legacy focus
try{
	if (navigator.appVersion.toLowerCase().indexOf("win") != -1) {
		$('id').style.imeMode = "disabled";
		document.msCapsLockWarningOff = true;
	}
}catch(e) {}
try{
	if ( $('id').value.length == 0 )
	{
		$('id').focus();
	}
	else
	{
		$('pw').focus();
	}
}catch (e){}

addNclicksEvent("log.naver");
addNclicksEvent("log.login");
addNclicksEvent("log.otn");
addNclicksEvent("log.otnhelp");
addNclicksEvent("log.chatbot");
addNclicksEvent("log.banner");

addNormalEvent('u_skip_anchor', u_skip);
addNormalEvent('ipguide', function(e) {help_ip_popup(); e.preventDefault ? e.preventDefault() : e.returnValue = false; return false;});
addNormalEvent('log.otn', onetime);
addNormalEvent('nudge_close', function() {hide('nudge_tooltip');});
addNormalEvent('onetime_usage', viewOnetime);
addNormalEvent('log.otnhelp', viewOnetime);
addNormalEvent('goNotAdult', goNotAdult);
addNormalEventWithType('login_chk', function(e) { persist_usage();savedLong($('login_chk')); nclks_chk('login_chk', 'log.keepon', 'log.keepoff', '', e);}, "change");
addNormalEventWithType('ip_on', function(e) { ipCheck($('ip_on'), e); nclks_chk('ip_on', 'log.iponset', 'log.ipoffset', '', e);}, "change");
addNormalEventWithType('frmNIDLogin', function(e) { if (confirmSplitSubmit()) {} else {e.preventDefault ? e.preventDefault() : e.returnValue = false;}}, "submit");

if (isObjExist('pw')){
	var pwElement = $('pw');
	if(pwElement.addEventListener) {
		pwElement.addEventListener("keypress", function() { capslockevt(event); getKeysv2();}, false);
		pwElement.addEventListener("keyup", function() { checkShiftUp(event);}, false);
		pwElement.addEventListener("keydown", function() { checkShiftDown(event);}, false);
	} else {
		pwElement.attachEvent("onkeypress", function() { capslockevt(event); getKeysv2();});
		pwElement.attachEvent("ononkeyup", function() { checkShiftUp(event);});
		pwElement.attachEvent("onkeydown", function() { checkShiftDown(event);});
	}
}
privateModeCheck();
ncaptchaInit();