(function(){var t=function(t,e){return function(){return t.apply(e,arguments)}},e={}.hasOwnProperty,r=function(t,r){function n(){this.constructor=t}for(var i in r)e.call(r,i)&&(t[i]=r[i]);return n.prototype=r.prototype,t.prototype=new n,t.__super__=r.prototype,t};App.Views.WeathersIndex=function(e){function n(){return this.render=t(this.render,this),this.refetch=t(this.refetch,this),n.__super__.constructor.apply(this,arguments)}return r(n,e),n.prototype.template=JST["templates/weathers/index"],n.prototype.events={"blur .m-weather--input":"refetch","submit .m-weather form":"refetch"},n.prototype.initialize=function(){return this.collection.on("reset",this.render,this)},n.prototype.refetch=function(t){var e,r;return t.preventDefault(),r=new App.Collections.Weathers,setCity(this.$(".m-weather--input").val()),e=getCity(),$(this.$(".m-weather--item").get().reverse()).each(function(t){return setTimeout(function(t){return function(){return $(t).fadeOut()}}(this),100*t)}),r.fetch({data:{lang:window.App.Settings.get("lang"),q:e,units:"metric"},dataType:"jsonp",success:function(t){return function(){return t.collection=r,setCity(r.at(0).get("city")),t.render()}}(this),error:function(){return function(){return setCity("Paris"),goTo("/")}}(this)})},n.prototype.render=function(){return $(this.el).html(this.template({weathers:this.collection.toJSON()})),this.$(".m-weather--item").hide().each(function(t){return setTimeout(function(t){return function(){return $(t).fadeIn()}}(this),100*t)}),this},n}(Backbone.View)}).call(this);