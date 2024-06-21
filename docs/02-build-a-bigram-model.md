# Task Two: Building a Bigram Model

## Objective
Build a basic bigram language model to predict the next word in a sequence based on word pairs (bigrams).

## Sub-Tasks
1) Bigram Frequency Calculation: Implement a function to calculate the frequency
of each word pair (bigram) in a given dataset. This involves counting the occurrences
of each word pair in the dataset.

2) Bigram Probability Calculation: Calculate the probability of each word pair based
on its frequency. The probability of a bigram is the frequency of the bigram divided
by the total number of bigrams.

3) Prediction Function: Implement a function that takes a context word and predicts
the next word based on the bigram probabilities. In this case, the context word
should be used to find the most likely word to follow it in the sequence.

### Word Frequency
    dataset: ["hello", "hello goodbye"]
    expected: { "hello" => 2, "goodbye" => 1 }

    dataset: ["hello, hello.", "goodbye!"]
    expected: { "hello," => 1, "hello." => 1, "goodbye!" => 1 }

    dataset: ["Hello", "hello goodbye"]
    expected: { "Hello" => 1, "hello" => 1, "goodbye" => 1 }

    dataset = [""]
    expected = {}

### Word Probability
    dataset: ["hello goodbye", "goodbye hello goodbye"]
    expected: { "hello" => -0.916290731874155, "goodbye" => -0.5108256237659907 }

    dataset: ["hello", "goodbye hello goodbye"]
    expected = { "hello" => -0.6931471805599453, "goodbye" => -0.6931471805599453 }

    dataset = [""]
    expected = {}

### Word Prediction
    dataset: ["hello goodbye", "goodbye hello goodbye"]
    expected: "goodbye"

    dataset: ["hello goodbye", "hello goodbye"]
    expected: "hello"

    dataset: []
    expected: ""
