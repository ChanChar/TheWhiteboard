WhiteBoardAcademy.Views.ProblemSetsIndex = Backbone.CompositeView.extend({

  template: JST['problem_sets/index'],
  className: 'row',

  initialize: function () {
    this.listenTo(this.collection, 'add', this.addProblemSetItemView);
    this.listenTo(this.collection, 'remove', this.removeProblemSetItemView);

    this.collection.each(this.addProblemSetItemView.bind(this));
  },

  render: function () {
    var problemSetIndexContent = this.template();
    this.$el.html(problemSetIndexContent);
    this.attachSubviews();
    return this;
  },

  addProblemSetItemView: function (problemSet) {
    var subview = new WhiteBoardAcademy.Views.ProblemSetIndexItem({
      model: problemSet
    });
    this.addSubview('.problem-set-index', subview);
  },

  removeProblemSetItemView: function (problemSet) {
    this.removeModelSubview('.problem-set-index', problemSet);
  }

});
