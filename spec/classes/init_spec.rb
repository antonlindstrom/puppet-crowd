require 'spec_helper'

describe 'crowd' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "crowd class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('crowd::params') }

        it { should contain_class('crowd::install') }
        it { should contain_class('crowd::config') }
        it { should contain_class('crowd::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'crowd class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
