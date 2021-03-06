require 'json'
require 'sdl_parser'

module Bibliothecary
  module Parsers
    class Dub
      include Bibliothecary::Analyser

      def self.mapping
        {
          /^dub\.json$/ => {
            kind: 'manifest',
            parser: :parse_json_runtime_manifest
          },
          /^dub\.sdl$/ => {
            kind: 'manifest',
            parser: :parse_sdl_manifest
          }
        }
      end

      def self.parse_sdl_manifest(manifest)
        SdlParser.new(:runtime, manifest).dependencies
      end
    end
  end
end
