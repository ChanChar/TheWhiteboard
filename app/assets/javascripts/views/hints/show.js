WhiteBoardAcademy.Views.HintShow = Backbone.CompositeView.extend({

  template: JST['hints/show'],
  className: 'hint',

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var hintShowContent = this.template({ hint: this.model });
    this.$el.html(hintShowContent);
    return this;
  }
});
