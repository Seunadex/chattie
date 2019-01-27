class Presenters::Base
  attr_accessor :controller, :params, :view_context

  def initialize(controller, view_context, params, *args)
    @controller = controller
    @view_context = view_context
    @params = params
  end

  def method_missing(method, *args, &block)
    if controller.respond_to? method
      controller.send(method, *args, &block)

    elsif view_context.respond_to? method
      view_context.send(method, *args, &block)

    else
      super
    end
  end
end
