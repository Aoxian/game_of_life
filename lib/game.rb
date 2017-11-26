module GameOfLife
  class Game
    def play(world)
      next_world = []
      world.each_with_index do |row, row_index|
        new_row = []
        row.each_with_index do |cell, column_index|
          # puts "(#{row_index},#{column_index}) => [#{cell},#{neighbour_count(row_index, column_index, world)}]"
          live_neighbours = neighbour_count(row_index, column_index, world)
          new_cell = 0
          new_cell = 0 if cell == 1 && live_neighbours < 2
          new_cell = 1 if cell == 1 && (live_neighbours == 2 || live_neighbours == 3)
          new_cell = 0 if cell == 1 && live_neighbours > 3
          new_cell = 1 if cell == 0 && live_neighbours == 3
          new_row << new_cell
        end
        next_world << new_row
      end
      next_world
    end

    def cell_is_alive?(row, column, world)
      return false if row < 0 || column < 0 || row >= world.length || column >= world[row].length
      world[row][column] == 1
    end

    def neighbour_count(row, column, world)
      neighbours = 0
      neighbours += 1 if cell_is_alive?(row - 1, column - 1, world)
      neighbours += 1 if cell_is_alive?(row - 1, column, world)
      neighbours += 1 if cell_is_alive?(row - 1, column + 1, world)
      neighbours += 1 if cell_is_alive?(row, column - 1, world)
      neighbours += 1 if cell_is_alive?(row, column + 1, world)
      neighbours += 1 if cell_is_alive?(row + 1, column - 1, world)
      neighbours += 1 if cell_is_alive?(row + 1, column, world)
      neighbours += 1 if cell_is_alive?(row + 1, column + 1, world)
      neighbours
    end
  end
end
