sudo yum install https://packages.chef.io/files/stable/inspec/1.7.1/el/7/inspec-1.7.1-1.el7.x86_64.rpm -y
cd /tmp/test/integration/default
inspec detect
inspec exec inspec/*_spec.rb
