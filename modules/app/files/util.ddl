metadata :name        => "Util agent",
         :description => "Utility Tasks",
         :author      => "Reid Vandewiele",
         :license     => "GPLv2",
         :version     => "1.0",
         :url         => "http://projects.puppetlabs.com/projects/mcollective-plugins/wiki",
         :timeout     => 60

action "refresh_fact_cache", :description => "Refresh the MCollective YAML fact cache" do

  display :always

  output :result,
    :description => "The result of running the refresh command",
    :display_as  => "Result"

end

