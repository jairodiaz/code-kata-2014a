require 'rspec'
require 'pry'

require_relative '../lib/task'
require_relative '../lib/deadline_command'

describe DeadlineCommand do
  let(:deadline_command) do
    task1 = Task.new(1, 'Eat more donuts.', false)
    project_hash = { secrets: [task1] }
    DeadlineCommand.new(project_hash)
  end

  context 'when one or more arguments are missing' do
    it 'should fail when the task id and deadline are missing' do
      expect(deadline_command.execute('deadline')).to eq "Please enter a task ID and deadline\n"
    end

    it 'should fail when the deadline is missing' do
      expect(deadline_command.execute('deadline 1')).to eq "Please enter a deadline."
    end
  end

  context 'when the arguments are present' do
    it 'should fail when the task id is invalid' do
      expect(deadline_command.execute('deadline 2 02/10/2014')).to eq "Could not find a task with an ID of 2.\n"
    end

    context 'when the task is valid' do
      it 'should set a dateline for a task' do
        task = double('task')
        allow(task).to receive(:id).and_return(1)
        project_hash = { secrets: [task] }

        expect(task).to receive(:deadline=)#.with("02/10/2014")
        DeadlineCommand.new(project_hash).execute("deadline 1 02/10/2014")
      end

      it 'should return a success message' do
        expect(deadline_command.execute('deadline 1 02/10/2014')).to eq "Success\n"
      end
    end
  end
end
