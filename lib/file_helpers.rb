module FileHelpers

  def read_file_text(file_name)
    file = File.open(file_name, "r")
    text = file.read.chomp
    file.close
    text
  end

  def write_file_text(file_name, text)
    file = File.open(file_name, "w")
    file.write(text)
    file.close
  end

end
