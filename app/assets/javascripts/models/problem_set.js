WhiteBoardAcademy.Models.ProblemSet = Backbone.Model.extend({

  urlRoot: 'api/problem_sets',

  parse: function (response) {
    if (response.problemsA) {
      this.problemsA().set(response.problemsA, { parse: true });
      delete response.problemsA;
    }

    if (response.problemsB) {
      this.problemsB().set(response.problemsB, { parse: true });
      delete response.problemsB;
    }

  return response;
},

  problemsA: function () {
    if (!this._questionsA) {
      this._questionsA = new WhiteBoardAcademy.Collections.Questions([], { problem_set: this });
    }

    return this._questionsA;
  },

  problemsB: function () {
    if (!this._questionsB) {
      this._questionsB = new WhiteBoardAcademy.Collections.Questions([], { problem_set: this });
    }

    return this._questionsB;
  }
});
