
default[:metachef][:conf_dir] = '/etc/metachef'
default[:metachef][:log_dir]  = '/var/log/metachef'
default[:metachef][:home_dir] = '/etc/metachef'

default[:metachef][:user]     = 'root'

# Request user account properties here.
default[:users]['root'][:primary_group] = value_for_platform(
  "openbsd"   => { "default" => "wheel" },
  "freebsd"   => { "default" => "wheel" },
  "mac_os_x"  => { "default" => "wheel" },
  "default"   => "root"
)

default[:announces] ||= Mash.new

default[:discovers] ||= Mash.new

default[:standard_dirs] = Mash.new({
  :home_dir     => { :uid => 'root', :gid => 'root', },
  :conf_dir     => { :uid => 'root', :gid => 'root', },
  :lib_dir      => { :uid => 'root', :gid => 'root', },
  :log_dir      => { :uid => :user,  :gid => :group, :mode => "0775", },
  :pid_dir      => { :uid => :user,  :gid => :group, },
  :tmp_dir      => { :uid => :user,  :gid => :group, },
  :data_dir     => { :uid => :user,  :gid => :group, },
  :data_dirs    => { :uid => :user,  :gid => :group, },
  :journal_dir  => { :uid => :user,  :gid => :group, },
  :journal_dirs => { :uid => :user,  :gid => :group, },
  :cache_dir    => { :uid => :user,  :gid => :group, },
})
