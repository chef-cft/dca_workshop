default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate’

case node['os']
when 'linux'
  default['audit']['profiles'] = [
   {
      'name': 'DevSec Linux Security Baseline',
      'compliance': 'admin/linux-baseline'
    }
  ]
  default['chef_client']['internal']='300'
  default['chef_client']['splay']='60'
when 'windows'
  default['audit']['profiles'] = [
    {
      'name': 'DevSec Windows Security Baseline',
      'compliance': 'admin/windows-baseline'
    }
  ]
  default['chef_client']['task']['frequency']='minute'
  default['chef_client']['task']['frequency_modifier']='6'
end

