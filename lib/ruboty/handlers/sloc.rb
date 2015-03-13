require 'ruboty'
require 'sloc'
require 'sloc/cli'

module Ruboty
  module Handlers
    class Sloc < Base
      env :RUBOTY_SLOC_DIRECTORY, "Target directory path (e.g. /home/meganemura/ruboty-sloc)"

      on(
        /sloc/,
        description: "count sloc",
        name: :sloc,
      )

      def sloc(message)
        Sloc::CLI.new.run(repository)
      end

      def repository
        ENV['RUBOTY_SLOC_DIRECTORY']
      end
    end
  end
end
