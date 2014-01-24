!function(e){"use strict";function t(e,t){if(this.createTextRange){var a=this.createTextRange();a.collapse(!0),a.moveStart("character",e),a.moveEnd("character",t-e),a.select()}else this.setSelectionRange&&(this.focus(),this.setSelectionRange(e,t))}function a(e){var t=this.value.length;if(e="start"==e.toLowerCase()?"Start":"End",document.selection){var a,i,n,l=document.selection.createRange();return a=l.duplicate(),a.expand("textedit"),a.setEndPoint("EndToEnd",l),i=a.text.length-l.text.length,n=i+l.text.length,"Start"==e?i:n}return"undefined"!=typeof this["selection"+e]&&(t=this["selection"+e]),t}var i={codes:{188:44,109:45,190:46,191:47,192:96,220:92,222:39,221:93,219:91,173:45,187:61,186:59,189:45,110:46},shifts:{96:"~",49:"!",50:"@",51:"#",52:"$",53:"%",54:"^",55:"&",56:"*",57:"(",48:")",45:"_",61:"+",91:"{",93:"}",92:"|",59:":",39:'"',44:"<",46:">",47:"?"}};e.fn.number=function(n,l,s,r){r="undefined"==typeof r?",":r,s="undefined"==typeof s?".":s,l="undefined"==typeof l?0:l;var h="\\u"+("0000"+s.charCodeAt(0).toString(16)).slice(-4),u=new RegExp("[^"+h+"0-9]","g"),o=new RegExp(h,"g");return n===!0?this.is("input:text")?this.on({"keydown.format":function(n){var h=e(this),c=h.data("numFormat"),v=n.keyCode?n.keyCode:n.which,d="",g=a.apply(this,["start"]),p=a.apply(this,["end"]),f="",m=!1;if(i.codes.hasOwnProperty(v)&&(v=i.codes[v]),!n.shiftKey&&v>=65&&90>=v?v+=32:!n.shiftKey&&v>=69&&105>=v?v-=48:n.shiftKey&&i.shifts.hasOwnProperty(v)&&(d=i.shifts[v]),""==d&&(d=String.fromCharCode(v)),8!==v&&d!=s&&!d.match(/[0-9]/)){var y=!0;if(d.match(/[-]/)&&(c.isNegative||(c.isNegative=!0,y=!1)),y){var x=n.keyCode?n.keyCode:n.which;if(46==x||8==x||9==x||27==x||13==x||(65==x||82==x)&&(n.ctrlKey||n.metaKey)===!0||(86==x||67==x)&&(n.ctrlKey||n.metaKey)===!0||x>=35&&39>=x)return;return n.preventDefault(),!1}}if(0==g&&p==this.value.length||0==h.val()?8===v?(g=p=1,this.value="",c.init=l>0?-1:0,c.c=l>0?-(l+1):0,t.apply(this,[0,0])):d===s?(g=p=1,this.value="0"+s+new Array(l+1).join("0"),c.init=l>0?1:0,c.c=l>0?-(l+1):0):0===this.value.length&&(c.init=l>0?-1:0,c.c=l>0?-l:0):c.c=p-this.value.length,8==v&&1>=g&&c.isNegative)n.preventDefault(),c.isNegative=!1,c.c--,m=this.value.length+c.c;else if(l>0&&d==s&&g==this.value.length-l-1)c.c++,c.init=Math.max(0,c.init),n.preventDefault(),m=this.value.length+c.c;else if(d==s)c.init=Math.max(0,c.init),n.preventDefault();else if(l>0&&8==v&&g==this.value.length-l)n.preventDefault(),c.c--,m=this.value.length+c.c;else if(l>0&&8==v&&g>this.value.length-l){if(""===this.value)return;"0"!=this.value.slice(g-1,g)&&(f=this.value.slice(0,g-1)+"0"+this.value.slice(g),h.val(f.replace(u,"").replace(o,s))),n.preventDefault(),c.c--,m=this.value.length+c.c}else 8==v&&this.value.slice(g-1,g)==r?(n.preventDefault(),c.c--,m=this.value.length+c.c):l>0&&g==p&&this.value.length>l+1&&g>this.value.length-l-1&&isFinite(+d)&&!n.metaKey&&!n.ctrlKey&&!n.altKey&&1===d.length&&(f=p===this.value.length?this.value.slice(0,g-1):this.value.slice(0,g)+this.value.slice(g+1),this.value=f,m=g);m!==!1&&t.apply(this,[m,m]),h.data("numFormat",c)},"keyup.format":function(i){var n,s=e(this),r=s.data("numFormat"),h=i.keyCode?i.keyCode:i.which,u=a.apply(this,["start"]);""===this.value||(48>h||h>57)&&(96>h||h>105)&&8!==h||(s.val(s.val()),l>0&&(r.init<1?(u=this.value.length-l-(r.init<0?1:0),r.c=u-this.value.length,r.init=1,s.data("numFormat",r)):u>this.value.length-l&&8!=h&&(r.c++,s.data("numFormat",r))),s.get(0).value.length?r.isNegative&&(s.get(0).value="-"+this.value):r.isNegative=!1,n=this.value.length+r.c,t.apply(this,[n,n]))},"paste.format":function(t){var a=e(this),i=t.originalEvent,n=null;return window.clipboardData&&window.clipboardData.getData?n=window.clipboardData.getData("Text"):i.clipboardData&&i.clipboardData.getData&&(n=i.clipboardData.getData("text/plain")),a.val(n),t.preventDefault(),!1}}).each(function(){var t=e(this).data("numFormat",{c:-(l+1),decimals:l,thousands_sep:r,dec_point:s,regex_dec_num:u,regex_dec:o,init:!1});""!==this.value&&t.val(t.val())}):this.each(function(){var t=e(this),a=+t.text().replace(u,"").replace(o,".");t.number(isFinite(a)?+a:0,l,s,r)}):this.text(e.number.apply(window,arguments))};var n=null,l=null;e.isPlainObject(e.valHooks.text)?(e.isFunction(e.valHooks.text.get)&&(n=e.valHooks.text.get),e.isFunction(e.valHooks.text.set)&&(l=e.valHooks.text.set)):e.valHooks.text={},e.valHooks.text.get=function(t){var a,i=e(t),l=i.data("numFormat");return l?""===t.value?"":(t.value.match(/^-/)&&(l.isNegative=!0),a=+t.value.replace(l.regex_dec_num,"").replace(l.regex_dec,"."),a=isFinite(a)?a:0,0!=a&&l.isNegative&&(a*=-1),""+a):e.isFunction(n)?n(t):void 0},e.valHooks.text.set=function(t,a){var i=e(t),n=i.data("numFormat");return n?t.value=""===a?"":e.number(a,n.decimals,n.dec_point,n.thousands_sep):e.isFunction(l)?l(t,a):void 0},e.number=function(e,t,a,i){i="undefined"==typeof i?",":i,a="undefined"==typeof a?".":a,t=isFinite(+t)?Math.abs(t):0;var n="\\u"+("0000"+a.charCodeAt(0).toString(16)).slice(-4),l="\\u"+("0000"+i.charCodeAt(0).toString(16)).slice(-4);e=(e+"").replace(".",a).replace(new RegExp(l,"g"),"").replace(new RegExp(n,"g"),".").replace(new RegExp("[^0-9+-Ee.]","g"),"");var s=isFinite(+e)?+e:0,r="",h=function(e,t){var a=Math.pow(10,t);return""+Math.round(e*a)/a};return r=(t?h(s,t):""+Math.round(s)).split("."),r[0].length>3&&(r[0]=r[0].replace(/\B(?=(?:\d{3})+(?!\d))/g,i)),(r[1]||"").length<t&&(r[1]=r[1]||"",r[1]+=new Array(t-r[1].length+1).join("0")),r.join(a)}}(jQuery);