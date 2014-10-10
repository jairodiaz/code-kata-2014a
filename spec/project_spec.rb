require_relative '../lib/project'

describe Project do
  subject { Project.new('name') }

  it { should respond_to :name }
end
