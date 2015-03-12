require 'ruboty'
require 'sloc'
require 'sloc/cli'

module Ruboty
  module Handlers
    class Sloc < Base
      env :RUBOTY_SLOC_DIRECTORY, "Target directory path (e.g. /home/meganemura/ruboty-sloc)"

      on(
        /sloc(?:\s(?<args>.+))?/,
        description: "count sloc",
        name: :sloc,
      )

      def sloc(message)
        arguments = message.match_data.names.include?('args') ? message['args'].split : nil
        arguments = [arguments, repository].flatten.compact
        ::Sloc::CLI.new.run(arguments)
      end

      def repository
        ENV['RUBOTY_SLOC_DIRECTORY']
      end
    end
  end
end
