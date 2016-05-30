if(typeof FormMath=="undefined"){FormMath={};}FormMath.toNumber=function(a){if(a===null||a===undefined||a===""){return"";}if(typeof a=="string"){a=a.replace(/,/g,"");}var b=a.toString().match(/([$|￥])\d+\.?\d*/);if(b){a=a.replace(b[1],"");}return Number(a);};FormMath.abs=function(a){return Math.abs(a);};FormMath.round=function(a){return Math.round(a);};FormMath.ceil=function(a){return Math.ceil(a);};FormMath.floor=function(a){return Math.floor(a);};FormMath.max=function(e){var d,a=0,c=e.length;for(var b=0;b<c;b++){a=FormMath.toNumber(e[b]);if(isNaN(a)){continue;}if(d===undefined){d=a;}else{if(a>d){d=a;}}}d=FormMath.toNumber(d);return d;};FormMath.min=function(e){var d,a=0,c=e.length;for(var b=0;b<c;b++){a=FormMath.toNumber(e[b]);if(isNaN(a)){continue;}if(d===undefined){d=a;}else{if(a<d){d=a;}}}d=FormMath.toNumber(d);return d;};FormMath.sqrt=function(a){return Math.sqrt(a);};FormMath.average=function(e){var d,a=0,c=e.length;for(var b=0;b<c;b++){a=FormMath.toNumber(e[b]);if(isNaN(a)){continue;}if(d===undefined){d=a;}else{d+=a;}}d=FormMath.toNumber(d/c);return d;};FormMath.sum=function(e){var d,a=0,c=e.length;for(var b=0;b<c;b++){a=FormMath.toNumber(e[b]);if(isNaN(a)){continue;}if(d===undefined){d=a;}else{d+=a;}}d=FormMath.toNumber(d);return d;};FormMath.tofixed=function(c,a){var d=FormMath.toNumber(c);a=FormMath.toNumber(a);if(isNaN(d)||isNaN(a)){return c;}return d.toFixed(a);};FormMath.convertCurrency=function(a){var b=FormMath.toNumber(a);if(isNaN(b)){return a;}return $.convertCurrency(b);};FormMath.doMath=function(){var name=$(this).attr("name");$("input[funcexp]").each(function(){var me=$(this),curName=me.attr("name"),exp=me.attr("funcexp");if(curName&&curName==name){return true;}if(exp.indexOf(name)==-1){return true;}var value=FormMath.replaceSingleValue(exp,me);value=FormMath.replaceMultiValue(value);try{value=eval("("+value+")");}catch(e){return true;}if(/^(Infinity|NaN)$/i.test(value)){return true;}me.val(value).trigger("change");});};FormMath.replaceSingleValue=function(c,a){if(!c){return 0;}var b=/\{.*?\((\w+\:\w+\:\w+)\)\}/g;c=c.replace(b,function(){var f=arguments[1],g=0;var e;if(/^s\:.+$/.test(f)){var d=$(a).closest("[formtype]");e=$("[name='"+f+"']",d);}else{e=$("[name='"+f+"']");}if(e){var h=e.val();h=FormMath.toNumber(h);if(!isNaN(h)){g=h;}}return g;});return c;};FormMath.repMultiFn=function(){var b=arguments[1];var c=[],a=$("[name='"+b+"']");$("[name='"+b+"']").each(function(){var d=$(this);if(d){c.push(FormMath.toNumber(d.val()));}});c="["+c.join(",")+"]";return c;};FormMath.replaceMultiValue=function(b){if(!b){return 0;}var a=/\[.*?\((\w+\:\w+\:\w+)\)\]/g;b=b.replace(a,FormMath.repMultiFn);return b;};