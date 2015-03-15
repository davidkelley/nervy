describe Nervy do

  subject { Nervy }

  it { should respond_to(:host) }

  it { should respond_to(:port) }

  it { should respond_to(:cipher) }

  it { should respond_to(:configure) }

  specify { expect { |b| subject.configure(&b) }.to yield_with_args(Nervy) }

  describe "when configuration is set" do

    before { @host = Nervy.host }

    specify { expect { subject.configure { |c| c.host = "test" } }.to change { Nervy.host } }

    after { Nervy.host = @host }

  end

end
