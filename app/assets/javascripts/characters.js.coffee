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
    # set level, calculate health, gold, vars for saves, skills
    level = Math.floor((Math.random()*25)+1)
    $('#character_level').val(level)
    $('#character_health').val(level * 10)
    $('#character_attack').val(level + 2)
    $('#character_defense').val(level)
    $('#character_armor').val(level - 1)
    gold = Math.floor((Math.random()*9)+1) * level
    $('#character_gold').val(gold)
    magic_save = mind_save = force_save = weather_save = poison_save = level
    arrSkills = ["Running"]
    # set class/proffesion
    classes = ["Fighter","Mage","Thief","Assassin","Thug","Psion","Hunter",
                "Druid","Fight/Mage","Fighter/Thief","Mage/Assassin",
                "Mage/Psion","Hunter/Mage","Psion/Theif"]
    oneClass = classes.shuffle()
    characterClass = oneClass[0]
    $('#character_career').val(oneClass[0])
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
    # set race, calculate weight, racial stat/save adjustments
    races = ["Human","Dwarf","Elf","Halfling"]
    oneRace = races.shuffle()
    $('#character_race').val(oneRace[0])
    if oneRace[0] == "Dwarf"
      weight = Math.floor((Math.random()*140)+120)
      $('#character_weight').val(weight)
      $('#character_armor').val(level + 4)
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma - 3
      racialAdjPerception = perception
      racialAdjStrength = strength + 2
      racialAdjAgility = agility - 1
      racialAdjConsitution = constitution + 2
      racialAdjEndurance = endurance
      racialAdjMagicSave = magic_save + 5
      racialAdjMindSave = mind_save + 2
      racialAdjForceSave = force_save
      racialAdjWeatherSave = weather_save
      racialAdjPoisonSave = poison_save
      arrSkills.push ["Masonry","Brewing"]
    else if oneRace[0] == "Halfling"
      weight = Math.floor((Math.random()*80)+60)
      $('#character_weight').val(weight)
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma + 3
      racialAdjPerception = perception
      racialAdjStrength = strength - 2
      racialAdjAgility = agility + 3
      racialAdjConsitution = constitution - 1
      racialAdjEndurance = endurance - 1
      racialAdjMagicSave = magic_save
      racialAdjMindSave = mind_save
      racialAdjForceSave = force_save
      racialAdjWeatherSave = weather_save
      racialAdjPoisonSave = poison_save + 5
      arrSkills.push ["Singing","Jokes"]
    else if oneRace[0] == "Elf"
      weight = Math.floor((Math.random()*120)+90)
      $('#character_weight').val(weight)
      racialAdjInteligence = intelligence + 2
      racialAdjPatience = patience + 3
      racialAdjCharisma = charisma
      racialAdjPerception = perception
      racialAdjStrength = strength - 1
      racialAdjAgility = agility - 1
      racialAdjConsitution = constitution - 2
      racialAdjEndurance = endurance
      racialAdjMagicSave = magic_save
      racialAdjMindSave = mind_save + 5
      racialAdjForceSave = force_save + 5
      racialAdjWeatherSave = weather_save
      racialAdjPoisonSave = poison_save
      arrSkills.push ["Read Magic","Etiquette"]
    else
      weight = Math.floor((Math.random()*120)+120)
      $('#character_weight').val(weight)
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma
      racialAdjPerception = perception
      racialAdjStrength = strength
      racialAdjAgility = agility
      racialAdjConsitution = constitution
      racialAdjEndurance = endurance
      racialAdjMagicSave = magic_save
      racialAdjMindSave = mind_save
      racialAdjForceSave = force_save
      racialAdjWeatherSave = weather_save
      racialAdjPoisonSave = poison_save
    # Adjust stats based on class
    if characterClass == "Fighter"
      classAdjIntelligence = racialAdjInteligence - 1
      classAdjPatience = racialAdjPatience - 1
      classAdjCharisma = racialAdjCharisma - 1
      classAdjPerception = racialAdjPerception - 1
      classAdjStrength = racialAdjStrength + 1
      classAdjAgility = racialAdjAgility + 1
      classAdjConsitution = racialAdjConsitution + 1
      classAdjEndurance = racialAdjEndurance + 1
      classAdjMagicSave = racialAdjMagicSave - 1
      classAdjMindSave = racialAdjMindSave - 2
      classAdjForceSave = racialAdjForceSave + 1
      classAdjWeatherSave = racialAdjWeatherSave + 1
      classAdjPoisonSave = racialAdjPoisonSave + 1
      arrSkills.push ["Armor Repair","Jumping","Rolling","Horse Riding","Swimming"]
    else if characterClass = "Mage"
      classAdjIntelligence = racialAdjInteligence + 2
      classAdjPatience = racialAdjPatience + 1
      classAdjCharisma = racialAdjCharisma
      classAdjPerception = racialAdjPerception + 1
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConsitution = racialAdjConsitution - 1
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave + 2
      classAdjMindSave = racialAdjMindSave + 2
      classAdjForceSave = racialAdjForceSave - 1
      classAdjWeatherSave = racialAdjWeatherSave - 2
      classAdjPoisonSave = racialAdjPoisonSave - 2
      arrSkills.push ["Reading/Writing","Strategy Games","Book Binding"]
    else if characterClass = "Theif"
      classAdjIntelligence = racialAdjInteligence - 1
      classAdjPatience = racialAdjPatience
      classAdjCharisma = racialAdjCharisma + 1
      classAdjPerception = racialAdjPerception
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility + 2
      classAdjConsitution = racialAdjConsitution - 1
      classAdjEndurance = racialAdjEndurance
      classAdjMagicSave = racialAdjMagicSave -1
      classAdjMindSave = racialAdjMindSave + 1
      classAdjForceSave = racialAdjForceSave
      classAdjWeatherSave = racialAdjWeatherSave - 1
      classAdjPoisonSave = racialAdjPoisonSave + 4
      arrSkills.push ["Acrobatics","Moving Silently","Hide in Shadows",
                      "Lock Picking","Pick Pockets"]
    else if characterClass = "Psion"
      classAdjIntelligence = racialAdjInteligence
      classAdjPatience = racialAdjPatience + 2
      classAdjCharisma = racialAdjCharisma
      classAdjPerception = racialAdjPerception + 2
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConsitution = racialAdjConsitution - 1
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave + 5
      classAdjForceSave = racialAdjForceSave + 3
      classAdjWeatherSave = racialAdjWeatherSave - 2
      classAdjPoisonSave = racialAdjPoisonSave - 3
      arrSkills.push ["Reading/Writing"]
    else if characterClass = "Assassin"
      classAdjIntelligence = racialAdjInteligence + 2
      classAdjPatience = racialAdjPatience + 1
      classAdjCharisma = racialAdjCharisma - 4
      classAdjPerception = racialAdjPerception - 1
      classAdjStrength = racialAdjStrength + 2
      classAdjAgility = racialAdjAgility
      classAdjConsitution = racialAdjConsitution - 1
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave + 2
      classAdjMindSave = racialAdjMindSave + 2
      classAdjForceSave = racialAdjForceSave + 2
      classAdjWeatherSave = racialAdjWeatherSave + 2
      classAdjPoisonSave = racialAdjPoisonSave + 2
      arrSkills.push ["Poisons","Death Strike","Moving Silently","Hide in Shadows",
                      "Lock Picking"]
    else if characterClass = "Hunter"
      classAdjIntelligence = racialAdjInteligence + 2
      classAdjPatience = racialAdjPatience - 1
      classAdjCharisma = racialAdjCharisma - 4
      classAdjPerception = racialAdjPerception + 2
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConsitution = racialAdjConsitution + 1
      classAdjEndurance = racialAdjEndurance + 1
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave + 1
      classAdjForceSave = racialAdjForceSave
      classAdjWeatherSave = racialAdjWeatherSave + 7
      classAdjPoisonSave = racialAdjPoisonSave
      arrSkills.push ["Tracking","Moving Silently","Hide in Shadows"]
    else if characterClass = "Druid"
      classAdjIntelligence = racialAdjInteligence - 1
      classAdjPatience = racialAdjPatience + 3
      classAdjCharisma = racialAdjCharisma - 2
      classAdjPerception = racialAdjPerception - 1
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConsitution = racialAdjConsitution + 3
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave
      classAdjForceSave = racialAdjForceSave + 7
      classAdjWeatherSave = racialAdjWeatherSave + 7
      classAdjPoisonSave = racialAdjPoisonSave
      arrSkills.push ["Animal Aspect","Animal Senses"]
    else
      classAdjIntelligence = racialAdjInteligence
      classAdjPatience = racialAdjPatience
      classAdjCharisma = racialAdjCharisma
      classAdjPerception = racialAdjPerception
      classAdjStrength = racialAdjStrength
      classAdjAgility = racialAdjAgility
      classAdjConsitution = racialAdjConsitution
      classAdjEndurance = racialAdjEndurance
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave
      classAdjForceSave = racialAdjForceSave
      classAdjWeatherSave = racialAdjWeatherSave
      classAdjPoisonSave = racialAdjPoisonSave
    levelStatAdjustor = Math.round(level / 8)
    $('#character_intelligence').val(classAdjIntelligence + levelStatAdjustor)
    $('#character_patience').val(classAdjPatience + levelStatAdjustor)
    $('#character_charisma').val(racialAdjCharisma + levelStatAdjustor)
    $('#character_perception').val(racialAdjPerception + levelStatAdjustor)
    $('#character_strength').val(racialAdjStrength + levelStatAdjustor)
    $('#character_agility').val(racialAdjAgility + levelStatAdjustor)
    $('#character_constitution').val(racialAdjConsitution + levelStatAdjustor)
    $('#character_endurance').val(racialAdjEndurance + levelStatAdjustor)
    $('#character_magic_save').val(classAdjMagicSave)
    $('#character_mind_save').val(classAdjMindSave)
    $('#character_force_save').val(classAdjForceSave)
    $('#character_weather_save').val(classAdjWeatherSave)
    $('#character_poison_save').val(classAdjPoisonSave)

    $('#character_skills').val(arrSkills)

$(document).ready(ready)
$(document).on('page:load', ready)
