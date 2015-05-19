require "#{File.join(File.dirname(__FILE__),'..','spec_helper.rb')}"

describe 'thumbor' do

  let(:title) { 'thumbor' }
  let(:facts) { {
    :security_key => 'MY_SECURE_KEY',
    :port         => '8888',
    :ip           => '0.0.0.0',
    :config       => { },
    :service      => false,
  } }

  describe 'Test standard installation' do
    it { should contain_class('thumbor::install') }
    it { should contain_package('thumbor') }
    it { should contain_class('thumbor::config') }
    it { should_not contain_class('thumbor::service') }
  end

  describe 'Test installation with service' do
    let(:params) { {:service => true } }
    it { should contain_class('thumbor::service') }
  end

end
