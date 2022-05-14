module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # verificar que la siguiente casilla sea válida
    if is_position_is_valid?(state, next_position)
      # si es valida -> movemos la snake
      move_snake_to(state, next_position)
    else
      # si no es valida -> termina el juevo
      end_game(state)
    end
  end

  private
  def calc_next_position(state)
    curr_position = state.snake.positions.first
    case state.next_direction
      when UP
        return Model::Coord.new(
          new_position.row - 1,
          new_position.col
        )

      when RIGHT
        return Model::Coord.new(
          new_position.row,
          new_position.col + 1
        )

      when DOWN
        return Model::Coord.new(
          new_position.row + 1,
          new_position.col
        )

      when LEFT
        return Model::Coord.new(
          new_position.row,
          new_position.col - 1
        )
      end
  end

  def is_position_is_valid?(state, position)
    is_invalid = (
      (position.row >= state.grid.rows || position.row < 0) ||
      (position.col < 0 || position.col >= state.grid.cols)
    )

    return false if is_invalid
    return !(state.snake.positions.include? position)
  end

  def move_snake_to(state, next_position)
    new_positions = [next_position] + state.snake.positions[0...-1]
    state.snake.position = new_positions
    return state
  end

  def end_game(state)
    state.game_finished = true
    return state
  end
end