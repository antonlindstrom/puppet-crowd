require 'spec_helper'

describe 'crowd::service' do
  describe 'crowd::service class on RedHat' do
    let(:facts) {{
      :osfamily => 'RedHat',
    }}

    it { should contain_service('crowd') }
  end

  describe 'crowd::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it { should contain_service('crowd') }
  end
end

