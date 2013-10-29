require 'spec_helper'

describe 'crowd::install' do
  describe 'crowd::install class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_class('java7') }
    it { should contain_class('wget') }
    it { should contain_wget__fetch('download_crowd') }
    it { should contain_exec('extract_crowd') }
    it { should contain_file('/opt') }
    it { should contain_file('/etc/init.d/crowd') }
  end

  describe 'crowd::install class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_class('java7') }
    it { should contain_class('wget') }
    it { should contain_wget__fetch('download_crowd') }
    it { should contain_exec('extract_crowd') }
    it { should contain_file('/opt') }
    it { should contain_file('/etc/init.d/crowd') }
  end
end
