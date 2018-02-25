require 'rspec'
require 'rule/keyword_term'

RSpec.describe 'KeywordTerm' do

  context '#resolve' do
    it 'calls resolve on the receiver' do
      receiver = double('receiver', :resolve => [])
      arg1 = double('arg1', :resolve => 1)
      arg2 = double('arg2', :resolve => 2)

      expect(receiver).to receive(:resolve).with(no_args)

      KeywordTerm.new(receiver, :slice, arg1, arg2).resolve
    end

    it 'calls resolve on all arguments' do

      receiver = double('receiver', :resolve => [])
      arg1 = double('arg1', :resolve => 0)
      arg2 = double('arg2', :resolve => 0)

      expect(arg1).to receive(:resolve).with(no_args)
      expect(arg2).to receive(:resolve).with(no_args)

      KeywordTerm.new(receiver, :slice, arg1, arg2).resolve

    end

    it 'calls operator on receiver with arguments and return the value' do
      receiver = double('receiver', :resolve => [1, 2, 3, 4])
      arg1 = double('arg1', :resolve => 1)
      arg2 = double('arg2', :resolve => 2)

      expect(arg1).to receive(:resolve).with(no_args)
      expect(arg2).to receive(:resolve).with(no_args)

      expect(KeywordTerm.new(receiver, :slice, arg1, arg2).resolve).to eq([2, 3])
    end
  end

end