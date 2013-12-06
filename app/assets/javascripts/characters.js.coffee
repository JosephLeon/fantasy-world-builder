# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  # capitalize first letter of string : string.capitalize()
  String::capitalize = ->
    @charAt(0).toUpperCase() + @slice(1)

  # array shuffle : [1..9].shuffle()
  do -> Array::shuffle ?= ->
    for i in [@length-1..1]
      j = Math.floor Math.random() * (i + 1)
      [@[i], @[j]] = [@[j], @[i]]
    @

  # check if number is odd
  isOdd = (num) ->
    num % 2

  consonant = ["b","c","d","f","g","h","j","k","l","m","n","p","q",
                          "r","s","t","v","w","x","z"]
  vowel = ["a", "e", "i", "o", "u", "y"]
  doubleConsonant = ["bh","ch","dr","fh","gb","ht","jr","kw","lr","mh","ns",
                      "ph","qu", "rh","sm","th","vh","wr","xx","zz"]
  doubleVowel = ["ae","ea","ie","oa","uo","ya","ye","yi","yu","yo"]
  consonantComesFirst = Math.floor((Math.random()*10)+1)
  chooseSingle = Math.floor((Math.random()*10)+1)
  chooseSecond = Math.floor((Math.random()*10)+1)
  substringRandLimiter1 = Math.floor((Math.random()*5)+3)
  substringRandLimiter2 = Math.floor((Math.random()*5)+3)

  randomNameGenerator = ->
    if isOdd(consonantComesFirst)
      if isOdd(chooseSingle) # first letter consonant
        first = consonant.shuffle() # first letter single consonant
        firstOne = first[0]
        if isOdd(chooseSecond)
          second = vowel.shuffle()
          secondOne = second[0]
          third = doubleConsonant.shuffle()
          thirdOne = third[0]
          fourth = doubleVowel.shuffle()
          fourthOne = fourth[0]
          fifth = consonant.shuffle()
          fifthOne = fifth[0]
        else
          second = doubleVowel.shuffle()
          secondOne = second[0]
          third = consonant.shuffle()
          thirdOne = third[0]
          fourth = vowel.shuffle()
          fourthOne = fourth[0]
          fifth = doubleConsonant.shuffle()
          fifthOne = fifth[0]
      else
        first = doubleConsonant.shuffle() # first letter double consonant
        firstOne = first[0]
        if isOdd(chooseSecond)
          second = vowel.shuffle()
          secondOne = second[0]
          third = doubleConsonant.shuffle()
          thirdOne = third[0]
          fourth = doubleVowel.shuffle()
          fourthOne = fourth[0]
          fifth = consonant.shuffle()
          fifthOne = fifth[0]
        else
          second = doubleVowel.shuffle()
          secondOne = second[0]
          third = consonant.shuffle()
          thirdOne = third[0]
          fourth = vowel.shuffle()
          fourthOne = fourth[0]
          fifth = doubleConsonant.shuffle()
          fifthOne = fifth[0]
    else
      if isOdd(chooseSingle) # first letter vowel
        first = vowel.shuffle() # first letter single vowel
        firstOne = first[0]
        if isOdd(chooseSecond)
          second = consonant.shuffle()
          secondOne = second[0]
          third = doubleVowel.shuffle()
          thirdOne = third[0]
          fourth = doubleConsonant.shuffle()
          fourthOne = fourth[0]
          fifth = consonant.shuffle()
          fifthOne = fifth[0]
        else
          second = doubleConsonant.shuffle()
          secondOne = second[0]
          third = doubleVowel.shuffle()
          thirdOne = third[0]
          fourth = doubleConsonant.shuffle()
          fourthOne = fourth[0]
          fifth = consonant.shuffle()
          fifthOne = fifth[0]
      else
        first = doubleVowel.shuffle() # first letter double vowel
        firstOne = first[0]
        if isOdd(chooseSecond)
          second = consonant.shuffle()
          secondOne = second[0]
          third = vowel.shuffle()
          thirdOne = third[0]
          fourth = consonant.shuffle()
          fourthOne = fourth[0]
          fifth = doubleConsonant.shuffle()
          fifthOne = fifth[0]
        else
          second = doubleConsonant.shuffle()
          secondOne = second[0]
          third = vowel.shuffle()
          thirdOne = third[0]
          fourth = consonant.shuffle()
          fourthOne = fourth[0]
          fifth = doubleConsonant.shuffle()
          fifthOne = fifth[0]
    fullName = firstOne.capitalize() + secondOne + thirdOne + fourthOne + fifthOne

  randomNameGenerator()


  # random name click event
  $('#button').click ->
    firstName = randomNameGenerator()
    lastName = randomNameGenerator()
    $('#character_name').val(firstName.substring(0,substringRandLimiter1) +
      " " + lastName.substring(0,substringRandLimiter2))


$(document).ready(ready)
$(document).on('page:load', ready)


# queId = (length=8) ->
#   id = ""
#   id += Math.random().toString(36).substr(2) while id.length < length
#   id.substr 0, length
# $generate_name = queId()

# randString = (n) ->
#   n = 5  unless n
#   text = ""
#   possible = "abcdefghijklmnopqrstuvwxyz"
#   i = 0

#   while i < n
#     text += possible.charAt(Math.floor(Math.random() * possible.length))
#     i++
#   text
# $2ndtry = randString(4)
#
#   randomString = ->
# chars = "abcdefghiklmnopqrstuvwxyz"
# string_length = 8
# randomstring = ""
# i = 0

# while i < string_length
#   rnum = Math.floor(Math.random() * chars.length)
#   randomstring += chars.substring(rnum, rnum + 1)
#   i++
# return randomstring
