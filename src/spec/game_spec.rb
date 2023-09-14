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

  it 'should determine if it can be archived' do
    eleven_years_ago = Date.today - (11 * 365)
    game = Game.new(Date.today, 1, eleven_years_ago)
    expect(game.can_be_archived?).to_not be_truthy
  end

  it 'should not be archived if less than 10 years old' do
    game = Game.new(Date.today - (9 * 365), 1, Date.today - 1)
    expect(game.can_be_archived?).to_not be_falsey
  end
end
