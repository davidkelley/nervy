module Nervy
  describe Channel do

    before(:all) { @response = Channel.create! }

    before { @channel = Channel.from_response(@response) }

    subject { @channel }

    describe 'static methods' do

      describe '#create!' do

        subject { Channel.create! }

        specify { expect(subject).to be_an_instance_of Channel::Create::Response }

      end

      describe '#from_response' do

        specify { expect { Channel.from_response(@response).to_not raise_error } }

        specify { expect { Channel.from_response({}).to raise_error } }

      end

    end

    it { should respond_to(:publish) }

    it { should respond_to(:encrypt) }

    describe '#publish' do

      let(:path) { "a/nested/message/path" }

      let(:text) { Faker::Internet.email }

      subject { @channel.publish(path, text) }

      it { should be_truthy }

    end

  end
end
