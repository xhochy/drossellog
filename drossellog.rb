#!/usr/bin/env ruby
#############################################################################
# This is the main drosselog script                                         #
#############################################################################

require 'getoptlong'
require 'gettext'
require 'drossellog/analyzercontext'
require 'drossellog/clioutputter'

## Var Init ##

opts = GetoptLong.new(
  ['--help', '-h', GetoptLong::NO_ARGUMENT],
  ['--input', '-i', GetoptLong::REQUIRED_ARGUMENT]
)

$infile = nil

GetText::bindtextdomain('drossellog', 'locale')

## Functions ##

# Explain to the user how to use Drossellog
def usage
  puts 'Drossellog - logfile analyzer |'
  puts '------------------------------|'
  puts ''
  puts GetText::_('Parses a logfile step-by-step')
  puts '--help, -h                 ' + GetText::_('Display this help')
  puts '--input, -i <file>         ' + GetText::_('The logfile we want to analyze')
  exit
end

## Main ##

opts.each do |opt, arg|
  case opt
    when '--help'
      usage()
    when '--input'
      $infile = arg
    when '--output'
      $outfile = arg   
  end
end

if $infile == nil
  $input = STDIN.read
else
  $input = File.read($infile)
end

analyzer = Drossellog::AnalyzerContext.new
analyzer.analyze $input
Drossellog::CLIOutputter::output analyzer
