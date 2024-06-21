def unigram_predict_next_word(dataset, _context = "")
  frequency_results = calculate_word_frequency(dataset)
  probabilities = calculate_word_probability(frequency_results)
  probabilities.max_by { |_word, probability| probability }&.first || ""
end

def bigram_predict_next_word(dataset, context = "")
  frequency_results = bigram_calculate_word_frequency(dataset)
  probabilities = calculate_word_probability(frequency_results)
  probabilities.select { |token| token[0] == context }
    .max_by { |_token, probability| probability }&.first&.last ||
  probabilities.max_by { |_token, probability| probability }&.first&.last
end

def bigram_calculate_word_frequency(dataset)
  dataset.each_with_object({}) do |string, frequency_results|
   string.split.each_cons(2).map { |x| frequency_results[x] ||= 0; frequency_results[x] += 1 }
  end
end

def calculate_word_frequency(dataset)
  separated = dataset.map { |x| x.split(" ") }.flatten
  separated.each_with_object({}) do |element, hash|
    hash[element] = separated.count(element)
  end
end

def calculate_word_probability(dataset)
  total_word_count = dataset.values.sum
  dataset.transform_values { |value| Math.log(value / total_word_count.to_f) }
end

