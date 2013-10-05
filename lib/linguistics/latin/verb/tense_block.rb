require 'forwardable'
require 'linguistics/latin/verb/phonographia'
require 'linguistics/latin/verb/tense_block/json_support'
require 'linguistics/latin/verb/tense_block/instance_methods_generator'

module Linguistics
  module Latin
    module Verb
    ##
    # == NAME
    #
    # TenseBlock
    #
    # == DESCRIPTION
    #
    # As per the LatinVerb documentation, LatinVerbs decorate themselves with
    # the method which loads up a voice/tense/mood black box.  That black box
    # is a TenseBlock.  The TenseBlock, in turn, responds to getting the final
    # two components of the fully-qualified vector back (person and number).
    # It also has Array-like behaviors (e.g. +[]+) based on the 2 * 3 matrix.
    #
    # == INTERNALS
    #
    # Internally, a Tenseblock is effectively an Array of the arguments passed
    # in during TenseBlock.initialize.  These are assumed to be
    # first/singular, second/singular, third/singular and then
    # first/plural, second/plural, third/plural.
    #
    # Syntactic sugar methods are added to access this array.  Thus, in a
    # LatinVerb a fully-qualified vectors first 3/5 data resolve to a
    # TenseBlock.  The last 2/5 of resolution occurs within the TenseBlock
    # (effectively pulling the contents of the Array).  Therefore, when a
    # LatinVerb is accessed with the quinpartite fully-qualified vector it can
    # return the unique value.  The mechanics of this hook through (surprise!)
    # method_missing.
    #
    #
    ##

      class TenseBlock
        include Linguistics::Latin::Phonographia
        include JsonSupport

        extend Forwardable
        def_delegators :@results, :[], :empty?, :length, :to_a

        attr_reader :meaning, :results

        def initialize(r, opts={})
          @results = Array(r).map{|v| fix_macrons(v)}
          @meaning = opts[:meaning] || ""
          @resolver = InstanceMethodsGenerator.new(self)
        end

        def to_s; return self.to_a.to_s; end

        def wordless?
          !@results.find{ |r| r =~ /\w/ }
        end

        def method_missing(symbol, *args)
          @resolver.send(symbol)
        end
      end
    end
  end
end
