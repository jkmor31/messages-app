require 'rails_helper'

RSpec.describe Message, :type => :model do
    
    subject { described_class.new(title: "Anything",
                                description: "Lorem ipsum",
                                tag: "tag", 
                                speaker_id: 1) 
    }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a tag" do
    subject.tag = nil
    expect(subject).to_not be_valid
  end

end