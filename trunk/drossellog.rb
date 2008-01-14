#!/usr/bin/env ruby
#############################################################################
# This is the main drosselog script                                         #
#############################################################################

require 'getoptlong'
require 'gettext'

## Functions ##

# Explain to the user how to use Drossellog
def usage
  puts 'Parses a logfile step-by-step'
  puts '--help, -h                      Display this help'
  exit
end
