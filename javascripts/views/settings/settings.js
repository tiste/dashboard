(function(){var t=function(t,e){return function(){return t.apply(e,arguments)}},e={}.hasOwnProperty,n=function(t,n){function s(){this.constructor=t}for(var o in n)e.call(n,o)&&(t[o]=n[o]);return s.prototype=n.prototype,t.prototype=new s,t.__super__=n.prototype,t};App.Views.Settings=function(e){function s(){return this.setWeatherLang=t(this.setWeatherLang,this),this.setLang=t(this.setLang,this),this.setBackground=t(this.setBackground,this),this.openSettings=t(this.openSettings,this),this.openHelp=t(this.openHelp,this),this.closeSettings=t(this.closeSettings,this),this.cancelBackground=t(this.cancelBackground,this),s.__super__.constructor.apply(this,arguments)}return n(s,e),s.prototype.template=JST["templates/settings/settings"],s.prototype.className="m-settings",s.prototype.initialize=function(){return this.model.on("change",this.render,this)},s.prototype.events={"change #m-settings--background":"setBackground","change #m-settings--lang":"setLang","change #m-settings--lang--weather":"setWeatherLang","click .m-overlay--settings":"closeSettings","click .m-settings--background--cancel":"cancelBackground","click .m-settings--help":"openHelp","click .m-settings--icon":"openSettings"},s.prototype.cancelBackground=function(){return this.model.setBackground(this.model.defaults.background),goTo("/")},s.prototype.closeSettings=function(t){return t&&$(t.target).hasClass("m-overlay--settings")?this.$(".m-overlay--settings").hide():t?void 0:this.$(".m-overlay--settings").hide()},s.prototype.openHelp=function(){return this.closeSettings(),$("body").chardinJs("start")},s.prototype.openSettings=function(){return this.$(".m-overlay--settings").show()},s.prototype.setBackground=function(t){var e,n;return e=new FileReader,n=void 0===t.dataTransfer?t.target.files[0]:t.dataTransfer.files[0],e.readAsDataURL(n),e.onload=function(t){return function(e){return t.model.setBackground(e.target.result),goTo("/")}}(this)},s.prototype.setLang=function(){return this.model.setLang(this.$("#m-settings--lang").val()),goTo("/")},s.prototype.setWeatherLang=function(){return this.model.setWeatherLang(this.$("#m-settings--lang--weather").val()),goTo("/")},s.prototype.render=function(){return $(this.el).html(this.template(this.model.toJSON())),this.closeSettings(),this},s}(Backbone.View)}).call(this);