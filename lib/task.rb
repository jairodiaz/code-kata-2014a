class Task
  attr_reader :id, :description
  attr_accessor :done
  attr_accessor :deadline

  def initialize(id, description, done)
    @id = id
    @description = description
    @done = done
  end

  def done?
    done
  end
end
