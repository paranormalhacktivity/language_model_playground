# Task One: Building a Unigram Model

## Objective
Build a basic unigram language model to predict the next word in a sequence based on word frequencies.

## Sub-Tasks

1) Frequency Calculation: Implement a function to calculate the frequency of each word in a given dataset.
This will involve counting the occurrences of each word.

2) Probability Calculation: Calculate the probability of each word based on its frequency.
The probability of a word is its frequency divided by the total number of words. Probability
ratios are best stored as logarithms to prevent "underflow" and simplify

3) Prediction Function: Implement a function that takes a context word and predicts
the next word based on the unigram probabilities.

## Testing
Test the 3 functionalities above. The following test cases can be used:

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
