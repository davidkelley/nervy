module Nervy
  describe Channel::Create do

    before { @create = Channel::Create.new }

    subject { @create }

    it { should respond_to(:create!) }

    it { should respond_to(:body) }

    it { should respond_to(:encrypted_key) }

    it { should respond_to(:encrypted_iv) }

    describe '#create!' do

      subject { @create.create! }

      it { should be_an_instance_of Channel::Create::Response }

    end

    describe '#body' do

      subject { @create.body }

      it { should be_a Hash }

      it { should_not be_empty }

      specify { expect(subject.keys).to include 'key', 'iv' }

      specify { expect(subject['key']).to eq @create.encrypted_key }

      specify { expect(subject['iv']).to eq @create.encrypted_iv }

    end

    describe '#encrypted_key' do

      subject { @create.encrypted_key }

      it { should be_a String }

      it { should_not be_empty }

    end

    describe '#encrypted_iv' do

      subject { @create.encrypted_iv }

      it { should be_a String }

      it { should_not be_empty }

    end

  end
end
