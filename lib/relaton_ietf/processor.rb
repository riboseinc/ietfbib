require "relaton/processor"
require "relaton_ietf/xml_parser"

module RelatonIetf
  class Processor < Relaton::Processor
    def initialize
      @short = :relaton_ietf
      @prefix = "IETF"
      @defaultprefix = /^RFC /
      @idtype = "IETF"
    end

    # @param code [String]
    # @param date [String, NilClass] year
    # @param opts [Hash]
    # @return [RelatonIetf::IetfBibliographicItem]
    def get(code, date, opts)
      ::RelatonIetf::IetfBibliography.get(code, date, opts)
    end

    # @param xml [String]
    # @return [RelatonIetf::IetfBibliographicItem]
    def from_xml(xml)
      ::RelatonIetf::XMLParser.from_xml xml
    end

    # @param hash [Hash]
    # @return [RelatonIetf::IetfBibliographicItem]
    def hash_to_bib(hash)
      ::RelatonIetf::IetfBibliographicItem.from_hash hash
    end

    # Returns hash of XML grammar
    # @return [String]
    def grammar_hash
      @grammar_hash ||= ::RelatonIetf.grammar_hash
    end
  end
end
