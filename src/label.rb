# require_relative 'modules/store_json'
require 'json'
class Label
  # include StoreJson
  attr_reader :id, :items
  attr_accessor :title, :color

  # @initial_id = 0
  def initialize(title, color, id = nil)
    # self.class.increment_initial_id
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def self.save_data_to_json(file_name, data)
    existing_data = []
    existing_data = JSON.parse(File.read(file_name)) if File.exist?(file_name)

    combined_data = existing_data + data.map(&:to_hash)

    File.write(file_name, JSON.generate(combined_data))
  end

  def self.display_all_labels
    if File.exist?('local_db/labels.json')
      labels_data = JSON.parse(File.read('local_db/labels.json'))
      puts 'List of labels:'
      labels_data.each do |label|
        puts "ID: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
      end
    else
      puts 'No labels found.'
    end
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_hash
    {
      id: id,
      title: title,
      color: color
      # publish_date: publish_date
      # Add other attributes as needed
    }
  end
  # def self.increment_initial_id
  #   @initial_id += 1
  # end
  #
  # def self.access_initial_id
  #   @initial_id
  # end
end
