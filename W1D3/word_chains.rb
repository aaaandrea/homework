require 'set'
class WordChainer
  attr_reader :dictionary

  def initialize(dictionary_file_name = "dictionary.txt")
    @dictionary = (File.readlines(dictionary_file_name).map(&:chomp)).to_set
    @current_words = []
    @all_seen_words = []
  end

  def adjacent_words(word)
    words = @dictionary.select! { |w| word.length == w.length }
    return [] if words == nil
    words = words.select! do |dict_word|
      count = 0

      dict_word.chars.each_with_index do |dict_letter, idx2|
        count += 1 if dict_letter == word[idx2]
      end

      count == word.length - 1
    end

    words
  end

  def run(start, target)
    @current_words << start
    @all_seen_words << start

    return @all_seen_words if @current_words.empty? && !@all_seen_words.empty?
    new_current_words = []
    @current_words.each do |curr_word|
      @all_seen_words << adjacent_words(curr_word)
      run(curr_word, target)
    end

    print new_current_words
    @current_words = new_current_words

    #
    # until @current_words.empty?
    #
    #   @current_words.each do |curr_word|
    #     new_current_words = []
    #     @current_words.each do |other_curr|
    #       adjacent_words(curr_word).each do |word|
    #         next if @all_seen_words.include?(word)
    #         @all_seen_words << word
    #         new_current_words << word
    #
    #       end
    #     end
    #
    #     print new_current_words
    #     @current_words = new_current_words
    #   end

    end

  end



end
