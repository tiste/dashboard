(function(){var t={}.hasOwnProperty,r=function(r,o){function n(){this.constructor=r}for(var e in o)t.call(o,e)&&(r[e]=o[e]);return n.prototype=o.prototype,r.prototype=new n,r.__super__=o.prototype,r};App.Routers.Dashboard=function(t){function o(){return o.__super__.constructor.apply(this,arguments)}return r(o,t),o.prototype.routes={"":"index"},o.prototype.index=function(){var t;return t=new App.Views.DashboardIndex,$("#container").html(t.render().el)},o}(Backbone.Router)}).call(this);