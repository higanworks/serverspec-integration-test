require 'spec_helper'

describe cron do
  it { should have_entry '* * * * * ls /tmp' }
  it { should have_entry('* * * * * ls /tmp').with_user('daemon') }
  its(:table) { should match  /\* \* \* \* \* ls \/tmp/ }
end
