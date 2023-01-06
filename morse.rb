def possibilities(signals)
  morse_code = {
    "." => "E",
    "-" => "T",
    ".." => "I",
    ".-" => "A",
    "-." => "N",
    "--" => "M",
    "..." => "S",
    "..-" => "U",
    ".-." => "R",
    ".--" => "W",
    "-.." => "D",
    "-.-" => "K",
    "--." => "G",
    "---" => "O"
  }
  letters = []
  signals_array = signals.split('')
  if signals_array.any?('?')
    # regex to match keys
    # add any letters that match
    # swap '?' with '.' for regex any char
    regex_string = ''
    signals_array.each do |signal_char|
       case signal_char
       when '?'
         regex_string << "."
       when '.'
         regex_string << "\."
       else
         regex_string << signal_char
       end
    end

#     match(/#{Regexp.quote(regex_string)}/)
  else
    letters << morse_code[signals] if morse_code.key? signals
  end
  
  letters
end

