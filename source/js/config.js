var zc="";
var inily="";

//��ȡ��������
function getconfig() {
  $.ajax({
    url: "appserver/data_ajax.asp?ac=getconfig",
    beforeSend: function() {},
    success: function(data, textStatus) {
      var dd = JSON.decode(data);
     inily=dd.inily;
	 zc=dd.zc;
	 if(zc=="1"){
		 $("#zcinfo").hide();
		 }else{
			$("#zcinfo").show(); 
			$("#zcinfo").html("���δע�ᣬ���¼��̨�ύע���룡<br><span class=\"small\">&copy; 2015 ��ɽ�ǻ��³� ��Ȩ����</span>");
			 }
    },
    complete: function() {},
    error: function() {}
  });
}