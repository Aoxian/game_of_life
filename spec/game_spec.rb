module GameOfLife
  require 'rspec'
  require 'game'

  describe "Game" do

    before(:all) do
      @game = Game.new

      @dead_cell                  = [[0]]

      @living_cell                = [[1]]

      @empty_tiny_world           = [[0, 0, 0],
                                     [0, 0, 0],
                                     [0, 0, 0]]

      @cell_with_no_neighbours     = [[0, 0, 0],
                                      [0, 1, 0],
                                      [0, 0, 0]]

      @cell_with_NW_neighbour     = [[1, 0, 0],
                                     [0, 1, 0],
                                     [0, 0, 0]]

      @cell_with_N_neighbour      = [[0, 1, 0],
                                     [0, 1, 0],
                                     [0, 0, 0]]

      @cell_with_NE_neighbour     = [[0, 0, 1],
                                     [0, 1, 0],
                                     [0, 0, 0]]

      @cell_with_W_neighbour      = [[0, 0, 0],
                                     [1, 1, 0],
                                     [0, 0, 0]]

      @cell_with_E_neighbour      = [[0, 0, 0],
                                     [0, 1, 1],
                                     [0, 0, 0]]

      @cell_with_SW_neighbour     = [[0, 0, 0],
                                     [0, 1, 0],
                                     [1, 0, 0]]

      @cell_with_S_neighbour      = [[0, 0, 0],
                                     [0, 1, 0],
                                     [0, 1, 0]]

      @cell_with_SE_neighbour     = [[0, 0, 0],
                                     [0, 1, 0],
                                     [0, 0, 1]]
    end


    context "Foundational Cell functions" do

      it "A world with one dead cell, produces one dead cell" do
        expect(@game.play(@dead_cell)).to eq(@dead_cell)
      end

      it "A world with one live cell, produces one dead cell" do

        expect(@game.play(@living_cell)).to eq(@dead_cell)
      end

      it "A world with all dead cells, produces a world with all dead cells" do
        expect(@game.play(@empty_tiny_world)).to eq(@empty_tiny_world)
      end
    end

    context "Can detect life." do

      it "When there is one cell with one N neighbours only the cells at (0, 1) and (1,1) are alive" do
        expect(@game.cell_is_alive?(0,0, @cell_with_N_neighbour)).to eq(false)
        expect(@game.cell_is_alive?(0,1, @cell_with_N_neighbour)).to eq(true)
        expect(@game.cell_is_alive?(0,2, @cell_with_N_neighbour)).to eq(false)
        expect(@game.cell_is_alive?(1,0, @cell_with_N_neighbour)).to eq(false)
        expect(@game.cell_is_alive?(1,1, @cell_with_N_neighbour)).to eq(true)
        expect(@game.cell_is_alive?(1,2, @cell_with_N_neighbour)).to eq(false)
        expect(@game.cell_is_alive?(2,0, @cell_with_N_neighbour)).to eq(false)
        expect(@game.cell_is_alive?(2,1, @cell_with_N_neighbour)).to eq(false)
        expect(@game.cell_is_alive?(2,2, @cell_with_N_neighbour)).to eq(false)
      end

    end

    context "A living cell is aware of its living neighbours." do

      it "A cell can detect a neighbour to the NW." do
        expect(@game.neighbour_count(1, 1, @cell_with_NW_neighbour)).to eq(1)
      end

      it "A cell can detect a neighbour to the N." do
        expect(@game.neighbour_count(1, 1, @cell_with_N_neighbour)).to eq(1)
      end

      it "A cell can detect a neighbour to the NE." do
        expect(@game.neighbour_count(1, 1, @cell_with_NE_neighbour)).to eq(1)
      end

      it "A cell can detect a neighbour to the W." do
        expect(@game.neighbour_count(1, 1, @cell_with_W_neighbour)).to eq(1)
      end

      it "A cell can detect a neighbour to the E." do
        expect(@game.neighbour_count(1, 1, @cell_with_E_neighbour)).to eq(1)
      end

      it "A cell can detect a neighbour to the SW." do
        expect(@game.neighbour_count(1, 1, @cell_with_SW_neighbour)).to eq(1)
      end

      it "A cell can detect a neighbour to the S." do
        expect(@game.neighbour_count(1, 1, @cell_with_S_neighbour)).to eq(1)
      end

      it "A cell can detect a neighbour to the SE." do
        expect(@game.neighbour_count(1, 1, @cell_with_SE_neighbour)).to eq(1)
      end
    end

    context "Rule#1: Any live cell with fewer than two live neighbours dies, as if caused by underpopulation." do

      it "A world with one live cell, and no neighbours dies." do
        expect(@game.play(@cell_with_no_neighbours)).to eq(@empty_tiny_world)
      end

      it "A world with one live cell, and one neighbour dies." do
        expect(@game.play(@cell_with_N_neighbour)).to eq(@empty_tiny_world)
      end
    end
  end
end
