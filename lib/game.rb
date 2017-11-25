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
  end
end