require 'rspec'
require 'pry'

require_relative '../lib/task'
require_relative '../lib/deadline_command'

describe DeadlineCommand do
  let(:deadline_command) { DeadlineCommand.new(@project_hash) }

  before do
    task1 = Task.new(1, 'Eat more donuts.', false)
    @project_hash = { secrets: [task1] }
  end

  it 'should fail when the task id is missing' do
    expect(deadline_command.execute('deadline')). to eq "Please enter a task ID\n"
  end

  it 'should receive a task id' do
    expect(deadline_command.execute('deadline 1')). to eq "Success\n"
  end

  it 'should fail when the task id is invalid' do
    expect(deadline_command.execute('deadline 2')). to eq "Could not find a task with an ID of 2.\n"
  end

  it 'should set a dateline for a task'
end
