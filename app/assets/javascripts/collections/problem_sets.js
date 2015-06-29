WhiteBoardAcademy.Collections.ProblemSets = Backbone.Collection.extend({

  model: WhiteBoardAcademy.Models.ProblemSet,
  url: 'api/problem_sets',

  getOrFetch: function (id) {
    var problemSet = this.get(id);
    var problemSets = this;

    if (!problemSet) {
      problemSet = new WhiteBoardAcademy.Models.ProblemSet({ id: id });
      problemSet.fetch({
        success: function () {
          problemSets.add(problemSet);
        }
      });
    } else {
      problemSet.fetch();
    }

    return problemSet;
  },

  fetchTodaysProblem: function () {
    var problemSet = new WhiteBoardAcademy.Models.ProblemSet({ date: new Date() });
    problemSet.fetch();

    return problemSet;
  }
});
