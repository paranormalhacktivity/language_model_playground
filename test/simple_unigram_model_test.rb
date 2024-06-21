require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/simple_unigram_model"

class SimpleUnigramModelTest < Minitest::Test
  ############################################################################
  # Unigram
  ############################################################################

  # Word Frequency
  def test_should_count_repeating_words
    dataset = ["hello", "hello goodbye"]
    expected = { "hello" => 2, "goodbye" => 1 }
    assert_equal(expected, calculate_word_frequency(dataset))
  end

  def test_should_account_for_punctuation
    dataset = ["hello, hello.", "goodbye!"]
    expected = { "hello," => 1, "hello." => 1, "goodbye!" => 1 }
    assert_equal(expected, calculate_word_frequency(dataset))
  end

  def test_should_be_case_sensitive
    dataset = ["Hello", "hello goodbye"]
    expected = { "Hello" => 1, "hello" => 1, "goodbye" => 1 }
    assert_equal(expected, calculate_word_frequency(dataset))
  end

  def test_should_handle_an_empty_dataset
    dataset = [""]
    expected = {}
    assert_equal(expected, calculate_word_frequency(dataset))
  end

  # Word Probability
  def test_should_calculate_when_frequencies_are_varied
    dataset = { "hello" => 2, "goodbye" => 3 }
    expected = { "hello" => Math.log(0.4), "goodbye" => Math.log(0.6) }
    assert_equal(expected, calculate_word_probability(dataset))
  end

  def test_should_calculate_when_frequencies_are_equal
    dataset = { "hello" => 2, "goodbye" => 2 }
    expected = { "hello" => Math.log(0.5), "goodbye" => Math.log(0.5) }
    assert_equal(expected, calculate_word_probability(dataset))
  end

  def test_should_handle_an_empty_dataset_probability
    dataset = [""]
    expected = {}
    assert_equal(expected, calculate_word_frequency(dataset))
  end

  def test_should_predict_next_word
    dataset = ["hello", "hello goodbye"]
    expected = "hello"
    assert_equal(expected, unigram_predict_next_word(dataset))
  end

  def test_should_predict_next_word_accounting_for_punctuation
    dataset = ["hello, hello, hello.", "goodbye!"]
    expected = "hello,"
    assert_equal(expected, unigram_predict_next_word(dataset))
  end

  def test_should_predict_next_word_with_case_sensitivity
    dataset = ["Hello Hello", "hello goodbye"]
    expected = "Hello"
    assert_equal(expected, unigram_predict_next_word(dataset))
  end

  def test_should_predict_next_word_as_first_word_if_all_probabilities_are_equal
    dataset = ["Hello", "hello goodbye"]
    expected = "Hello"
    assert_equal(expected, unigram_predict_next_word(dataset))
  end

  def test_should_predict_next_word_as_empty_string_if_data_set_is_empty
    dataset = []
    expected = ""
    assert_equal(expected, unigram_predict_next_word(dataset))
  end

  ############################################################################
  # Bigram
  ############################################################################

  # Word Frequency
  def test_should_count_repeating_words
    dataset = ["good day to have a good day don't you think?", "good goodbye hello goodbye"]
    # dataset = calculate_word_frequency(dataset)
    expected = "day"
    assert_equal(expected, bigram_predict_next_word(dataset, "good"))
  end

  # def test_blah
  #   array = []
  #   dataset = File.readlines(File.join(__dir__, "./ai.txt"), chomp: true)
  #   context = "Real"
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context
  #   context = bigram_predict_next_word(dataset, context)
  #   array << context

  #   p array.join(" ")
  # end
end
