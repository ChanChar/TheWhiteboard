WhiteBoardAcademy.Views.AnswerShow = Backbone.CompositeView.extend({

  template: JST['answers/show'],
  className: 'answer',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var answerShowContent = this.template({ answer: this.model });
    this.$el.html(answerShowContent);
    return this;
  }
});
