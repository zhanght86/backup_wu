function RuleDialog(d){if(!d){d={};}var c=__ctx+"/platform/bpm/bpmNodeRule/dialog.ht?defId="+d.defId+"&nodeId="+d.nodeId;var f=700;var b=500;d=$.extend({},{dialogWidth:f,dialogHeight:b,help:0,status:0,scroll:1,center:1},d);var a="dialogWidth="+d.dialogWidth+"px;dialogHeight="+d.dialogHeight+"px;help="+d.help+";status="+d.status+";scroll="+d.scroll+";center="+d.center;c=c.getNewUrl();var e=window.showModalDialog(c,d,a);if(e!=undefined){if(d.callback){d.callback.call(this,e);}}}function genConditionCode(n){var c=new StringBuffer(),h=n.length;if(h<=0){return"";}for(var g=0;g<h;g++){var f=n[g],e=f.flowvarKey,j=f.optType,b=f.compType,d=f.judgeCon1,m=f.judgeVal1,a=f.judgeCon2,l=f.judgeVal2;var k="";if(j==5){k=_parseScript(e,j,d,m,a,l,false,true,h);}else{k=_parseScript(e,j,d,m,a,l,(j==1?true:false),false,h);}if($.isEmpty(k)){continue;}if(g>0&&!$.isEmpty(c.toString())){c.append(convertCompType(b));}c.append(k);}return c.toString();}function convertCompType(a){if(a=="1"){return"&&";}else{return"||";}}function _parseScript(b,e,c,i,a,g,j,k,d){var f=new StringBuffer();if(k){if(!$.isEmpty(i)){var h=i.split("&&")[0];f.append(_getCompareScript(b,c,h,j));}}else{if(!$.isEmpty(i)){f.append(_getCompareScript(b,c,i,j));}if(!$.isEmpty(g)){if(!$.isEmpty(i)){f.append("&&");}f.append(_getCompareScript(b,a,g,j));}}if(d>1&&!$.isEmpty(f.toString())){f="("+f.toString()+")";}return f.toString();}function _getCompareScript(h,f,e,b){switch(f){case"1":return h+"=="+(b?"":'"')+e+(b?"":'"');case"2":return h+"!="+(b?"":'"')+e+(b?"":'"');case"3":return h+">"+(b?"":'"')+e+(b?"":'"');case"4":return h+"<"+(b?"":'"')+e+(b?"":'"');case"5":return h+">="+(b?"":'"')+e+(b?"":'"');case"6":return h+"<="+(b?"":'"')+e+(b?"":'"');case"7":return h+'.equals("'+e+'")';case"8":return h+'!= "'+e+'"';case"9":return h+'.equalsIgnoreCase("'+e+'")';case"10":return h+".contains("+e+")";case"11":return"!"+h+'.contains("'+e+'")';case"12":return h+'.equals("'+e+'")';case"13":return h+'!="'+e+'"';case"14":return h+'.contains("'+e+'")';case"15":return"!"+h+'.contains("'+e+'")';case"16":var a=e.split(","),g=new StringBuffer();for(var c=0;c<a.length;c++){var d=a[c];g.append(h+'.equals("'+d+'")');if(c+1!=a.length){g.append("||");}}return g.toString();case"17":var a=e.split(","),g=new StringBuffer();for(var c=0;c<a.length;c++){var d=a[c];g.append("!"+h+'.equals("'+d+'")');if(c+1!=a.length){g.append("||");}}return g.toString();}}