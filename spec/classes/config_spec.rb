require 'spec_helper'

describe 'crowd::config' do
  let(:facts) {{
    :osfamily => 'Debian',
  }}
  it { should contain_user('crowd') }
  it { should contain_file('/home/crowd') }
  it { should contain_file('setenv.sh') }
  it { should contain_file('crowd-init.properties') }
end
