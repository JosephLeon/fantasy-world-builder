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

  # random name click event
  $('.char-gen-button').click ->
    consonant = ["b","c","d","f","g","h","j","k","l","m","n","p","q",
                            "r","s","t","v","w","x","z"]
    vowel = ["a", "e", "i", "o", "u", "y"]
    doubleConsonant = ["ch","dr","fh","gh","ht","jr","kw","lr","mh","ns",
                        "ph","qu", "rh","sm","th","vh","wr","xz","zh"]
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

    #set name
    randomNameGenerator()
    firstName = randomNameGenerator()
    lastName = randomNameGenerator()
    $('#character_name').val(firstName.substring(0,substringRandLimiter1) +
      " " + lastName.substring(0,substringRandLimiter2))
    # set level, calculate health
    level = Math.floor((Math.random()*18)+1)
    $('#character_level').val(level)
    $('#character_health').val(level * 10)
    $('#character_attack').val(level + 2)
    $('#character_defense').val(level)
    $('#character_armor').val(level - 1)
    $('#character_magic_save').val(level - 1)
    $('#character_mind_save').val(level)
    $('#character_force_save').val(level - 3)
    $('#character_weather_save').val(level + 2)
    $('#character_poison_save').val(level - 1)
    # set class/proffesion
    classes = ["Fighter","Mage","Thief","Assassin","Thug","Psion","Hunter",
                "Druid","Fight/Mage","Fighter/Thief","Mage/Assassin",
                "Mage/Psion","Hunter/Mage","Psion/Theif"]
    oneClass = classes.shuffle()
    characterClass = oneClass[0]
    $('#character_career').val(oneClass[0]) # Pull later for profession stat mods
    # set gold
    gold = Math.floor((Math.random()*400)+1)
    $('#character_gold').val(gold)
    # set base stats to variables (will adjust them later based )
    statCounter = 0
    maxNumStats = 8
    statArray = []
    while statCounter < maxNumStats
      stat = Math.floor((Math.random()*14)+6)
      statArray.push stat
      statCounter++
    intelligence = statArray[0]
    patience = statArray[1]
    charisma = statArray[2]
    perception = statArray[3]
    strength = statArray[4]
    agility = statArray[5]
    constitution = statArray[6]
    endurance = statArray[7]
    # set race, calculate weight, racial stat adjustments
    races = ["Human","Dwarf","Elf","Halfling"]
    oneRace = races.shuffle()
    $('#character_race').val(oneRace[0])
    if oneRace[0] == "Dwarf"
      weight = Math.floor((Math.random()*140)+120)
      $('#character_weight').val(weight)
      $('#character_magic_save').val(level + 5)
      $('#character_mind_save').val(level + 3)
      $('#character_armor').val(level + 4)
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma - 3
      racialAdjPerception = perception
      racialAdjStrength = strength + 2
      racialAdjAgility = agility - 1
      racialAdjConsitution = constitution + 2
      racialAdjEndurance = endurance
      $('#character_gold').val(gold + 30)
    else if oneRace[0] == "Halfling"
      weight = Math.floor((Math.random()*80)+60)
      $('#character_weight').val(weight)
      $('#character_poison_save').val(level + 4)
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma
      racialAdjPerception = perception
      racialAdjStrength = strength
      racialAdjAgility = agility
      racialAdjConsitution = constitution
      racialAdjEndurance = endurance
    else if oneRace[0] == "Elf"
      weight = Math.floor((Math.random()*120)+90)
      $('#character_weight').val(weight)
      $('#character_force_save').val(level)
      $('#character_weather_save').val(level + 6)
      $('#character_gold').val(gold - 10)
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma
      racialAdjPerception = perception
      racialAdjStrength = strength
      racialAdjAgility = agility
      racialAdjConsitution = constitution
      racialAdjEndurance = endurance
    else
      weight = Math.floor((Math.random()*120)+120)
      $('#character_weight').val(weight)
      $('#character_armor').val(level + 2)
      $('#character_gold').val(gold + 10)
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma
      racialAdjPerception = perception
      racialAdjStrength = strength
      racialAdjAgility = agility
      racialAdjConsitution = constitution
      racialAdjEndurance = endurance
    # classes = ["Fighter","Mage","Thief","Assassin","Thug","Psion","Hunter",
    #             "Druid","Fight/Mage","Fighter/Thief","Mage/Assassin",
    #             "Mage/Psion","Hunter/Mage","Psion/Theif"]
    # Adjust stats based on class
    if characterClass == "Fighter"
      classAdjIntelligence = racialAdjInteligence - 1
      classAdjPatience = racialAdjPatience - 1
      racialAdjCharisma = racialAdjCharisma - 1
      racialAdjPerception = racialAdjPerception
      racialAdjStrength = racialAdjStrength + 1
      racialAdjAgility = racialAdjAgility
      racialAdjConsitution = racialAdjConsitution + 1
      racialAdjEndurance = racialAdjEndurance + 1
    else if characterClass = "Mage"
      classAdjIntelligence = racialAdjInteligence + 2
      classAdjPatience = racialAdjPatience + 1
      racialAdjCharisma = racialAdjCharisma
      racialAdjPerception = racialAdjPerception
      racialAdjStrength = racialAdjStrength - 1
      racialAdjAgility = racialAdjAgility - 1
      racialAdjConsitution = racialAdjConsitution - 1
      racialAdjEndurance = racialAdjEndurance - 1
    else if characterClass = "Theif"
      classAdjIntelligence = racialAdjInteligence
      classAdjPatience = racialAdjPatience
      racialAdjCharisma = racialAdjCharisma + 1
      racialAdjPerception = racialAdjPerception
      racialAdjStrength = racialAdjStrength
      racialAdjAgility = racialAdjAgility + 1
      racialAdjConsitution = racialAdjConsitution
      racialAdjEndurance = racialAdjEndurance
    else
      classAdjIntelligence = racialAdjInteligence
      classAdjPatience = racialAdjPatience
      racialAdjCharisma = racialAdjCharisma
      racialAdjPerception = racialAdjPerception
      racialAdjStrength = racialAdjStrength
      racialAdjAgility = racialAdjAgility
      racialAdjConsitution = racialAdjConsitution
      racialAdjEndurance = racialAdjEndurance
    $('#character_intelligence').val(classAdjIntelligence)
    $('#character_patience').val(classAdjPatience)
    $('#character_charisma').val(racialAdjCharisma)
    $('#character_perception').val(racialAdjPerception)
    $('#character_strength').val(racialAdjStrength)
    $('#character_agility').val(racialAdjAgility)
    $('#character_constitution').val(racialAdjConsitution)
    $('#character_endurance').val(racialAdjEndurance)



$(document).ready(ready)
$(document).on('page:load', ready)
