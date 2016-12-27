ttHStatistic = {
	get_config:function () {
		
		//Localhost
		ttHStatistic.root = ROOT;
		//Website
		//ttHStatistic.root = "http://www.thongkehiep.demo2.trust.vn/";
		
		ttHStatistic.config_default = ({"full_zero" : false,"split_char" : false});
		ttHStatistic.config = (ttHStatistic.config) ? ttHStatistic.config :ttHStatistic.config_default;
		for (x in ttHStatistic.config_default)
		{
			ttHStatistic.config[x] = (ttHStatistic.config[x]) ? ttHStatistic.config[x] : ttHStatistic.config_default[x];
		}
		
		//ttHStatistic.full_zero = (ttHStatistic.full_zero) ? ttHStatistic.full_zero : false;
		//ttHStatistic.split_char = (ttHStatistic.split_char) ? ttHStatistic.split_char : false;
		
		ttHStatistic.online = "";
		ttHStatistic.total_day = "";
		ttHStatistic.total = "";
		
		ttHStatistic.html_online= document.getElementById("tth-online");
		ttHStatistic.html_total_day= document.getElementById("tth-total_day");
		ttHStatistic.html_total= document.getElementById("tth-total");
		
		if (window.encodeURIComponent)
				ttHStatistic.tthEscape = encodeURIComponent;
		else if (window.encodeURI)
				ttHStatistic.tthEscape = encodeURI;
		else
				ttHStatistic.tthEscape = escape;
	},
	screenWidth:function () {
 		if (window.screen) {
			return(screen.width);
		} else {
			return(0);
		}
	},
	screenHeight:function () {
 		if (window.screen) {
			return(screen.height);
		} else {
			return(0);
		}
	},
	get_client:function () {
 		var str_info = "";
		
		var screenWidth = ttHStatistic.screenWidth();
		str_info += "&screen_width="+screenWidth;
		
		var screenHeight = ttHStatistic.screenHeight();
		str_info += "&screen_height="+screenHeight;
		
		str_info += "&referrer_link="+ttHStatistic.tthEscape(document.referrer);
		
		return str_info;
	},
	
	do_statistic:function () {
		
		var str_info = ttHStatistic.get_client();
 		//alert(str_info);
		
		var str_rand = Math.floor((Math.random()*1000)+1); 
		//image_tmp = new Image();
		//image_tmp.src = ttHStatistic.root+"ajax/statistic.php?do=statistic"+str_info+"&rand="+str_rand;	
		var url = ttHStatistic.root+"ajax.php?m=statistic&f=statistic"+str_info+"&rand="+str_rand;	
		
		if(document.getElementById('tth-statistic'))
		{
			ttHStatistic.oBody = document.getElementById('tth-statistic');
		}
		else
		{
			ttHStatistic.oBody = document.createElement('div');
			ttHStatistic.oBody.id = "tth-statistic";
			ttHStatistic.oBody.style="width:0px; height:0px; overflow:hidden";
			document.body.appendChild(ttHStatistic.oBody);
		}
		
		if(document.getElementById("tth-statistic_out")){
			ttHStatistic.oBody.removeChild(ttHStatistic.oScript);
		} 
		
		ttHStatistic.oScript= document.createElement("script");
		ttHStatistic.oScript.id = "tth-statistic_out";
		ttHStatistic.oScript.type = "text/javascript";
		ttHStatistic.oScript.src=url;
		ttHStatistic.oBody.appendChild(ttHStatistic.oScript);
	
		setTimeout(function(){
			
			if(ttHStatistic.config.full_zero == true)
			{
				var online_length = String(ttHStatistic.online).length;
				for(var i = online_length; i < String(ttHStatistic.total).length; i++)
				{
					ttHStatistic.online = "0"+ttHStatistic.online;
				}
				
				var total_day_length = String(ttHStatistic.total_day).length;
				for(var i = total_day_length; i < String(ttHStatistic.total).length; i++)
				{
					ttHStatistic.total_day = "0"+ttHStatistic.total_day;
				}
			}
			
			ttHStatistic.online_out = ttHStatistic.online;
			ttHStatistic.total_day_out = ttHStatistic.total_day;
			ttHStatistic.total_out = ttHStatistic.total;
			
			if(ttHStatistic.config.split_char == true)
			{
				var arr_online = String(ttHStatistic.online).split("")
				ttHStatistic.online_out = '';
				for (x in arr_online)
				{
					ttHStatistic.online_out += '<span class="tth-num_'+arr_online[x]+'">'+arr_online[x]+'</span>';
				}
				
				var arr_total_day = String(ttHStatistic.total_day).split("")
				ttHStatistic.total_day_out = '';
				for (x in arr_total_day)
				{
					ttHStatistic.total_day_out += '<span class="tth-num_'+arr_total_day[x]+'">'+arr_total_day[x]+'</span>';
				}
				
				var arr_total = String(ttHStatistic.total).split("")
				ttHStatistic.total_out = '';
				for (x in arr_total)
				{
					ttHStatistic.total_out += '<span class="tth-num_'+arr_total[x]+'">'+arr_total[x]+'</span>';
				}

			}
			
			
			if(ttHStatistic.html_online){
				ttHStatistic.html_online.innerHTML=ttHStatistic.online_out;
			}
			if(ttHStatistic.html_total_day){
				ttHStatistic.html_total_day.innerHTML=ttHStatistic.total_day_out;
			}
			if(ttHStatistic.html_total){
				ttHStatistic.html_total.innerHTML=ttHStatistic.total_out;
			}
			
			//alert("online="+ttHStatistic.online+", total="+ttHStatistic.total);
		},100);
		
		setTimeout(function(){
			ttHStatistic.do_statistic();
		},4000);
	}
	
};

window.onload=function(){
	ttHStatistic.get_config();
	ttHStatistic.do_statistic();
	};