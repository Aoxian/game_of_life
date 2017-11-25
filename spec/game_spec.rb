module GameOfLife
  require 'rspec'
  require 'game'

  describe "Game" do

    before do
      @game = Game.new
    end

    dead_cell = [[0]]
    living_cell = [[1]]
    empty_tiny_world = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    one_cell_no_neighbours = [[0, 0, 0], [0, 1, 0], [0, 0, 0]]

    it "A world with one dead cell, produces one dead cell" do
      expect(@game.play(dead_cell)).to eq(dead_cell)
    end

    it "A world with one live cell, produces one dead cell" do

      expect(@game.play(living_cell)).to eq(dead_cell)
    end

    it "A world with all dead cells, produces a world with all dead cells" do
      expect(@game.play(empty_tiny_world)).to eq(empty_tiny_world)
    end

    it "A world with one live cell, and no neighbours produces a world with all dead cells." do
      expect(@game.play(one_cell_no_neighbours)).to eq(empty_tiny_world)
    end
  end
end
