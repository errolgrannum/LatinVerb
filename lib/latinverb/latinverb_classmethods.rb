# encoding:  utf-8
module Linguistics
  module Latin
    module Verb
      class LatinVerb
        class << self
          # Given the principal parts as a string, decide which conjuation is in play
          def classify(s)
            if s.class == String
              divided_string = s.split /\s+/

              first_pres = divided_string[0]
              infinitive = divided_string[1]

              if    infinitive =~ /āre$/
                return Linguistics::Latin::Verb::VerbTypes::First
              elsif infinitive =~ /ēre$/
                return Linguistics::Latin::Verb::VerbTypes::Second
              elsif infinitive =~ /ere$/
                 if first_pres =~ /i.$/
                   return Linguistics::Latin::Verb::VerbTypes::ThirdIO
                 else
                   return Linguistics::Latin::Verb::VerbTypes::Third
                 end
              elsif infinitive =~ /īre$/
                return Linguistics::Latin::Verb::VerbTypes::Fourth
              else
                raise RuntimeError "Could not identify this verb's classification"
              end
            end
          end

=begin rdoc

*Arguments*:    None

*Attribs Used*: @pres_act_inf

*Attribs Set*:  None

*Returns*:      The “stem” of a Latin Verb

*Purpose*:      Based on the present active infinitive, identify the “stem” and set the @stem iVar.
The method also returns the stem value.

=end

          def calculate_stem(pres_act_inf)
            # For efficiency, if the iVar @stem is defined, don't go through this structure

            # pres_act_inf = @pres_act_inf.to_s

            if pres_act_inf =~ /āre$/
              return pres_act_inf.gsub(/(.*)āre$/,'\\1ā')
            end
            if pres_act_inf =~ /ēre$/
              return pres_act_inf.gsub(/(.*)ēre$/,'\\1ē')
            end
            if pres_act_inf =~ /ere$/
              if @first_pers_singular =~ /iō$/
                return pres_act_inf.gsub(/(.*)ere$/,'\\1')
              else
                return pres_act_inf.gsub(/(.*)ere$/,'\\1')
              end
            end
            if pres_act_inf =~ /īre$/
              return pres_act_inf.gsub(/(.*)īre$/,'\\1')
            end
          end
        end
      end
    end
  end
end

