require 'serverspec'
require 'winrm'

set :backend, :winrm

if RbConfig::CONFIG['MAJOR'] == "1"
  user = 'appveyor'
  pass = ENV['WINDOWS_PASSWORD']
  endpoint = "http://127.0.0.1:5985/wsman"

  winrm = ::WinRM::WinRMWebService.new(endpoint, :ssl, :user => user, :pass => pass, :basic_auth_only => true)
  winrm.set_timeout 300 # 5 minutes max timeout for any operation
  Specinfra.configuration.winrm = winrm
else
  opts = {
    endpoint: 'http://127.0.0.1:5985/wsman',
    user: 'appveyor',
    password: ENV['WINDOWS_PASSWORD'],
    operation_timeout: 300 # 5 minutes max timeout for any operation
  }
  Specinfra.configuration.winrm = WinRM::Connection.new(opts)
end
