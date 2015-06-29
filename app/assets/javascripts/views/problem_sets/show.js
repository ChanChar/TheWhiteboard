WhiteBoardAcademy.Views.ProblemSetShow = Backbone.CompositeView.extend({

  template: JST['problem_sets/show'],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
    this.problemsA = this.model.problemsA();
    this.problemsB = this.model.problemsB();

    this.listenTo(this.problemsA, 'add', this.addProblemA);
    this.listenTo(this.problemsB, 'add', this.addProblemB);

    this.listenTo(this.problemsA, 'remove', this.addProblemA);
    this.listenTo(this.problemsB, 'remove', this.addProblemB);

    this.problemsA.each(this.addProblemA.bind(this));
    this.problemsB.each(this.addProblemB.bind(this));
  },

  events: {
    'click .button-a': 'toggleProblemAShow',
    'click .button-b': 'toggleProblemBShow'
  },

  render: function () {
    var problemSetContent = this.template({ problemSet: this.model });
    this.$el.html(problemSetContent);
    this.attachSubviews();
    return this;
  },

  toggleProblemAShow: function (event) {
    event.preventDefault();
    $('.button-a').toggleClass('button-active');
    $('.problem-set-a').fadeToggle();
  },

  toggleProblemBShow: function (event) {
    event.preventDefault();
    $('.button-b').toggleClass('button-active');
    $('.problem-set-b').fadeToggle();
  },

  addProblemA: function (problem) {
    var subview = new WhiteBoardAcademy.Views.ProblemView({
      model: problem
    });
    this.addSubview('.problem-set-a', subview);
  },

  addProblemB: function (problem) {
    var subview = new WhiteBoardAcademy.Views.ProblemView({
      model: problem
    });
    this.addSubview('.problem-set-b', subview);
  },

  removeProblemA: function (problem) {
    this.removeModelSubview('.problem-set-a', problem);
  },

  removeProblemB: function (problem) {
    this.removeModelSubview('.problem-set-b', problem);
  }
});
