module Nervy
  describe Channel::Create::Response do

    before(:all) { @response = Channel::Create.new.create! }

    subject { @response }

    it { should respond_to(:private_key) }

    it { should respond_to(:key) }

    it { should respond_to(:passphrase) }

    it { should respond_to(:guid) }

    it { should respond_to(:channel_id) }

    describe '#guid' do

      subject { @response.guid }

      it { should be_a String }

      it { should_not be_empty }

      it { should match /\A([a-zA-Z0-9]\-?)+\Z/ }

      specify { expect(subject).to eq @response.channel_id }

    end

    describe '#key' do

      subject { @response.key }

      it { should be_a String }

      it { should_not be_empty }

      specify { expect(subject).to eq @response.passphrase }

    end

    describe '#private_key' do

      subject { @response.private_key }

      let(:email) { Faker::Internet.email }

      it { should be_a String }

      it { should_not be_empty }

      it { should include "BEGIN RSA PRIVATE KEY" }

      specify { expect { OpenSSL::PKey::RSA.new(subject).private_encrypt(email) }.to_not raise_error }

    end

  end
end
