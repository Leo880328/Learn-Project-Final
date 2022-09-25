"use strict";$(document).ready(function(){
	
	
	var a=[
	{label:"Blue",data:[[1,20],[2,90],[3,60],[4,40],[5,100],[6,25],[7,65]],color:"#03A9F4"}];
	var b={series:{lines:{show:true,barWidth:0.05,fill:0}},
	shadowSize:0.1,grid:{borderWidth:1,borderColor:"#edf9fc",
	show:true,hoverable:true,clickable:true},
	yaxis:{tickColor:"#edf9fc",tickDecimals:0,
	font:{lineHeight:13,style:"normal",color:"#9f9f9f",},shadowSize:0},
	xaxis:{tickColor:"#fff",tickDecimals:0,
	font:{lineHeight:13,style:"normal",color:"#9f9f9f"},shadowSize:0,},
	legend:{container:".flot-chart-legends--line",
	backgroundOpacity:0.5,noColumns:0,backgroundColor:"#fff",
	lineWidth:0,labelBoxBorderColor:"#fff"}};
	if($(".flot-line")[0]){$.plot($(".flot-line"),a,b)}});