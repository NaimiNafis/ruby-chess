require "yaml"

module SaveManager
  DEFAULT_SAVE_FILE = "save.yaml"

  def self.save(state, filename = DEFAULT_SAVE_FILE)
    File.open(filename, "w") do |file|
      file.puts YAML.dump(state)
    end
    puts "Game saved successfully to #{filename}"
  rescue IOError => e
    puts "An error occurred while saving the game: #{e.message}"
  end

  def self.load(filename = DEFAULT_SAVE_FILE)
    if File.exist?(filename)
      YAML.load(File.read(filename))
    else
      puts "No save file found at #{filename}"
      nil
    end
  rescue IOError => e
    puts "An error occurred while loading the game: #{e.message}"
    nil
  end
end
