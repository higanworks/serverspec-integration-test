require 'serverspec'
require 'winrm'

set :backend, :winrm

opts = {
  user: 'appveyor',
  password: ENV['WINDOWS_PASSWORD'],
  endpoint: "http://127.0.0.1:5985/wsman",
  operation_timeout: 180
}

winrm = ::WinRM::Connection.new(opts)
Specinfra.configuration.winrm = winrm
