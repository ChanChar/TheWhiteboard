window.WhiteBoardAcademy = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var router = new WhiteBoardAcademy.Routers.Router({ $rootEl: $('#main') });

    // var currentUser = new WhiteBoardAcademy.Models.User({ id: window.CURRENT_USER_ID });
    // currentUser.fetch();

    // var navbarView = new WhiteBoardAcademy.Views.Navbar({
    //   router: router,
    //   model: currentUser
    // });
    //
    // $('#navbar').html(navbarView.render().$el);
    Backbone.history.start();
  }
};

$(document).ready(function(){
  WhiteBoardAcademy.initialize();
});
