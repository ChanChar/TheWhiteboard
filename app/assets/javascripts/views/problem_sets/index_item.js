WhiteBoardAcademy.Views.ProblemSetIndexItem = Backbone.View.extend({

  template: JST['problem_sets/index_item'],
  className: 'problem-index-item',
  tagName: 'li',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click a': 'showProblemSet'
  },

  render: function () {
    var indexItemContent = this.template({ problem_set: this.model });
    this.$el.html(indexItemContent);
    return this;
  },

  showProblemSet: function (event) {
    event.preventDefault();
    console.log('ere');
    Backbone.history.navigate('#problemsets/' + this.model.id, { trigger: true });
  }

});
