# Convert a netmask to the number of appropriate bits
#

module Puppet::Parser::Functions
  newfunction(:mask2cidr, :type => :rvalue, :doc => <<-EOS
This function converts a netmask in address format to the number of bits.

*Examples:*

    $bits = mask2cidr("255.255.255.0")

Will result in: $bits = 24
    EOS
  ) do |arguments|

    raise(Puppet::ParseError, "join(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)") if arguments.size < 1

    require 'ipaddr'
    netmask = arguments[0]
    IPAddr.new(netmask).to_i.to_s(2).count('1')
  end
end

# vim: set ts=2 sw=2 et :
