module GameOfLife

  class World

    def tick!(world_map)
      new_map = []
      world_map.each_with_index do |row, row_index|
        new_row = []
        row.each_index do |column_index|
          new_row << Cell.evolve(row: row_index, column: column_index, world_map: world_map)
        end
        new_map << new_row
      end
      new_map
    end
  end
end
