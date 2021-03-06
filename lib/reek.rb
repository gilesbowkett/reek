$:.unshift File.dirname(__FILE__)

require 'reek/file_checker'
require 'reek/report'

module Reek # :doc:

    #
    # Analyse the given source files, looking for code smells.
    # Returns a +Report+ listing the smells found.
    #
    def self.analyse(*files)  # :doc:
      report = Report.new
      files.each do |file|
        source = IO.readlines(file).join
        FileChecker.new(report).check_source(source)
      end
      report
    end    
end