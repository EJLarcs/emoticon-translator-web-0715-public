# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
#note to self - doesn't like it if you call yaml file... yaml_library?
# #in order to load the file path using YAML use YAML.load_file(RELAVANT ARG)
  references = {}
#set up the empty hash you wish to store your information in
  references["get_meaning"] = {}
#assign the first requested key for this hash
  references["get_emoticon"] = {}
  references
# #assign the second requested key for this hash
# #call the hash and iterate over the yaml library separating the meanings
# #from the emoticon arrays
  emoticons.each {|key, value|
#establish the japanese emoticons from the western emoticons
  jap_emo = value[1]
  west_emo = value[0]
  references["get_meaning"][jap_emo] = key
  references["get_emoticon"][west_emo] = jap_emo
  }
  references
#call the hash because you've made additions
end

def get_japanese_emoticon(file_path, emoticon)
#call on the load_library method
  load_library(file_path)["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"
#return the value of references[get_emoticon][emoticon] if it exists...
#if not the code will return nil and return the apology string
#BE AWARE of the objects you're working with and the values you're looking to extract
end

def get_english_meaning(file_path, emoticon)
  #call on the load_library method
    load_library(file_path)["get_meaning"][emoticon] || "Sorry, that emoticon was not found"
  #return the value of references[get_emoticon][emoticon] if it exists...
  #if not the code will return nil and return the apology string
  #BE AWARE of the objects you're working with and the values you're looking to extract
end
