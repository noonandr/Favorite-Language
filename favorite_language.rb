require 'json'
require 'open-uri'

def find_name(json, name)
  language = Array.new
  json.each do |json|
    founddlanguages = json["language"]
    language.push founddlanguages
  end
  language_hash = Hash.new(0)
  language.each { |hashlang| language_hash[hashlang] += 1 }
  ordered_languages = Hash[language_hash.sort_by{|key, value| value}.reverse]

  puts name + "'s most used language is: #{ordered_languages.first[0]}"
  try_again
end

def get_json(name)
  url = "https://api.github.com/users/" + name + "/repos"
  repos = open(url).read
  json = JSON.parse(repos)
  if json != []
    find_name(json, name)
  else
    puts "'" + name + "'" + " doesn't appear to be a valid GitHub user name."
    try_again
  end
end

def try_again
  puts "Do you want to try again? (y/n)"
  answer = gets.chomp
  if answer == "n"
    puts "Thank you, goodbye."
  elsif answer == "y"
    puts "Please enter your GitHub user name:"
    name = gets.chomp
    get_json(name)
  else
    puts "'" + answer + "'" + " is not a valid. Please type either y or n."
    try_again
  end
end

puts "Please enter your GitHub user name:"
name = gets.chomp
get_json(name)

