require 'rails_helper'

RSpec.describe Speaker, :type => :model do
  subject { described_class.new }
  it "is valid with valid attributes" do
    subject.name = "Anything"
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    speaker = Speaker.new(name: nil)
    expect(speaker).to_not be_valid
  end
end