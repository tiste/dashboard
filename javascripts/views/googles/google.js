(function(){var t=function(t,e){return function(){return t.apply(e,arguments)}},e={}.hasOwnProperty,r=function(t,r){function o(){this.constructor=t}for(var n in r)e.call(r,n)&&(t[n]=r[n]);return o.prototype=r.prototype,t.prototype=new o,t.__super__=r.prototype,t};App.Views.Google=function(e){function o(){return this.render=t(this.render,this),o.__super__.constructor.apply(this,arguments)}return r(o,e),o.prototype.template=JST["templates/googles/google"],o.prototype.className="m-google--search--item",o.prototype.events={click:"redirect"},o.prototype.redirect=function(){return goTo(this.model.get("url"))},o.prototype.render=function(){return $(this.el).html(this.template(this.model.toJSON())),this},o}(Backbone.View)}).call(this);