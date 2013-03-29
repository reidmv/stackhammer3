module MCollective
  module Agent
    class Util < RPC::Agent

      metadata :name        => "Util agent",
               :description => "Utility Tasks",
               :author      => "Reid Vandewiele",
               :license     => "GPLv2",
               :version     => "1.0",
               :url         => "http://projects.puppetlabs.com/projects/mcollective-plugins/wiki",
               :timeout     => 60

      action "refresh_fact_cache" do
        reply[:result] = run("/opt/puppet/sbin/refresh-mcollective-metadata")
      end
    end
  end
end
