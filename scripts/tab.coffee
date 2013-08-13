ReportTab = require 'reportTab'
templates = require '../templates/templates.js'

class DebugTab extends ReportTab
  name: 'Debug'
  className: 'debug'
  template: templates.demo
  dependencies: ['*']

  render: () ->
    # create random data for visualization
    data = []
    _.times 100, () -> data.push Math.round(Math.random() * 100)

    # setup context object with data and render the template from it
    context =
      sketch: @model.forTemplate()
      sketchClass: @sketchClass.forTemplate()
      attributes: @model.getAttributes()
      admin: @project.isAdmin window.user
      result: JSON.stringify(@results.get('data'), null, '  ')
    
    @$el.html @template.render(context, templates)

module.exports = DebugTab