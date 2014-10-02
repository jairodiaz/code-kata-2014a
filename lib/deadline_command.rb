class DeadlineCommand
  def initialize(list_of_tasks = nil)
    @tasks = list_of_tasks
  end

  def execute(command_line)
    command, id, dateline = Shellwords.split(command_line)
    return "Please enter a task ID and deadline\n" if id.nil?
    return "Please enter a deadline." if dateline.nil?

    task = find_task(id)
    return "Could not find a task with an ID of #{id}.\n" unless task

    task.deadline = DateTime.parse(dateline)
    "Success\n"
  end

  def find_task(id_string)
    id = id_string.to_i
    task = @tasks.collect { |project_name, project_tasks|
      project_tasks.find { |t| t.id == id }
    }.reject(&:nil?).first
    task
  end
end
