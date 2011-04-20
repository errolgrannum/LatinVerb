#encoding:  UTF-8

require 'minitest/autorun'
require 'json'

$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])
require 'latinverb'
require 'linguistics/latin/verb/classification_types'

# Internal dependencies

class TestIrregulars< MiniTest::Unit::TestCase # :nodoc:
  def test_to_give
    v =  Linguistics::Latin::Verb::LatinVerb.new 'dō dāre dedī datum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_eat
    v =  Linguistics::Latin::Verb::LatinVerb.new 'edō ēsse ēdī ēsum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_be
    v = Linguistics::Latin::Verb::LatinVerb.new 'sum esse fuī futūrus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_bear
    v = Linguistics::Latin::Verb::LatinVerb.new 'ferō ferre tulī latum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_go
    v = Linguistics::Latin::Verb::LatinVerb.new 'eō īre ivī itum'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_not_wish
    v = Linguistics::Latin::Verb::LatinVerb.new 'nolō nolle noluī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_prefer
    v = Linguistics::Latin::Verb::LatinVerb.new 'volō velle voluī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_be_able
    v = Linguistics::Latin::Verb::LatinVerb.new 'queō quīre quīvī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_be_able2
    v = Linguistics::Latin::Verb::LatinVerb.new 'possum posse potuī'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_be_made
    v = Linguistics::Latin::Verb::LatinVerb.new 'fiō fiērī factus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification
  end
  def test_to_help
    v = Linguistics::Latin::Verb::LatinVerb.new 'prōsum prōdesse prōfuī prōfutūrus'
    assert_equal Linguistics::Latin::Verb::VerbTypes::Irregular,  v.classification

    #cf. A&G198
    assert_equal "prōsum",       v.active_voice_indicative_mood_present_tense_first_person_singular_number
    assert_equal "prōdēs",       v.active_voice_indicative_mood_present_tense_second_person_singular_number
    assert_equal "prōdest",       v.active_voice_indicative_mood_present_tense_third_person_singular_number
    assert_equal "prōsumus",     v.active_voice_indicative_mood_present_tense_first_person_plural_number
    assert_equal "prōdestis",     v.active_voice_indicative_mood_present_tense_second_person_plural_number
    assert_equal "prōsunt",      v.active_voice_indicative_mood_present_tense_third_person_plural_number

    assert_equal "prōderam",      v.active_voice_indicative_mood_imperfect_tense_first_person_singular_number
    assert_equal "prōderāmus",      v.active_voice_indicative_mood_imperfect_tense_first_person_plural_number

    assert_equal "prōderō",      v.active_voice_indicative_mood_future_tense_first_person_singular_number
    assert_equal "prōderimus",      v.active_voice_indicative_mood_future_tense_first_person_plural_number

    assert_equal "prōfuī",      v.active_voice_indicative_mood_perfect_tense_first_person_singular_number
    assert_equal "prōfuimus",      v.active_voice_indicative_mood_perfect_tense_first_person_plural_number

    assert_equal "prōfueram",      v.active_voice_indicative_mood_pastperfect_tense_first_person_singular_number
    assert_equal "prōfuerāmus",      v.active_voice_indicative_mood_pastperfect_tense_first_person_plural_number

    assert_equal "prōfuerō",      v.active_voice_indicative_mood_futureperfect_tense_first_person_singular_number
    assert_equal "prōfuerimus",      v.active_voice_indicative_mood_futureperfect_tense_first_person_plural_number

    # Subjunctive
   
    assert_equal "prōsim",       v.active_voice_subjunctive_mood_present_tense_first_person_singular_number
    assert_equal "prōsīs",       v.active_voice_subjunctive_mood_present_tense_second_person_singular_number
    assert_equal "prōsit",       v.active_voice_subjunctive_mood_present_tense_third_person_singular_number
    assert_equal "prōsīmus",     v.active_voice_subjunctive_mood_present_tense_first_person_plural_number
    assert_equal "prōsītis",     v.active_voice_subjunctive_mood_present_tense_second_person_plural_number
    assert_equal "prōsint",      v.active_voice_subjunctive_mood_present_tense_third_person_plural_number

    assert_equal "prōdessem",      v.active_voice_subjunctive_mood_imperfect_tense_first_person_singular_number
    assert_equal "prōdessēmus",      v.active_voice_subjunctive_mood_imperfect_tense_first_person_plural_number

    assert_equal "prōfuerim",      v.active_voice_subjunctive_mood_perfect_tense_first_person_singular_number
    assert_equal "prōfuerimus",      v.active_voice_subjunctive_mood_perfect_tense_first_person_plural_number

    assert_equal "prōfuissem",      v.active_voice_subjunctive_mood_pastperfect_tense_first_person_singular_number
    assert_equal "prōfuissēmus",      v.active_voice_subjunctive_mood_pastperfect_tense_first_person_plural_number

    # Imperatives

    assert_equal "prōdēs", v.active_voice_imperative_mood_present_tense_second_person_singular_number
    assert_equal "prōdeste", v.active_voice_imperative_mood_present_tense_second_person_plural_number
    assert_equal "prōdestō",v.active_voice_imperative_mood_future_tense_second_person_singular_number 
    assert_equal "prōdestōte", v.active_voice_imperative_mood_future_tense_second_person_plural_number

    assert_equal 'prōdesse',  v.pres_act_inf
    assert_equal 'prōfuisse',  v.perfect_active_infinitive
    assert_equal 'prōfutūrum esse', v.future_active_infinitive
  end
end