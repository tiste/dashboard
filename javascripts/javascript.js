(function(){this.clock=function(){var t,e,o,n,a,i;return a="",t=$(".m-widget--clock"),e=new Date,o=("0"+e.getDate()).slice(-2),n=("0"+(e.getMonth()+1)).slice(-2),i=e.getFullYear(),$.ajax({dataType:"jsonp",url:"http://nameday.tiste.io/namedays/"+i+n+o+".json",jsonpCallback:"nameday",success:function(t){var e,o;return e="",o=0,_(t).each(function(t){return"m"===t.gender?e="St":"f"===t.gender?e="Ste":o>0||(a=""),o>0&&(a+=" et "),a+=e+" "+t.name,o++}),0===o?a="":void 0}},setInterval(function(){var o;return e=moment().lang(window.App.Settings.get("lang")),o=e.format("LLLL").split(" "),t.html('<div class="m-clock--hour mtm mlm pull-left opacity-high">'+e.format("H:mm:ss")+"</div>"),t.append('<div class="m-clock--date mtl mrm pull-right text-right opacity-high">'+o[0]+" "+o[1]+" "+o[2]+"<br><small>"+a+"</small></div>")},1e3))},this.getCity=function(){var t,e;if(localStorage&&localStorage.city){try{t=JSON.parse(localStorage.city)}catch(o){e=o,t=localStorage.city}return t instanceof Object?t:localStorage.city+","+window.App.Settings.get("weatherLang")}},this.goTo=function(t){return window.open(t,"_self")},this.isChar=function(t){return t.keyCode>47&&t.keyCode<58||32===t.keyCode||t.keyCode>64&&t.keyCode<91||t.keyCode>95&&t.keyCode<112||t.keyCode>185&&t.keyCode<193||t.keyCode>218&&t.keyCode<223},this.setCity=function(t){return localStorage&&t?localStorage.city=t:void 0},this.setGeoloc=function(){return navigator.geolocation?navigator.geolocation.getCurrentPosition(function(t){return setCity(JSON.stringify({lat:t.coords.latitude,lon:t.coords.longitude}))},function(){return setCity("Paris")}):setCity("Paris")},this.shuffleColor=function(){return _(["green","blue","black","yellow","orange","red","gray"]).shuffle()[0]},$(window).load(function(){return BackgroundCheck.init({targets:"body",images:"body"}),localStorage?localStorage.tips?void 0:(localStorage.tips=!0,$("body").chardinJs("start")):alert("Vous devez utiliser un navigateur récent tel que Google Chrome pour profiter au mieux de toutes les fonctionnalités")})}).call(this);