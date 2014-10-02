class DeadlineCommand

  def initialize
  end

  def execute(command_line)
    command, id = Shellwords.split(command_line)
    return 'Please enter a task ID' if id.nil?
    'Success'
  end
end
