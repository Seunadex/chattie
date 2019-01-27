# To use a presenter in your controller, include this concern in your controller.
# Calling `use_presenter` will create an instance variable named @presenter for use in your action and view.
#
# The following example creates an instance variable containing an instance of Presenters::Activities:
#   use_presenter :activities
module Presentable
  extend ActiveSupport::Concern

  # Creates a `@presenter` instance variable for use in your action/view.
  #
  # @param [Symbol] name the demodularized name of the presenter you want to use
  # @return void
  def use_presenter(name, *args)
    @presenter = "Presenters::#{ name.to_s.camelize }".constantize.new(self, view_context, params, *args)
  end
end
