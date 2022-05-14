require_relative "view/ruby2d"
require_relative "model/state"
# require_relative "actions/actions"

class App
  def start
    view = View::Ruby2dView.new
    initial_state = Model::initial_state
    # actions = Actions::move_snake
    view.render(initial_state)
  end

  def init_timer
    loop do
      sleep 0.5
      # trigger movement
      actions
    end
  end
end