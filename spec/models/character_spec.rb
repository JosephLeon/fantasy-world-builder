require 'spec_helper'

describe Character do
  before { @character = Character.new(name: "Example User", intelligence: "21") }
  subject { @character }
  it { should respond_to(:name) }
  it { should respond_to(:intelligence) }
end
