(function(){var e=function(e,t){return function(){return e.apply(t,arguments)}},t={}.hasOwnProperty,s=function(e,s){function r(){this.constructor=e}for(var i in s)t.call(s,i)&&(e[i]=s[i]);return r.prototype=s.prototype,e.prototype=new r,e.__super__=s.prototype,e};App.Views.DashboardIndex=function(t){function r(){return this.render=e(this.render,this),this.search=e(this.search,this),this.isSearching=e(this.isSearching,this),this.displaySearch=e(this.displaySearch,this),r.__super__.constructor.apply(this,arguments)}return s(r,t),r.prototype.template=JST["templates/dashboard/index"],r.prototype.events={"keyup .m-search--input":function(e){return this.isSearching(e),this.search(e)},"submit .m-search":"doSearch"},r.prototype.initialize=function(){return $(document).bind("keydown",this.displaySearch)},r.prototype.displaySearch=function(e){return isChar(e)&&"input"!==e.target.tagName.toLowerCase()?(this.$(".m-overlay").show(),this.$(".m-search--input").focus()):void 0},r.prototype.doSearch=function(e){return e.preventDefault(),this.$(".selected").click()},r.prototype.isSearching=function(e){var t,s;return!isChar(e)&&""===this.$(".m-search--input").val()||27===e.keyCode?this.$(".m-overlay").hide():(this.$(".m-overlay").show(),s=this.$(".m-search--results--item.selected"),s.length>0?(40===e.keyCode?s.next(".m-search--results--item").length>0&&s.removeClass("selected").next(".m-search--results--item").addClass("selected"):38===e.keyCode&&s.prev(".m-search--results--item").length>0&&s.removeClass("selected").prev(".m-search--results--item").addClass("selected"),t=this.$(".m-search--results--item.selected").position().top+this.$(".m-search--results").scrollTop(),this.$(".m-search--results").stop().animate({scrollTop:t},100)):void 0)},r.prototype.search=function(e){var t;return(e.keyCode<37||e.keyCode>40)&&13!==e.keyCode&&27!==e.keyCode?(t=new App.Collections.Googles,t.fetch({data:{hl:"fr",q:this.$(".m-search--input").val(),rsz:8},dataType:"jsonp",success:function(){var e;return e=new App.Views.GooglesIndex({collection:t}),this.$(".m-search--results").html(e.render().el),$(this.el).find(".selected").length>0?void 0:this.$(".m-search--results--item").first().addClass("selected")}})):void 0},r.prototype.render=function(){return $(this.el).html(this.template),this.$(".m-overlay").hide(),this},r}(Backbone.View)}).call(this);