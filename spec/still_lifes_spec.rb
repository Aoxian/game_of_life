module GameOfLife
  require 'rspec'
  require 'world'

  describe 'Still Lifes' do
    before(:all) do
      @world = World.new
    end

    def is_still_life?(map)
      expect(@world.tick!(map)).to eq(map)
    end

    it 'Block' do
      is_still_life?([[0, 0, 0, 0],
                      [0, 1, 1, 0],
                      [0, 1, 1, 0],
                      [0, 0, 0, 0]])
    end

    it 'Beehive' do
      is_still_life?([[0, 0, 0, 0, 0, 0],
                      [0, 0, 1, 1, 0, 0],
                      [0, 1, 0, 0, 1, 0],
                      [0, 0, 1, 1, 0, 0],
                      [0, 0, 0, 0, 0, 0]])
    end

    it 'Loaf' do
      is_still_life?([[0, 0, 0, 0, 0, 0],
                      [0, 0, 1, 1, 0, 0],
                      [0, 1, 0, 0, 1, 0],
                      [0, 0, 1, 0, 1, 0],
                      [0, 0, 0, 1, 0, 0],
                      [0, 0, 0, 0, 0, 0]])
    end

    it 'Boat' do
      is_still_life?([[0, 0, 0, 0, 0],
                      [0, 1, 1, 0, 0],
                      [0, 1, 0, 1, 0],
                      [0, 0, 1, 0, 0],
                      [0, 0, 0, 0, 0]])
    end

    it 'Tub' do
      is_still_life?([[0, 0, 0, 0, 0],
                      [0, 0, 1, 0, 0],
                      [0, 1, 0, 1, 0],
                      [0, 0, 1, 0, 0],
                      [0, 0, 0, 0, 0]])
    end
  end
end