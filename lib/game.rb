module GameOfLife

  class Game

    def play(world)
      next_world = []
      world.each do |row|
        new_row = []
        row.each do |cell|
          new_cell = 0
          new_row << new_cell
        end
        next_world << new_row
      end
      next_world
    end

    def cell_is_alive?(row, column, world)
      world[row][column] == 1
    end

    def neighbour_count(row, column, world)
      neighbours = 0
      neighbours += 1 if cell_is_alive?(row-1, column-1, world)
      neighbours += 1 if cell_is_alive?(row-1, column, world)
      neighbours += 1 if cell_is_alive?(row-1, column+1, world)
      neighbours += 1 if cell_is_alive?(row, column-1, world)
      neighbours += 1 if cell_is_alive?(row, column+1, world)
      neighbours += 1 if cell_is_alive?(row+1, column-1, world)
      neighbours += 1 if cell_is_alive?(row+1, column, world)
      neighbours += 1 if cell_is_alive?(row+1, column+1, world)
      neighbours
    end
  end
end