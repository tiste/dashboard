(function(){var t=function(t,e){return function(){return t.apply(e,arguments)}},e={}.hasOwnProperty,n=function(t,n){function r(){this.constructor=t}for(var o in n)e.call(n,o)&&(t[o]=n[o]);return r.prototype=n.prototype,t.prototype=new r,t.__super__=n.prototype,t};App.Views.GooglesIndex=function(e){function r(){return this.render=t(this.render,this),this.addOne=t(this.addOne,this),this.addAll=t(this.addAll,this),r.__super__.constructor.apply(this,arguments)}return n(r,e),r.prototype.template=JST["templates/googles/index"],r.prototype.initialize=function(){return this.collection.on("reset",this.render,this)},r.prototype.addAll=function(){return this.collection.each(this.addOne)},r.prototype.addOne=function(t){var e;return e=new App.Views.Google({model:t}),this.$(".m-search--results--list").append(e.render().el)},r.prototype.render=function(){return $(this.el).html(this.template({collection:this.collection})),this.addAll(),this},r}(Backbone.View)}).call(this);