require 'digest/sha1'

module Puppet::Parser::Functions
  newfunction(:nagios_sha1, :type => :rvalue, :doc => <<-EOS
      Returns a SHA1 digest suitable for use in an htpasswd file
    EOS
  ) do |arguments|
    if (arguments.size != 1) then
      raise(
        Puppet::ParseError,
        "nagios_sha1(): Wrong number of arguments; expected 1"
      )
    end
    Base64.b64encode(Digest::SHA1.digest(arguments[0])).strip
  end
end
