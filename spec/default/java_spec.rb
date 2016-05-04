require 'spec_helper'
require 'yaml'

describe command('which java'), :if => os[:family] == 'redhat' do
  let(:disable_sudo) { true }
  its(:stdout) { should match /\/usr\/bin\/java/ }
end

describe command('java -version'), :if => os[:family] == 'redhat' do
  let(:disable_sudo) { true }
  let(:roles_var) { YAML.load(IO.read(File.expand_path('../../../roles/java/vars/main.yml', __FILE__))) }
  its(:stderr) { should match /#{roles_var['version']['redhat']}/ }
end
