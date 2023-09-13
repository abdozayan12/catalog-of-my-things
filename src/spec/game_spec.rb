require_relative '../game'

describe Game do
  before(:each) do
    @game = Game.new(Date.new(2020 / 0o1 / 0o1), 1, Date.new(2020 / 0o3 / 0o4))
    @game1 = Game.new(Date.new(2020 / 0o2 / 0o3), 1, Date.new(2022 / 0o3 / 0o4))
  end

  it 'correctly creates a game instance' do
    expect(@game).to be_an_instance_of(Game)
  end

  it 'correctly assigns the multiplayer value' do
    expect(@game.multiplayer).to be_truthy
  end

  it 'checks that each game has an id attribute' do
    expect(@game1.id).to_not be_nil
  end
end
