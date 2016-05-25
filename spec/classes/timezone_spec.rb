require 'spec_helper.rb'

describe 'timezone' do

  let(:title) { 'timezone' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) { {
      :ipaddress => '10.42.42.42',
      :concat_basedir => '/dne',
      :operatingsystemrelease => '6.6',
      :operatingsystem => 'Debian',
      :osfamily => 'Debian',
      :lsbdistcodename => 'Jessie'
  } }

  it { should compile }
  it { should contain_class('timezone') }

  describe 'Test customizations - custom class' do
    let(:params) { {:my_class => "timezone::spec" } }
    it 'should automatically include a custom class' do
      content = catalogue.resource('file', 'timezone').send(:parameters)[:content]
      content.should match "fqdn: rspec.example42.com"
    end
  end

end
