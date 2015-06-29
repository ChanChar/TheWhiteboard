WhiteBoardAcademy.Views.ProblemView = Backbone.CompositeView.extend({

  template: JST['questions/show'],

  initialize: function () {
    // this.listenTo(this.model, 'sync', this.render);
    this.answers = this.model.answers();
    this.hints = this.model.hints();

    this.listenTo(this.answers, 'add', this.addAnswerView);
    this.listenTo(this.hints, 'add', this.addHintView);

    this.answers.each(this.addAnswerView.bind(this));
    this.hints.each(this.addHintView.bind(this));
  },

  events: {
    'click .show-answer': 'toggleAnswerShow',
  },

  render: function () {
    var problemShowContent = this.template({ problem: this.model });
    this.$el.html(problemShowContent);
    this.attachSubviews();
    return this;
  },

  toggleAnswerShow: function (event) {
    event.preventDefault();
    this.$('.answers').fadeToggle();
    if (this.$('.show-answer').text() == 'Show Answer') {
      this.$('.show-answer').text('Hide Answer').hide().fadeIn();
    } else {
      this.$('.show-answer').text('Show Answer').hide().fadeIn();
    }
  },

  addAnswerView: function (answer) {
    var subview = new WhiteBoardAcademy.Views.AnswerShow({
      model: answer
    });
    this.addSubview('.answers', subview);
  },

  addHintView: function (hint) {
    var subview = new WhiteBoardAcademy.Views.HintShow({
      model: hint
    });
    this.addSubview('.hints', subview);
  }

});
