def solution(s)
  passwords = s.split(' ')

  valid_passwords = passwords.filter { |p| valid_password? p }

  return -1 unless valid_passwords.any?

  valid_passwords.sort_by!(&:length)

  valid_passwords.last.length
end

def valid_password?(password)
  return false unless alphanumeric?(password)
  return false unless even_number_letters?(password)
  return false unless odd_number_digits?(password)

  true
end

def alphanumeric?(password)
  return false if password =~ /[^a-zA-Z0-9]/

  true
end

def even_number_letters?(password)
  only_letters = password.gsub(/[^a-zA-Z]/, '')
  return false unless only_letters&.length&.even?

  true
end

def odd_number_digits?(password)
  only_digits = password.gsub(/[^0-9]/, '')
  return false if only_digits&.empty?
  return false unless only_digits&.length&.odd?

  true
end

# should return 7
puts solution('test 5 a0A pass007 ?xy1')
