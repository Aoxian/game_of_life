module GameOfLife
  class World
    DEAD = 0
    ALIVE = 1

    def tick!(world_map)
      new_map = []
      world_map.each_with_index do |row, row_index|
        new_row = []
        row.each_with_index do |cell, column_index|
          new_row << new_cell(cell, neighbour_count(row_index, column_index, world_map))
        end
        new_map << new_row
      end
      new_map
    end

    def cell_is_alive?(row, column, world)
      return false if row < 0 || column < 0 || row >= world.length || column >= world[row].length
      world[row][column] == 1
    end

    def neighbour_count(row, column, world)
      0 + neighbour_to_nw(row, column, world) +
          neighbour_to_n(row, column, world) +
          neighbour_to_ne(row, column, world) +
          neighbour_to_w(row, column, world) +
          neighbour_to_e(row, column, world) +
          neighbour_to_sw(row, column, world) +
          neighbour_to_s(row, column, world) +
          neighbour_to_se(row, column, world)
    end

    private

    def new_cell(cell, living_neighbours)
      return DEAD if cell_has_fewer_than_two(living_neighbours, cell)
      return ALIVE if cell_has_two_or_three(living_neighbours, cell)
      return DEAD if cell_has_more_than_three(living_neighbours, cell)
      return ALIVE if dead_cell_with_exactly_three(living_neighbours, cell)
      DEAD
    end

    def cell_has_fewer_than_two(living_neighbours, cell)
      cell == 1 && living_neighbours < 2
    end

    def cell_has_two_or_three(living_neighbours, cell)
      cell == 1 && (living_neighbours == 2 || living_neighbours == 3)
    end

    def cell_has_more_than_three(living_neighbours, cell)
      cell == 1 && living_neighbours > 3
    end

    def dead_cell_with_exactly_three(living_neighbours, cell)
      cell == 0 && living_neighbours == 3
    end

    def neighbour_to_nw(row, column, world)
      return 1 if cell_is_alive?(row - 1, column - 1, world)
      0
    end

    def neighbour_to_n(row, column, world)
      return 1 if cell_is_alive?(row - 1, column, world)
      0
    end

    def neighbour_to_ne(row, column, world)
      return 1 if cell_is_alive?(row - 1, column + 1, world)
      0
    end

    def neighbour_to_w(row, column, world)
      return 1 if cell_is_alive?(row, column - 1, world)
      0
    end

    def neighbour_to_e(row, column, world)
      return 1 if cell_is_alive?(row, column + 1, world)
      0
    end

    def neighbour_to_sw(row, column, world)
      return 1 if cell_is_alive?(row + 1, column - 1, world)
      0
    end

    def neighbour_to_s(row, column, world)
      return 1 if cell_is_alive?(row + 1, column, world)
      0
    end

    def neighbour_to_se(row, column, world)
      return 1 if cell_is_alive?(row + 1, column + 1, world)
      0
    end
  end
end
