module MCollective
  module Agent
    class App < RPC::Agent

      metadata :name        => "App agent",
               :description => "App Tasks",
               :author      => "Reid Vandewiele",
               :license     => "GPLv2",
               :version     => "1.0",
               :url         => "http://projects.puppetlabs.com/projects/mcollective-plugins/wiki",
               :timeout     => 60

      action "migrate" do
        validate :environment, String

        reply[:environment] = request[:environment]
        reply[:result] = puppet_result(run("/opt/puppet/bin/puppet agent --test --environment=#{request[:environment]}"))
        refresh_facts
      end

      action "rebalance" do
        reply.fail! unless File.exists?('/etc/haproxy/haproxy.cfg')
        reply[:result] = puppet_result(run("/opt/puppet/bin/puppet agent --test"))
        refresh_facts
      end

      action "upgrade" do
        validate :version, String

        app_version = ENV["FACTER_app_version"]
        ENV["FACTER_app_version"] = request[:version]
        reply[:result] = puppet_result(run("/opt/puppet/bin/puppet agent --test"))
        refresh_facts
        ENV.delete("FACTER_app_version")
      end

      def puppet_result(code)
        case code
        when 0
          return "success (no changes)"
        when 2
          return "success (changes made)"
        when 4
          return "failure (no changes)"
        when 6
          return "failure (changes made)"
        else
          return "failure (return code #{code})"
        end
      end

      def refresh_facts
        run('/opt/puppet/sbin/refresh-mcollective-metadata')
      end
    end
  end
end
