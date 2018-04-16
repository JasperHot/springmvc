<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SpringMVC</title>
<style type="text/css">
h1 {text-align: center}

#container{
    left: 25%;
    width: 50%;
    height: 70%;
    position: absolute;
    z-index: 50;
}
#tip {
	background-color: #fff;
	padding-left: 10px;
	padding-right: 10px;
	position: absolute;
	font-size: 12px;
	right: 10px;
	top: 20px;
	border-radius: 3px;
	border: 1px solid #ccc;
	line-height: 30px;
	z-index: 100;
}
#bar{
    left: 25%;
    width: 50%;
    top: 8%;
    position: absolute;
    z-index: 60;
}
#input{
    width: 250px;
    height: 25px;
    border: 0;
    background-color: white;
    z-index: 100;
    text-align: center
}
#output{
    width: 250px;
    height: 25px;
    border: 0;
    background-color: white;
    z-index: 100;
    text-align: center
}

</style>
</head>
<body>
<h1>${message}</h1> 
<div id="bar">
<input id = 'input' value = '116.397428,39.90923'></input>
<input id = 'output' value = '显示位置' disabled></input>
<button onclick="int=window.setInterval('clock()',1000)">开始</button>
<button onclick="int=window.clearInterval(int)">停止</button>
</div>
<div id="container">
<div id= "tip"></div>
</div>

<!-- <script src="http://cache.amap.com/lbs/static/es5.min.js"></script> -->
<script src="http://webapi.amap.com/maps?v=1.3&key=43fb89e1980d465202ec09a91ef56e51&plugin=AMap.Geocoder"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
<script>
/*<![CDATA[*/
var lineArrs = [  
            new AMap.LngLat(Number(116.398428),Number(39.90757)),
            new AMap.LngLat(Number(116.399428),Number(39.90758)),
            new AMap.LngLat(Number(116.400428),Number(39.90759)),
            new AMap.LngLat(Number(116.401428),Number(39.90760)),
            new AMap.LngLat(Number(116.402428),Number(39.90761)),
            new AMap.LngLat(Number(116.403428),Number(39.90762)),
            new AMap.LngLat(Number(116.404428),Number(39.90761)),
            new AMap.LngLat(Number(116.405428),Number(39.90760)),
            new AMap.LngLat(Number(116.406428),Number(39.90761)),
            new AMap.LngLat(Number(116.407428),Number(39.90762))
            ];  
 var index=0;
//1.加载
var map = new AMap.Map('container', {
    resizeEnable: true,
    zoom:14,
    center: [116.397428, 39.90756]
});
//2.浏览器定位
/* map.plugin('AMap.Geolocation', function () {
    geolocation = new AMap.Geolocation({
        enableHighAccuracy: true,//是否使用高精度定位，默认:true
        timeout: 10000,          //超过10秒后停止定位，默认：无穷大
        maximumAge: 0,           //定位结果缓存0毫秒，默认：0
        convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
        showButton: true,        //显示定位按钮，默认：true
        buttonPosition: 'RB',    //定位按钮停靠位置，默认：'LB'，左下角
        buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
        showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
        showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
        panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
        zoomToAccuracy: false      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
    });
    map.addControl(geolocation);
    geolocation.getCurrentPosition();
    AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
    AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
});
//解析定位结果
function onComplete(data) {
    var str=['定位成功'];
    str.push('经度：' + data.position.getLng());
    str.push('纬度：' + data.position.getLat());
    if(data.accuracy){
         str.push('精度：' + data.accuracy + ' 米');
    }//如为IP精确定位结果则没有精度信息
    //str.push('是否经过偏移：' + (data.isConverted ? '是' : '否'));
    document.getElementById('tip').innerHTML = str.join('<br/>');
}
//解析定位错误信息
function onError(data) {
    document.getElementById('tip').innerHTML = '定位失败';
} */

//3.输入坐标
var geocoder = new AMap.Geocoder({
        city: "全国"//城市，默认：“全国”
    });
var marker = new AMap.Marker({
        map:map,
        bubble:true
    });
map.plugin('AMap.Geocoder',function(){//同步加载

    /*  map.on('click',function(e){
        marker.setPosition(e.lnglat);
        geocoder.getAddress(e.lnglat,function(status,result){
          if(status=='complete'){
             document.getElementById('output').value = result.regeocode.formattedAddress;
          }
        });
    }); */
    
    /*var input = document.getElementById('input');
    input.onchange = function(e){
        var address = input.value;
        geocoder.getLocation(address,function(status,result){
          if(status=='complete' && result.geocodes.length){
            marker.setPosition(result.geocodes[0].location);
            map.setCenter(marker.getPosition());
            document.getElementById('tip').innerHTML = '';
            document.getElementById('output').value = result.geocodes[0].formattedAddress;
          }else{
            document.getElementById('tip').innerHTML = '获取位置失败';
          }
        });
    }; 
    */
    var input = document.getElementById('input');
    input.onchange = function(e){
        var inputs=input.value.split(',', 2);
        //console.log(inputs);
    	var lnglat = new AMap.LngLat(Number(inputs[0]),Number(inputs[1]));
    	//console.log(lnglat);
    	marker.setPosition(lnglat);
    	map.setCenter(marker.getPosition());
        geocoder.getAddress(lnglat,function(status,result){
          if(status=='complete'){
             document.getElementById('output').value = result.regeocode.formattedAddress;
          }
        });
    }; 
       
}); 
 function clock(){
 	var lnglat = lineArrs[index];
 	console.log(lnglat.getLng()+","+lnglat.getLat());

    marker.setPosition(lnglat);
	map.setCenter(marker.getPosition());
    geocoder.getAddress(lnglat,function(status,result){
      if(status=='complete'){
         document.getElementById('output').value = result.regeocode.formattedAddress;
      }
    });
    index=(index+1)<lineArrs.length?index+1:0;
 }
//定时器
/* var lineArrs = [  
                new AMap.LngLat(Number(116.368904),Number(39.913423)),  
                new AMap.LngLat(Number(116.382122),Number(39.901176)), 
                new AMap.LngLat(Number(116.482123),Number(39.801178)),
                new AMap.LngLat(Number(116.387271),Number(39.912501)),  
                new AMap.LngLat(Number(116.398258),Number(39.904600)) 
            ];  
 var index=0;
 function clock(){
 	var lnglat = lineArrs[index];
 	console.log(lnglat.getLng()+","+lnglat.getLat());
    document.getElementById('output').value = lnglat.getLng()+","+lnglat.getLat();

    index=(index+1)<lineArrs.length?index+1:0;
 } */
 /*]]>*/
</script>
<!-- <script type="text/javascript">
            var msg = "${message}";
            alert(msg);
</script> -->

</body>
</html>