module GameOfLife
  ALIVE = 1
  DEAD = 0

  class Cell

    def self.alive?(cell)
      cell_out_of_bounds?(cell) ? false : cell[:world_map][cell[:row]][cell[:column]] == ALIVE
    end

    def self.dead?(cell)
      !alive?(cell)
    end

    def self.neighbour_count(cell)
      0 + neighbour_to_nw(cell) +
          neighbour_to_n(cell) +
          neighbour_to_ne(cell) +
          neighbour_to_w(cell) +
          neighbour_to_e(cell) +
          neighbour_to_sw(cell) +
          neighbour_to_s(cell) +
          neighbour_to_se(cell)
    end

    def self.evolve(cell)
      living_with_two_or_three_neighbours(cell) || dead_with_three_neighbours(cell) ? ALIVE : DEAD
    end

    private

    def self.dead_with_three_neighbours(cell)
      dead?(cell) && neighbour_count(cell) == 3
    end

    def self.living_with_two_or_three_neighbours(cell)
      alive?(cell) && (neighbour_count(cell) == 2 || neighbour_count(cell) == 3)
    end

    def self.cell_out_of_bounds?(cell)
      cell[:row] < 0 || cell[:column] < 0 || cell[:row] >= cell[:world_map].length || cell[:column] >= cell[:world_map][cell[:row]].length
    end

    def self.neighbour_to_nw(cell)
      alive?(row: cell[:row] - 1, column: cell[:column] - 1, world_map: cell[:world_map]) ? ALIVE : DEAD
    end

    def self.neighbour_to_n(cell)
      alive?(row: cell[:row] - 1, column: cell[:column], world_map: cell[:world_map]) ? ALIVE : DEAD
    end

    def self.neighbour_to_ne(cell)
      alive?(row: cell[:row] - 1, column: cell[:column] + 1, world_map: cell[:world_map]) ? ALIVE : DEAD
    end

    def self.neighbour_to_w(cell)
      alive?(row: cell[:row], column: cell[:column] - 1, world_map: cell[:world_map]) ? ALIVE : DEAD
    end

    def self.neighbour_to_e(cell)
      alive?(row: cell[:row], column: cell[:column] + 1, world_map: cell[:world_map]) ? ALIVE : DEAD
    end

    def self.neighbour_to_sw(cell)
      alive?(row: cell[:row] + 1, column: cell[:column] - 1, world_map: cell[:world_map]) ? ALIVE : DEAD
    end

    def self.neighbour_to_s(cell)
      alive?(row: cell[:row] + 1, column: cell[:column], world_map: cell[:world_map]) ? ALIVE : DEAD
    end

    def self.neighbour_to_se(cell)
      alive?(row: cell[:row] + 1, column: cell[:column] + 1, world_map: cell[:world_map]) ? ALIVE : DEAD
    end
  end
end
