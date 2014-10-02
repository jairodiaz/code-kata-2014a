require_relative '../lib/deadline_command'

describe DeadlineCommand do
  it 'should receive a task id' do
    expect(DeadlineCommand.new.execute('deadline 1')). to eq 'Success'
  end

  it 'shoud fail when the task id is missing' do
    expect(DeadlineCommand.new.execute('deadline')). to eq 'Please enter a task ID'
  end

  it 'shoud fail when the task id is invalid' do

  end


  it 'should set a dateline for a task'
end
