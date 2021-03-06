require "ruby2d"

module View
  class Ruby2dView
    
    def initialize
      @pixel_size = 50

    end

    def start(state)
      extend Ruby2D::DSL
      set(
        title: "Snake",
        background: 'blue',
        width: @pixel_size * state.grid.cols,
        height: @pixel_size * state.grid.rows)
      show
    end
        
    def renderGame(state)
      extend Ruby2D::DSL
      # clear
      render_food(state)
      render_snake(state)
    end

    private
    def render_food(state)
      @food.remove if !!@food
      extend Ruby2D::DSL
      food = state.food
      @food = Square.new(
        x: @pixel_size * food.col,
        y: @pixel_size * food.row,
        size: @pixel_size,
        color: 'yellow'
      )
    end

    def render_snake(state)
      @snake_positions.each(&:remove) if @snake_positions
      
      extend Ruby2D::DSL
      snake = state.snake
      @snake_positions = snake.positions.map do |pos|
        Square.new(
          x: @pixel_size * pos.col,
          y: @pixel_size * pos.row,
          size: @pixel_size,
          color: 'lime'
        )
      end
    end
  end
end