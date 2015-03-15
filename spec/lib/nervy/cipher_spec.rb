module Nervy
  describe Nervy::Cipher do

    before { @cipher = Nervy::Cipher.new }

    subject { @cipher }

    it { should respond_to(:key) }

    it { should respond_to(:iv) }

    it { should respond_to(:decrypt) }

    it { should respond_to(:encrypt) }

    describe '#key' do

      subject { @cipher.key }

      it { should be_a String }

      it { should_not be_empty }

    end

    describe '#iv' do

      subject { @cipher.iv }

      it { should be_a String }

      it { should_not be_empty }

    end

    describe 'decrypt' do

      let(:email) { Faker::Internet.email }

      let(:encryption_cipher) { Nervy::Cipher.new(:encrypt, @cipher.key, @cipher.iv) }

      let(:encrypted) { encryption_cipher.encrypt(email) }

      specify { expect { subject.decrypt(encrypted) }.to_not raise_error }

      specify { expect(subject.decrypt(encrypted)).to eq email }

    end

  end
end
