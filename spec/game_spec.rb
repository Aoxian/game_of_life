module GameOfLife
  require 'rspec'
  require 'game'

  describe 'Game' do
    before(:all) do
      @game = Game.new

      @dead_cell               = [[0]]

      @living_cell             = [[1]]

      @empty_tiny_world        = [[0, 0, 0],
                                  [0, 0, 0],
                                  [0, 0, 0]]

      @cell_with_no_neighbours = [[0, 0, 0],
                                  [0, 1, 0],
                                  [0, 0, 0]]

      @cell_with_nw_neighbour  = [[1, 0, 0],
                                  [0, 1, 0],
                                  [0, 0, 0]]

      @cell_with_n_neighbour   = [[0, 1, 0],
                                  [0, 1, 0],
                                  [0, 0, 0]]

      @cell_with_ne_neighbour  = [[0, 0, 1],
                                  [0, 1, 0],
                                  [0, 0, 0]]

      @cell_with_w_neighbour   = [[0, 0, 0],
                                  [1, 1, 0],
                                  [0, 0, 0]]

      @cell_with_e_neighbour   = [[0, 0, 0],
                                  [0, 1, 1],
                                  [0, 0, 0]]

      @cell_with_sw_neighbour  = [[0, 0, 0],
                                  [0, 1, 0],
                                  [1, 0, 0]]

      @cell_with_s_neighbour   = [[0, 0, 0],
                                  [0, 1, 0],
                                  [0, 1, 0]]

      @cell_with_se_neighbour  = [[0, 0, 0],
                                  [0, 1, 0],
                                  [0, 0, 1]]

      @cell_with_2_neighbours  = [[0, 1, 0],
                                  [1, 1, 0],
                                  [0, 0, 0]]

      @cell_with_3_neighbours  = [[0, 1, 0],
                                  [1, 1, 0],
                                  [0, 1, 0]]

      @full_tiny_world         = [[1, 1, 1],
                                  [1, 1, 1],
                                  [1, 1, 1]]
    end

    it 'A signle dead cell, stays dead.' do
      expect(@game.play(@dead_cell)).to eq(@dead_cell)
    end

    it 'A single live cell, dies.' do
      expect(@game.play(@living_cell)).to eq(@dead_cell)
    end

    it 'A world with all dead cells, remains lifeless.' do
      expect(@game.play(@empty_tiny_world)).to eq(@empty_tiny_world)
    end

    it 'Life and death are observable.' do
      expect(@game.cell_is_alive?(0, 0, @cell_with_n_neighbour)).to eq(false)
      expect(@game.cell_is_alive?(0, 1, @cell_with_n_neighbour)).to eq(true)
      expect(@game.cell_is_alive?(0, 2, @cell_with_n_neighbour)).to eq(false)
      expect(@game.cell_is_alive?(1, 0, @cell_with_n_neighbour)).to eq(false)
      expect(@game.cell_is_alive?(1, 1, @cell_with_n_neighbour)).to eq(true)
      expect(@game.cell_is_alive?(1, 2, @cell_with_n_neighbour)).to eq(false)
      expect(@game.cell_is_alive?(2, 0, @cell_with_n_neighbour)).to eq(false)
      expect(@game.cell_is_alive?(2, 1, @cell_with_n_neighbour)).to eq(false)
      expect(@game.cell_is_alive?(2, 2, @cell_with_n_neighbour)).to eq(false)
    end

    it 'A living cell is aware of its living neighbours in all directions.' do
      expect(@game.neighbour_count(1, 1, @cell_with_nw_neighbour)).to eq(1)
      expect(@game.neighbour_count(1, 1, @cell_with_n_neighbour)).to eq(1)
      expect(@game.neighbour_count(1, 1, @cell_with_ne_neighbour)).to eq(1)
      expect(@game.neighbour_count(1, 1, @cell_with_w_neighbour)).to eq(1)
      expect(@game.neighbour_count(1, 1, @cell_with_e_neighbour)).to eq(1)
      expect(@game.neighbour_count(1, 1, @cell_with_sw_neighbour)).to eq(1)
      expect(@game.neighbour_count(1, 1, @cell_with_s_neighbour)).to eq(1)
      expect(@game.neighbour_count(1, 1, @cell_with_se_neighbour)).to eq(1)
    end

    it 'A living cell knows exactly how many neighbours it has.' do
      expect(@game.neighbour_count(1, 1, @cell_with_2_neighbours)).to eq(2)
      expect(@game.neighbour_count(1, 1, @cell_with_3_neighbours)).to eq(3)
      expect(@game.neighbour_count(1, 1, @full_tiny_world)).to eq(8)
    end

    context 'edge cases' do
      it 'Cells on the edge of the world can detect neighbours.' do
        expect(@game.neighbour_count(0, 0, @full_tiny_world)).to eq(3)
        expect(@game.neighbour_count(0, 1, @full_tiny_world)).to eq(5)
        expect(@game.neighbour_count(0, 2, @full_tiny_world)).to eq(3)

        expect(@game.neighbour_count(1, 0, @full_tiny_world)).to eq(5)
        expect(@game.neighbour_count(1, 2, @full_tiny_world)).to eq(5)

        expect(@game.neighbour_count(2, 0, @full_tiny_world)).to eq(3)
        expect(@game.neighbour_count(2, 1, @full_tiny_world)).to eq(5)
        expect(@game.neighbour_count(2, 2, @full_tiny_world)).to eq(3)
      end

      it 'Cells over the edge of the world can detect neighbours.' do
        expect(@game.neighbour_count(-1, 0, @full_tiny_world)).to eq(2)
        expect(@game.neighbour_count(-1, 1, @full_tiny_world)).to eq(3)
        expect(@game.neighbour_count(-1, 2, @full_tiny_world)).to eq(2)

        expect(@game.neighbour_count(0, -1, @full_tiny_world)).to eq(2)
        expect(@game.neighbour_count(1, -1, @full_tiny_world)).to eq(3)
        expect(@game.neighbour_count(2, -1, @full_tiny_world)).to eq(2)

        expect(@game.neighbour_count(3, 0, @full_tiny_world)).to eq(2)
        expect(@game.neighbour_count(3, 1, @full_tiny_world)).to eq(3)
        expect(@game.neighbour_count(3, 2, @full_tiny_world)).to eq(2)

        expect(@game.neighbour_count(0, 3, @full_tiny_world)).to eq(2)
        expect(@game.neighbour_count(1, 3, @full_tiny_world)).to eq(3)
        expect(@game.neighbour_count(2, 3, @full_tiny_world)).to eq(2)
      end
    end


    context 'Rule#1: Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.' do
      it 'A world with one live cell, and no neighbours dies.' do
        expect(@game.play(@cell_with_no_neighbours)).to eq(@empty_tiny_world)
      end

      it 'A world with one live cell, and one neighbour dies.' do
        expect(@game.play(@cell_with_n_neighbour)).to eq(@empty_tiny_world)
      end
    end
  end
end
