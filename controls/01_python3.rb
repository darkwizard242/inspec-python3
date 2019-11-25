# copyright: 2019, Ali Muhammad

title "Compliance: Python3"

control "python3-01" do
  impact 0.7
  title "Validate that python3 package is installed and ready to be used."
  desc "Control to validate whether python3 is installed on the system. It will also attempt verification for the command execution."

  describe package("python3") do
    it { should be_installed }
  end
  describe command('which python3') do
    its('exit_status') { should eq 0 }
    its('stdout') { should eq "/usr/bin/python3\n" }
  end
end

control "python3-02" do
  impact 0.7
  title "Verify python3 is operational."
  desc "Control to check whether python3 is operational or not."

  describe command('python3 --version') do
    its('exit_status') { should eq 0 }
  end
end

control "python3-03" do
  impact 0.7
  title "Check Python3 file."
  desc "Control to check for python3 executable file."

  describe file('/usr/bin/python3') do
    it { should exist }
    its('type') { should eq :symlink }
    it { should_not be_directory }
  end
end
