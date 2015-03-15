module Nervy
  describe Connection do

    before { @connection = Connection.new }

    subject { @connection }

    it { should respond_to(:get) }

    it { should respond_to(:post) }

    it { should respond_to(:put) }

    it { should respond_to(:delete) }

    it { should respond_to(:public_key) }

    specify { expect { |b| Connection.new(&b) }.to yield_control.once }

    describe 'return value of #public_key' do

      before(:all) { @p_key = Connection.new.public_key }

      subject { @p_key }

      it { should be_a String }

      it { should_not be_empty }

    end

  end
end
