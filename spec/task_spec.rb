require_relative '../lib/task'

describe Task do
  subject { Task.new('name', 'description', false) }

  it { should respond_to :id }
  it { should respond_to :description }
  it { should respond_to :done }
  it { should respond_to :deadline }
end
