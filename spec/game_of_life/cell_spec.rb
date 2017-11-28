require 'rspec'
require 'game_of_life/cell'

module GameOfLife

  describe Cell do

    before(:all) do

      @dead_cell                    = [[0]]

      @living_cell                  = [[1]]

      @empty_tiny_world             = [[0, 0, 0],
                                       [0, 0, 0],
                                       [0, 0, 0]]

      @cell_with_no_neighbours      = [[0, 0, 0],
                                       [0, 1, 0],
                                       [0, 0, 0]]

      @cell_with_nw_neighbour       = [[1, 0, 0],
                                       [0, 1, 0],
                                       [0, 0, 0]]

      @cell_with_n_neighbour        = [[0, 1, 0],
                                       [0, 1, 0],
                                       [0, 0, 0]]

      @cell_with_ne_neighbour       = [[0, 0, 1],
                                       [0, 1, 0],
                                       [0, 0, 0]]

      @cell_with_w_neighbour        = [[0, 0, 0],
                                       [1, 1, 0],
                                       [0, 0, 0]]

      @cell_with_e_neighbour        = [[0, 0, 0],
                                       [0, 1, 1],
                                       [0, 0, 0]]

      @cell_with_sw_neighbour       = [[0, 0, 0],
                                       [0, 1, 0],
                                       [1, 0, 0]]

      @cell_with_s_neighbour        = [[0, 0, 0],
                                       [0, 1, 0],
                                       [0, 1, 0]]

      @cell_with_se_neighbour       = [[0, 0, 0],
                                       [0, 1, 0],
                                       [0, 0, 1]]

      @cell_with_2_neighbours       = [[0, 1, 0],
                                       [1, 1, 0],
                                       [0, 0, 0]]

      @cell_with_3_neighbours       = [[0, 1, 0],
                                       [1, 1, 0],
                                       [0, 1, 0]]

      @cell_with_4_neighbours       = [[0, 1, 0],
                                       [1, 1, 1],
                                       [0, 1, 0]]

      @cell_with_5_neighbours       = [[1, 1, 0],
                                       [1, 1, 1],
                                       [0, 1, 0]]

      @cell_with_6_neighbours       = [[1, 1, 0],
                                       [1, 1, 1],
                                       [1, 1, 0]]

      @cell_with_7_neighbours       = [[1, 1, 1],
                                       [1, 1, 1],
                                       [1, 1, 0]]

      @full_tiny_world              = [[1, 1, 1],
                                       [1, 1, 1],
                                       [1, 1, 1]]

      @dead_cell_with_1_neighbour   = [[0, 1, 0],
                                       [0, 0, 0],
                                       [0, 0, 0]]

      @dead_cell_with_2_neighbours  = [[0, 1, 0],
                                       [1, 0, 0],
                                       [0, 0, 0]]

      @dead_cell_with_3_neighbours  = [[0, 1, 0],
                                       [1, 0, 0],
                                       [0, 1, 0]]

      @dead_cell_with_4_neighbours  = [[0, 1, 0],
                                       [1, 0, 1],
                                       [0, 1, 0]]

      @dead_cell_with_5_neighbours  = [[1, 1, 0],
                                       [1, 0, 1],
                                       [0, 1, 0]]

      @dead_cell_with_6_neighbours  = [[1, 1, 0],
                                       [1, 0, 1],
                                       [1, 1, 0]]

      @dead_cell_with_7_neighbours  = [[1, 1, 1],
                                       [1, 0, 1],
                                       [1, 1, 0]]

      @dead_cell_with_8_neighbours  = [[1, 1, 1],
                                       [1, 0, 1],
                                       [1, 1, 1]]
    end

    context 'Cells' do

      it 'A single dead cell, stays dead.' do
        expect(Cell.evolve(row: 0, column: 0, world_map: @dead_cell)).to eq(DEAD)
      end

      it 'A single live cell, dies.' do
        expect(Cell.evolve(row: 0, column: 0, world_map: @living_cell)).to eq(DEAD)
      end

      it 'Life and death are observable.' do
        expect(Cell.dead?(row: 0, column: 0, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.alive?(row: 0, column: 1, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.dead?(row: 0, column: 2, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.dead?(row: 1, column: 0, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.alive?(row: 1, column: 1, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.dead?(row: 1, column: 2, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.dead?(row: 2, column: 0, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.dead?(row: 2, column: 1, world_map: @cell_with_n_neighbour)).to eq(true)
        expect(Cell.dead?(row: 2, column: 2, world_map: @cell_with_n_neighbour)).to eq(true)
      end

      it 'A cell is aware of its living neighbours in all directions.' do
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_nw_neighbour)).to eq(1)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_n_neighbour)).to eq(1)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_ne_neighbour)).to eq(1)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_w_neighbour)).to eq(1)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_e_neighbour)).to eq(1)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_sw_neighbour)).to eq(1)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_s_neighbour)).to eq(1)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_se_neighbour)).to eq(1)
      end

      it 'A cell knows exactly how many neighbours it has.' do
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_2_neighbours)).to eq(2)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @cell_with_3_neighbours)).to eq(3)
        expect(Cell.neighbour_count(row: 1, column: 1, world_map: @full_tiny_world)).to eq(8)
      end

      context 'edge cases' do

        it 'Cells on the edge of the world_map can detect neighbours.' do
          expect(Cell.neighbour_count(row: 0, column: 0, world_map: @full_tiny_world)).to eq(3)
          expect(Cell.neighbour_count(row: 0, column: 1, world_map: @full_tiny_world)).to eq(5)
          expect(Cell.neighbour_count(row: 0, column: 2, world_map: @full_tiny_world)).to eq(3)

          expect(Cell.neighbour_count(row: 1, column: 0, world_map: @full_tiny_world)).to eq(5)
          expect(Cell.neighbour_count(row: 1, column: 2, world_map: @full_tiny_world)).to eq(5)

          expect(Cell.neighbour_count(row: 2, column: 0, world_map: @full_tiny_world)).to eq(3)
          expect(Cell.neighbour_count(row: 2, column: 1, world_map: @full_tiny_world)).to eq(5)
          expect(Cell.neighbour_count(row: 2, column: 2, world_map: @full_tiny_world)).to eq(3)
        end

        it 'Cells over the edge of the world_map can detect neighbours.' do
          expect(Cell.neighbour_count(row: -1, column: 0, world_map: @full_tiny_world)).to eq(2)
          expect(Cell.neighbour_count(row: -1, column: 1, world_map: @full_tiny_world)).to eq(3)
          expect(Cell.neighbour_count(row: -1, column: 2, world_map: @full_tiny_world)).to eq(2)

          expect(Cell.neighbour_count(row: 0, column: -1, world_map: @full_tiny_world)).to eq(2)
          expect(Cell.neighbour_count(row: 1, column: -1, world_map: @full_tiny_world)).to eq(3)
          expect(Cell.neighbour_count(row: 2, column: -1, world_map: @full_tiny_world)).to eq(2)

          expect(Cell.neighbour_count(row: 3, column: 0, world_map: @full_tiny_world)).to eq(2)
          expect(Cell.neighbour_count(row: 3, column: 1, world_map: @full_tiny_world)).to eq(3)
          expect(Cell.neighbour_count(row: 3, column: 2, world_map: @full_tiny_world)).to eq(2)

          expect(Cell.neighbour_count(row: 0, column: 3, world_map: @full_tiny_world)).to eq(2)
          expect(Cell.neighbour_count(row: 1, column: 3, world_map: @full_tiny_world)).to eq(3)
          expect(Cell.neighbour_count(row: 2, column: 3, world_map: @full_tiny_world)).to eq(2)
        end
      end
    end

    context 'Rules' do

      def does_it_live?(map)
        Cell.evolve(row: 1, column: 1, world_map: map) == ALIVE
      end

      it 'Rule#1: Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.' do
        expect(does_it_live?(@cell_with_no_neighbours)).to eq(false)
        expect(does_it_live?(@cell_with_n_neighbour)).to eq(false)
      end

      it 'Rule#2: Any live cell with two or three live neighbours lives on to the next generation.' do
        expect(does_it_live?(@cell_with_2_neighbours)).to eq(true)
        expect(does_it_live?(@cell_with_3_neighbours)).to eq(true)
      end

      it 'Rule#3: Any live cell with more than three live neighbours dies, as if by overpopulation.' do
        expect(does_it_live?(@cell_with_4_neighbours)).to eq(false)
        expect(does_it_live?(@cell_with_5_neighbours)).to eq(false)
        expect(does_it_live?(@cell_with_6_neighbours)).to eq(false)
        expect(does_it_live?(@cell_with_7_neighbours)).to eq(false)
        expect(does_it_live?(@full_tiny_world)).to eq(false)
      end

      it 'Rule#4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.' do
        expect(does_it_live?(@empty_tiny_world)).to eq(false)
        expect(does_it_live?(@dead_cell_with_1_neighbour)).to eq(false)
        expect(does_it_live?(@dead_cell_with_2_neighbours)).to eq(false)
        expect(does_it_live?(@dead_cell_with_3_neighbours)).to eq(true)
        expect(does_it_live?(@dead_cell_with_4_neighbours)).to eq(false)
        expect(does_it_live?(@dead_cell_with_5_neighbours)).to eq(false)
        expect(does_it_live?(@dead_cell_with_6_neighbours)).to eq(false)
        expect(does_it_live?(@dead_cell_with_7_neighbours)).to eq(false)
        expect(does_it_live?(@dead_cell_with_8_neighbours)).to eq(false)
      end
    end
  end
end
