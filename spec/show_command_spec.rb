require 'rspec'
require 'stringio'
require 'timeout'

require_relative '../lib/show_command'

describe 'Show Command' do

  context "when there is no tasks" do
    let(:command) { ShowCommand.new }

    it 'should return nothing' do
      expect(command.execute('show')).to be_empty
    end
  end

  context "when there is a project with a task" do
    let(:command) { ShowCommand.new(@project_hash) }

    before do
      task1 = Task.new(1, 'Eat more donuts.', false)
      @project_hash = { secrets: [task1] }
    end

    it 'should return a project with its task' do
      expect(command.execute('show')).to eq([
          "secrets\n",
          "  [ ] 1: Eat more donuts.\n",
          "\n"
        ])
    end

  end

  context "when there is a project with two tasks" do
    let(:command) { ShowCommand.new(@project_hash) }

    before do
      task1 = Task.new(1, 'Eat more donuts.', false)
      task2 = Task.new(2, 'Destroy all humans.', false)

      @project_hash = {
        secrets: [
          task1,
          task2
        ]
      }
    end

    it 'should return a project with its task' do
      expect(command.execute('show')).to eq([
          "secrets\n",
          "  [ ] 1: Eat more donuts.\n",
          "  [ ] 2: Destroy all humans.\n",
          "\n"
        ])
    end
  end

 context "when there are two projects with two tasks" do
    let(:command) { ShowCommand.new(@project_hash) }

    before do
      task1 = Task.new(1, 'Eat more donuts.', false)
      task2 = Task.new(2, 'Destroy all humans.', false)
      task3 = Task.new(3, 'Four Elements of Simple Design', false)
      task4 = Task.new(4, 'SOLID', false)

      @project_hash = {
        secrets: [
          task1,
          task2
        ],
        training: [
          task3,
          task4
        ]
      }
    end

    it 'should return a project with its task' do
      expect(command.execute('show')).to eq([
          "secrets\n",
          "  [ ] 1: Eat more donuts.\n",
          "  [ ] 2: Destroy all humans.\n",
          "\n",
          "training\n",
          "  [ ] 3: Four Elements of Simple Design\n",
          "  [ ] 4: SOLID\n",
          "\n"
        ])
    end
  end

end
