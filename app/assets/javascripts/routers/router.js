WhiteBoardAcademy.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.problemSets = new WhiteBoardAcademy.Collections.ProblemSets();
  },

  routes: {
    // '': 'todaysProblem',
    '': 'problemSetsIndex',
    'problemsets': 'problemSetsIndex',
    'problemsets/:id': 'problemSetShow'
  },

  todaysProblem: function () {
    var todaysProblem = this.problemSets.fetchTodaysProblem();
    var problemSetShow = new WhiteBoardAcademy.Views.ProblemSetShow({
      model: todaysProblem
    });

    this._swapView(problemSetShow);
  },

  problemSetsIndex: function () {
    this.problemSets.fetch();
    var problemSetsIndex = new WhiteBoardAcademy.Views.ProblemSetsIndex({
      collection: this.problemSets
    });

    this._swapView(problemSetsIndex);
  },

  problemSetShow: function (id) {
    var problemSet = this.problemSets.getOrFetch(id);
    var problemSetShow = new WhiteBoardAcademy.Views.ProblemSetShow({
      model: problemSet
    });

    this._swapView(problemSetShow);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }

});
