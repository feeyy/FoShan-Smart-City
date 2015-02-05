var zc="";
var inily="";

//获取参数数据
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
			$("#zcinfo").html("软件未注册，请登录后台提交注册码！<br><span class=\"small\">&copy; 2015 佛山智慧新城 版权所有</span>");
			 }
    },
    complete: function() {},
    error: function() {}
  });
}