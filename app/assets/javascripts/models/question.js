WhiteBoardAcademy.Models.Question = Backbone.Model.extend({

  urlRoot: 'api/questions',

  parse: function (response) {
    if (response.answers) {
      this.answers().set(response.answers, { parse: true });
      delete response.answers;
    }

    if (response.hints) {
      this.hints().set(response.hints);
      delete response.hints;
    }

    return response;
  },

  answers: function () {
    if (!this._answers) {
      this._answers = new WhiteBoardAcademy.Collections.Answers([], { question: this });
    }

    return this._answers;
  },

  hints: function () {
    if (!this._hints) {
      this._hints = new WhiteBoardAcademy.Collections.Hints([], { question: this });
    }

    return this._hints;
  },
});
