require 'ruboty'
require 'sloc'

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
        message.reply(10)
      end
    end
  end
end
