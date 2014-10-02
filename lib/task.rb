class Task
  attr_reader :id, :description
  attr_accessor :done, :deadline

  def initialize(id, description, done)
    @id = id
    @description = description
    @done = done
  end

  def done?
    done
  end

  def deadline(deadline)
    @deadline=deadline
  end
end
