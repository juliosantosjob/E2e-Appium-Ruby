def load_file(folder, file)

  # load a yml file
  YAML.load_file(File.join(__dir__, folder, file))
end

def read_file(folder, file)

  # Loading YAML file content as a string
  yaml_content = File.read(File.join(__dir__, folder, file))

  # Creating an ERB object with the model
  erb_template = ERB.new(yaml_content)

  # Rendering the model with variables
  evaluated_yaml = erb_template.result(binding)

  # Converting the resulting string back to a YAML object
  config = YAML.safe_load(evaluated_yaml)
end
