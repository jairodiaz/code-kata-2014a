require_relative '../lib/task_list'

class TaskList
  public :execute
end

describe TaskList do
  let(:task_list) do
    @input_reader, @input_writer = IO.pipe
    @output_reader, @output_writer = IO.pipe

    TaskList.new(@input_reader, @output_writer)
  end

  context 'Deadline command' do
    context 'When the task exist' do
      it 'should suppor the command \'deadline\'' do
       task_list.execute('deadline')
       read_lines(
         "Please enter a task ID and deadline"
       )
      end
    end

    def read(expected_output)
      actual_output = @output_reader.read(expected_output.length)
      expect(actual_output).to eq expected_output
    end

    def read_lines(*expected_output)
      expected_output.each do |line|
        read "#{line}\n"
      end
    end
  end
end
