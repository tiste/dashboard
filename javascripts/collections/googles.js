(function(){var o={}.hasOwnProperty,t=function(t,r){function e(){this.constructor=t}for(var p in r)o.call(r,p)&&(t[p]=r[p]);return e.prototype=r.prototype,t.prototype=new e,t.__super__=r.prototype,t};App.Collections.Googles=function(o){function r(){return r.__super__.constructor.apply(this,arguments)}return t(r,o),r.prototype.url="https://ajax.googleapis.com/ajax/services/search/web?v=1.0",r.prototype.model=App.Models.Google,r.prototype.parse=function(o){return o.responseData.results},r}(Backbone.Collection)}).call(this);