class ShowCommand
  def initialize(list_of_tasks = nil)
    @tasks = list_of_tasks
  end

  def execute(command_line)
    return [] if @tasks.nil?

    output = []
    i = 0
    @tasks.each do |project_name, project_tasks|
      output << "#{project_name}\n"
      project_tasks.each do |task|
        output << sprintf("  [%c] %d: %s\n", (' '), i+=1, task)
      end
      output << "\n"
    end
    output
  end
end
