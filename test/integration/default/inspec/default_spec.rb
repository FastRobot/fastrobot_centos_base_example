control 'Basic Tests' do
  impact 1.0
  title 'Run Basic Package tests'
  desc 'Verify that our base rpms have been added to our Image'
  %w( tmux sysstat tree ).each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
