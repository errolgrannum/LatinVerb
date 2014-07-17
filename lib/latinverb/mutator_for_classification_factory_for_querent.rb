module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class MutatorForClassificationFactoryForQuerent
          attr_reader :mutator_class
          extend Forwardable
          def_delegators :@classification, :short_name_key

          MAPPING = {
            Irregular: QuerentMutators::Irregular,
            Deponent: QuerentMutators::Deponent,
            Semideponent: QuerentMutators::Semideponent
          }

          def initialize(verb, querent)
            @verb = verb
            @querent = querent
            @classification = verb.classification
          end

          def mutator
            return MAPPING[short_name_key].new(@verb) if MAPPING.has_key?(short_name_key)
            OpenStruct.new( mutate!: -> {} )
          end
        end
      end
    end
  end
end