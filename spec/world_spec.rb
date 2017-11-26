module GameOfLife
  require 'rspec'
  require 'world'

  describe World do
    before(:all) do
      @world = World.new

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

    it 'A signle dead cell, stays dead.' do
      expect(@world.tick!(@dead_cell)).to eq(@dead_cell)
    end

    it 'A single live cell, dies.' do
      expect(@world.tick!(@living_cell)).to eq(@dead_cell)
    end

    it 'A world with all dead cells, remains lifeless.' do
      expect(@world.tick!(@empty_tiny_world)).to eq(@empty_tiny_world)
    end

    it 'Life and death are observable.' do
      expect(@world.cell_is_alive?(0, 0, @cell_with_n_neighbour)).to eq(false)
      expect(@world.cell_is_alive?(0, 1, @cell_with_n_neighbour)).to eq(true)
      expect(@world.cell_is_alive?(0, 2, @cell_with_n_neighbour)).to eq(false)
      expect(@world.cell_is_alive?(1, 0, @cell_with_n_neighbour)).to eq(false)
      expect(@world.cell_is_alive?(1, 1, @cell_with_n_neighbour)).to eq(true)
      expect(@world.cell_is_alive?(1, 2, @cell_with_n_neighbour)).to eq(false)
      expect(@world.cell_is_alive?(2, 0, @cell_with_n_neighbour)).to eq(false)
      expect(@world.cell_is_alive?(2, 1, @cell_with_n_neighbour)).to eq(false)
      expect(@world.cell_is_alive?(2, 2, @cell_with_n_neighbour)).to eq(false)
    end

    it 'A living cell is aware of its living neighbours in all directions.' do
      expect(@world.neighbour_count(1, 1, @cell_with_nw_neighbour)).to eq(1)
      expect(@world.neighbour_count(1, 1, @cell_with_n_neighbour)).to eq(1)
      expect(@world.neighbour_count(1, 1, @cell_with_ne_neighbour)).to eq(1)
      expect(@world.neighbour_count(1, 1, @cell_with_w_neighbour)).to eq(1)
      expect(@world.neighbour_count(1, 1, @cell_with_e_neighbour)).to eq(1)
      expect(@world.neighbour_count(1, 1, @cell_with_sw_neighbour)).to eq(1)
      expect(@world.neighbour_count(1, 1, @cell_with_s_neighbour)).to eq(1)
      expect(@world.neighbour_count(1, 1, @cell_with_se_neighbour)).to eq(1)
    end

    it 'A living cell knows exactly how many neighbours it has.' do
      expect(@world.neighbour_count(1, 1, @cell_with_2_neighbours)).to eq(2)
      expect(@world.neighbour_count(1, 1, @cell_with_3_neighbours)).to eq(3)
      expect(@world.neighbour_count(1, 1, @full_tiny_world)).to eq(8)
    end

    context 'edge cases' do
      it 'Cells on the edge of the world can detect neighbours.' do
        expect(@world.neighbour_count(0, 0, @full_tiny_world)).to eq(3)
        expect(@world.neighbour_count(0, 1, @full_tiny_world)).to eq(5)
        expect(@world.neighbour_count(0, 2, @full_tiny_world)).to eq(3)

        expect(@world.neighbour_count(1, 0, @full_tiny_world)).to eq(5)
        expect(@world.neighbour_count(1, 2, @full_tiny_world)).to eq(5)

        expect(@world.neighbour_count(2, 0, @full_tiny_world)).to eq(3)
        expect(@world.neighbour_count(2, 1, @full_tiny_world)).to eq(5)
        expect(@world.neighbour_count(2, 2, @full_tiny_world)).to eq(3)
      end

      it 'Cells over the edge of the world can detect neighbours.' do
        expect(@world.neighbour_count(-1, 0, @full_tiny_world)).to eq(2)
        expect(@world.neighbour_count(-1, 1, @full_tiny_world)).to eq(3)
        expect(@world.neighbour_count(-1, 2, @full_tiny_world)).to eq(2)

        expect(@world.neighbour_count(0, -1, @full_tiny_world)).to eq(2)
        expect(@world.neighbour_count(1, -1, @full_tiny_world)).to eq(3)
        expect(@world.neighbour_count(2, -1, @full_tiny_world)).to eq(2)

        expect(@world.neighbour_count(3, 0, @full_tiny_world)).to eq(2)
        expect(@world.neighbour_count(3, 1, @full_tiny_world)).to eq(3)
        expect(@world.neighbour_count(3, 2, @full_tiny_world)).to eq(2)

        expect(@world.neighbour_count(0, 3, @full_tiny_world)).to eq(2)
        expect(@world.neighbour_count(1, 3, @full_tiny_world)).to eq(3)
        expect(@world.neighbour_count(2, 3, @full_tiny_world)).to eq(2)
      end
    end

    context 'Rule#1: Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.' do
      it 'A live cell with no neighbours dies.' do
        expect(@world.tick!(@cell_with_no_neighbours)).to eq(@empty_tiny_world)
      end

      it 'A live cell with one neighbour dies.' do
        expect(@world.tick!(@cell_with_n_neighbour)).to eq(@empty_tiny_world)
      end
    end

    context 'Rule#2: Any live cell with two or three live neighbours lives on to the next generation.' do
      it 'A live cell with two neighbours lives.' do
        new_map = @world.tick!(@cell_with_2_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(true)
      end

      it 'A live cell with three neighbours lives.' do
        new_map = @world.tick!(@cell_with_3_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(true)
      end
    end

    context 'Rule#3: Any live cell with more than three live neighbours dies, as if by overpopulation.' do
      it 'A live cell, and four neighbours dies.' do
        new_map = @world.tick!(@cell_with_4_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end
      it 'A live cell, and five neighbours dies.' do
        new_map = @world.tick!(@cell_with_5_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end
      it 'A live cell, and six neighbours dies.' do
        new_map = @world.tick!(@cell_with_6_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end
      it 'A live cell, and seven neighbours dies.' do
        new_map = @world.tick!(@cell_with_7_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end
      it 'A live cell, and eight neighbours dies.' do
        new_map = @world.tick!(@full_tiny_world)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end
    end

    context 'Rule#4: Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.' do

      it 'Dead cell with no neighbours, nothing happens.' do
        new_map = @world.tick!(@empty_tiny_world)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end

      it 'Dead cell with one neighbour, nothing happens.' do
        new_map = @world.tick!(@dead_cell_with_1_neighbour)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end

      it 'Dead cell with two neighbour, nothing happens.' do
        new_map = @world.tick!(@dead_cell_with_2_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end

      it 'Dead cell with three neighbour, life happens!' do
        new_map = @world.tick!(@dead_cell_with_3_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(true)
      end

      it 'Dead cell with four neighbour, nothing happens.' do
        new_map = @world.tick!(@dead_cell_with_4_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end

      it 'Dead cell with five neighbour, nothing happens.' do
        new_map = @world.tick!(@dead_cell_with_5_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end

      it 'Dead cell with six neighbour, nothing happens.' do
        new_map = @world.tick!(@dead_cell_with_6_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end

      it 'Dead cell with seven neighbour, nothing happens.' do
        new_map = @world.tick!(@dead_cell_with_7_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end

      it 'Dead cell with all neighbours, nothing happens.' do
        new_map = @world.tick!(@dead_cell_with_8_neighbours)
        expect(@world.cell_is_alive?(1, 1, new_map)).to eq(false)
      end
    end
  end
end