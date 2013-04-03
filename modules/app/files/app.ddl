metadata :name        => "App agent",
         :description => "App Tasks",
         :author      => "Reid Vandewiele",
         :license     => "GPLv2",
         :version     => "1.0",
         :url         => "http://projects.puppetlabs.com/projects/mcollective-plugins/wiki",
         :timeout     => 60

action "migrate", :description => "Migrates nodes to a specified Puppet environment" do
  display :always

  input :environment,
    :prompt      => "Puppet Environment",
    :description => "The environment to migrate to",
    :type        => :string,
    :validation  => '^.+$',
    :optional    => false,
    :maxlength   => 90

  output :environment,
    :description => "The environment migrated to",
    :display_as  => "Environment"

  output :result,
    :description => "Whether or not the migration was successful",
    :display_as  => "Result"

end

action "rebalance", :description => "Rebalances HAProxy with all/only the current environment's nodes" do

  display :always

  output :result,
    :description => "Whether or not the rebalancing was successful",
    :display_as  => "Result"

end

action "upgrade", :description => "Upgrade app to the specified version" do

  display :always

  input :version,
    :prompt      => "App Version",
    :description => "The version to upgrade the app to",
    :type        => :string,
    :validation  => '^.+$',
    :optional    => false,
    :maxlength   => 90

  output :result,
    :description => "Whether or not the upgrade was successful",
    :display_as  => "Result"

end
