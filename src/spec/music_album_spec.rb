require_relative '../classes/music_album'
require 'date'

describe MusicAlbum do
  before :each do
    publish_date = Date.parse('2023-09-09')
    @music_album = MusicAlbum.new(true, publish_date)
  end

  it 'is an instance of MusicAlbum' do
    expect(@music_album).to be_an_instance_of(MusicAlbum)
  end

  it 'has an id number' do
    expect(@music_album.id).to be_an(Integer)
  end

  it 'has an on_spotify attribute of type boolean' do
    expect(@music_album.on_spotify).to be(true).or be(false)
  end

  it 'has an archived attribute of type boolean' do
    expect(@music_album.archived).to be(true).or be(false)
  end

  it 'can add a publish_date' do
    @music_album.publish_date = Date.today
    expect(@music_album.publish_date).to eq(Date.today)
  end

  it 'can add an on_spotify' do
    @music_album.on_spotify = true
    expect(@music_album.on_spotify).to be(true)
  end

  it 'can add an archived' do
    @music_album.archived = true
    expect(@music_album.archived).to be(true)
  end

  it 'returns true when parent method and on_spotify are true' do
    expect(@music_album.can_be_archived?).to be(true)
  end
end
