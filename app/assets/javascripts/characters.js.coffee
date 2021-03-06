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
    consonantComesFirst = Math.floor((Math.random()*9))
    chooseSingle = Math.floor((Math.random()*9))
    chooseSecond = Math.floor((Math.random()*9))
    substringRandLimiter1 = Math.floor((Math.random()*5)+3)
    substringRandLimiter2 = Math.floor((Math.random()*5)+3)
    # clear some values in case they were present before new click
    $("#character_spells").val("")
    $("#character_powers").val("")
    randomNameGenerator = ->
      if isOdd(consonantComesFirst) # first letter consonant
        if isOdd(chooseSingle)
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
      else # first letter vowel
        if isOdd(chooseSingle)
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
    firstName = randomNameGenerator()
    lastName = randomNameGenerator()
    $('#character_name').val(firstName.substring(0,substringRandLimiter1) + " " + lastName.substring(0,substringRandLimiter2))
    # set level, calculate health, gold, vars for saves, skills
    level = Math.floor((Math.random()*25)+1)
    if level is 25
      ultraLevel = Math.floor((Math.random()*20)+1)
      if ultraLevel > 18
        level = level + Math.floor((Math.random()*10)+1)
      else if ultraLevel > 17
        level = level + Math.floor((Math.random()*5)+1)
      else
        level = level
    $('#character_level').val(level)
    $('#character_attack').val(level + 2)
    $('#character_defense').val(level)
    $('#character_armor').val(level - 1)
    gold = Math.floor((Math.random()*9)+1) * level
    $('#character_gold').val(gold)
    magic_save = mind_save = force_save = weather_save = poison_save = level
    arrSkills = []
    # set base stats to variables
    statCounter = 0
    statArray = []
    statVarArray = ["intelligence","patience","charisma","perception","strength","agility","constitution","endurance"]
    while statCounter < statVarArray.length
      stat = Math.floor((Math.random()*14)+6)
      statArray.push stat
      window[statVarArray[statCounter]] = statArray[statCounter]
      statCounter++
    # set race, calculate weight, racial stat/save adjustments
    races = ["Human","Dwarf","Elf","Halfling"]
    oneRace = races.shuffle()
    $('#character_race').val(oneRace[0])
    if oneRace[0] == "Dwarf"
      weight = Math.floor((Math.random()*140)+120)
      $('#character_weight').val(weight)
      $('#character_armor').val(level + 4)
      $('#character_languages').val("Common, Dwarven")
      $('#character_abilities').val("Detect goblin kind, See in the dark")
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma - 3
      racialAdjPerception = perception
      racialAdjStrength = strength + 2
      racialAdjAgility = agility - 1
      racialAdjConstitution = constitution + 2
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
      $('#character_languages').val("Common, Halfling")
      $('#character_abilities').val("See in the dark, Hide")
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma + 3
      racialAdjPerception = perception
      racialAdjStrength = strength - 2
      racialAdjAgility = agility + 3
      racialAdjConstitution = constitution - 1
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
      $('#character_languages').val("Common, Elven, Dwarven")
      $('#character_abilities').val("Less sleep, Slow aging")
      racialAdjInteligence = intelligence + 2
      racialAdjPatience = patience + 3
      racialAdjCharisma = charisma
      racialAdjPerception = perception
      racialAdjStrength = strength - 1
      racialAdjAgility = agility - 1
      racialAdjConstitution = constitution - 2
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
      $('#character_languages').val("Common")
      $('#character_abilities').val("10% better prices")
      racialAdjInteligence = intelligence
      racialAdjPatience = patience
      racialAdjCharisma = charisma
      racialAdjPerception = perception
      racialAdjStrength = strength
      racialAdjAgility = agility
      racialAdjConstitution = constitution
      racialAdjEndurance = endurance + 2
      racialAdjMagicSave = magic_save
      racialAdjMindSave = mind_save
      racialAdjForceSave = force_save
      racialAdjWeatherSave = weather_save
      racialAdjPoisonSave = poison_save

    # set class/proffesion and djust stats based on class
    classes = ["Fighter","Mage","Thief","Psion","Assassin","Hunter","Druid",
                "Mage/Fighter","Mage/Thief","Thief/Fighter","Assassin/Mage",
                "Assassin/Psion","Hunter/Psion"]
    classShuffle = classes.shuffle()
    characterClass = classShuffle[0]
    $('#character_career').val(characterClass)
    if characterClass is "Fighter"
      classAdjIntelligence = racialAdjInteligence - 1
      classAdjPatience = racialAdjPatience - 1
      classAdjCharisma = racialAdjCharisma - 1
      classAdjPerception = racialAdjPerception - 1
      classAdjStrength = racialAdjStrength + 2
      classAdjAgility = racialAdjAgility + 1
      classAdjConstitution = racialAdjConstitution + 2
      classAdjEndurance = racialAdjEndurance + 2
      classAdjMagicSave = racialAdjMagicSave - 1
      classAdjMindSave = racialAdjMindSave - 2
      classAdjForceSave = racialAdjForceSave + 1
      classAdjWeatherSave = racialAdjWeatherSave + 1
      classAdjPoisonSave = racialAdjPoisonSave + 1
      $('#character_health').val(level * 12)
    else if characterClass is "Thief" or
            characterClass is "Thief/Fighter"
      classAdjIntelligence = racialAdjInteligence - 1
      classAdjPatience = racialAdjPatience
      classAdjCharisma = racialAdjCharisma + 1
      classAdjPerception = racialAdjPerception
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility + 2
      classAdjConstitution = racialAdjConstitution - 1
      classAdjEndurance = racialAdjEndurance
      classAdjMagicSave = racialAdjMagicSave - 1
      classAdjMindSave = racialAdjMindSave + 1
      classAdjForceSave = racialAdjForceSave
      classAdjWeatherSave = racialAdjWeatherSave - 1
      classAdjPoisonSave = racialAdjPoisonSave + 4
      $('#character_health').val(level * 7)
    else if characterClass is "Mage"  or
            characterClass is "Mage/Thief" or
            characterClass is "Assassin/Mage" or
            characterClass is "Mage/Fighter"
      classAdjIntelligence = racialAdjInteligence + 2
      classAdjPatience = racialAdjPatience + 1
      classAdjCharisma = racialAdjCharisma
      classAdjPerception = racialAdjPerception + 1
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConstitution = racialAdjConstitution - 1
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave + 2
      classAdjMindSave = racialAdjMindSave + 2
      classAdjForceSave = racialAdjForceSave - 1
      classAdjWeatherSave = racialAdjWeatherSave - 2
      classAdjPoisonSave = racialAdjPoisonSave - 2
      if characterClass is "Mage" # set skills and spells for mage
        if level > 25
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Weather, Invisibility, Force of Will, Wish, Summon Demon/Angel, Raise Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level > 20
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Weather, Invisibility, Force of Will, Raise Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level > 15
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Invisibility, Force of Will, Raise Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level > 10
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Raise Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level > 5
          $("#character_spells").val("Fireball, Charm, Ice Wall, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else
          $("#character_spells").val("Charm, Minor Bolt, Levitate, Weather Resist, Armor, Open Lock, Slick Ground")
        arrSkills.push ["Read Magic, Reading & Writing, Ancient Languages, Protection Circles"]
        $('#character_health').val(level * 4)
      else # set skills and spells for other hybrid mage classes
        if level/2 > 25
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Weather, Invisibility, Force of Will, Wish, Summon Demon/Angel, Raise Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level/2 > 20
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Weather, Invisibility, Force of Will, Raise Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level/2 > 15
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Invisibility, Force of Will, Raise Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level/2 > 10
          $("#character_spells").val("Fireball, Charm, Ice Wall, Fly, Raise Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else if level/2 > 5
          $("#character_spells").val("Fireball, Charm, Ice Wall, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Open Lock, Slick Ground, Animate Weapon")
        else
          $("#character_spells").val("Charm, Minor Bolt, Levitate, Weather Resist, Armor, Open Lock, Slick Ground")
        if characterClass is "Assassin/Mage"
          arrSkills.push ["Read Magic, Reading & Writing, Moving Silently","Hide in Shadows", "Lock Picking"]
        else if characterClass is "Mage/Thief"
          arrSkills.push ["Read Magic, Reading & Writing, Moving Silently","Hide in Shadows", "Lock Picking"]
        else
          arrSkills.push ["Read Magic, Reading & Writing, Combat Casting"]
        $('#character_health').val(level * 5)
    else if characterClass is "Psion" or
            characterClass is "Hunter/Psion" or
            characterClass is "Assassin/Psion"
      classAdjIntelligence = racialAdjInteligence
      classAdjPatience = racialAdjPatience + 2
      classAdjCharisma = racialAdjCharisma
      classAdjPerception = racialAdjPerception + 2
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConstitution = racialAdjConstitution - 1
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave + 5
      classAdjForceSave = racialAdjForceSave + 3
      classAdjWeatherSave = racialAdjWeatherSave - 2
      classAdjPoisonSave = racialAdjPoisonSave - 3
      if characterClass is "Psion" # set powers and skills for psion
        if level > 25
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 10,000kg, Telepathy (Enemies), Defense Body Composition, Jump, Mind Control, Levitate (Self), Detect Life, Astral Travel, Banish, See Future, Disintegrate, Teleport")
        else if level > 20
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 2,000kg, Telepathy (Enemies), Defense Body Composition, Jump, Mind Control, Levitate (Self), Detect Life, Astral Travel, Banish")
        else if level > 15
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 500kg, Telepathy (Enemies), Defense Body Composition, Jump, Mind Control, Levitate (Self)")
        else if level > 10
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 100kg, Telepathy (Neutral), Defense Body Composition, Jump")
        else if level > 5
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 25kg, Telepathy (Allies)")
        else
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 5kg")
        arrSkills.push ["Reading & Writing, Ancient Languages, Power Areas"]
        $('#character_health').val(level * 8)
      else # set powers and skills for psion hybrids
        if level/2 > 25
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 10,000kg, Telepathy (Enemies), Defense Body Composition, Jump, Mind Control, Levitate (Self), Detect Life, Astral Travel, Banish, See Future, Disintegrate, Teleport")
        else if level/2 > 20
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 2,000kg, Telepathy (Enemies), Defense Body Composition, Jump, Mind Control, Levitate (Self), Detect Life, Astral Travel, Banish")
        else if level/2 > 15
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 500kg, Telepathy (Enemies), Defense Body Composition, Jump, Mind Control, Levitate (Self)")
        else if level/2 > 10
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 100kg, Telepathy (Neutral), Defense Body Composition, Jump")
        else if level/2 > 5
          $("#character_powers").val("Read Emotion, Detect Lie, Telekinisis 25kg, Telepathy (Allies)")
        else
          $("#character_spells").val("Read Emotion, Detect Lie, Telekinisis 5kg")
        arrSkills.push ["Reading & Writing, Moving Silently","Hide in Shadows"]
        $('#character_health').val(level * 6)
    else if characterClass is "Assassin"
      classAdjIntelligence = racialAdjInteligence + 2
      classAdjPatience = racialAdjPatience + 1
      classAdjCharisma = racialAdjCharisma - 4
      classAdjPerception = racialAdjPerception - 1
      classAdjStrength = racialAdjStrength + 2
      classAdjAgility = racialAdjAgility
      classAdjConstitution = racialAdjConstitution - 1
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave + 2
      classAdjMindSave = racialAdjMindSave + 2
      classAdjForceSave = racialAdjForceSave + 2
      classAdjWeatherSave = racialAdjWeatherSave + 2
      classAdjPoisonSave = racialAdjPoisonSave + 2
      arrSkills.push ["Poisons","Death Strike","Moving Silently","Hide in Shadows","Lock Picking"]
      $('#character_health').val(level * 7)
    else if characterClass is "Hunter"
      classAdjIntelligence = racialAdjInteligence + 2
      classAdjPatience = racialAdjPatience - 1
      classAdjCharisma = racialAdjCharisma - 4
      classAdjPerception = racialAdjPerception + 2
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConstitution = racialAdjConstitution + 1
      classAdjEndurance = racialAdjEndurance + 1
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave + 1
      classAdjForceSave = racialAdjForceSave
      classAdjWeatherSave = racialAdjWeatherSave + 7
      classAdjPoisonSave = racialAdjPoisonSave
      if level/2 > 25
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Major Weather, Invisibility, Force of Will, Destiny, Banish Demon/Angel, Banish Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level/2 > 20
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Weather, Invisibility, Force of Will, Banish Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level/2 > 15
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Invisibility, Force of Will, Banish Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level/2 > 10
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Banish Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level/2 > 5
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else
        $("#character_spells").val("Charm Animal, Minor Bolt, Levitate, Weather Resist, Armor, Slick Ground")
      arrSkills.push ["Tracking","Moving Silently","Hide in Shadows"]
      $('#character_health').val(level * 7)
    else if characterClass is "Druid"
      classAdjIntelligence = racialAdjInteligence - 1
      classAdjPatience = racialAdjPatience + 3
      classAdjCharisma = racialAdjCharisma - 2
      classAdjPerception = racialAdjPerception - 1
      classAdjStrength = racialAdjStrength - 1
      classAdjAgility = racialAdjAgility - 1
      classAdjConstitution = racialAdjConstitution + 3
      classAdjEndurance = racialAdjEndurance - 1
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave
      classAdjForceSave = racialAdjForceSave + 7
      classAdjWeatherSave = racialAdjWeatherSave + 7
      classAdjPoisonSave = racialAdjPoisonSave
      if level > 25
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Major Weather, Invisibility, Force of Will, Destiny, Banish Demon/Angel, Banish Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level > 20
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Weather, Invisibility, Force of Will, Banish Dead, Minor Bolt, Rapid Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level > 15
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Invisibility, Force of Will, Banish Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level > 10
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Fly, Banish Dead, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else if level > 5
        $("#character_spells").val("Lightning, Charm Animal, Ice Wall, Minor Bolt, Levitate, Water Breathing, Weather Resist, Armor, Slick Ground, Animate Vines")
      else
        $("#character_spells").val("Charm Animal, Minor Bolt, Levitate, Weather Resist, Armor, Slick Ground")
      arrSkills.push ["Animal Aspect","Animal Senses"]
      $('#character_health').val(level * 6)
    else
      classAdjIntelligence = racialAdjInteligence
      classAdjPatience = racialAdjPatience
      classAdjCharisma = racialAdjCharisma
      classAdjPerception = racialAdjPerception
      classAdjStrength = racialAdjStrength
      classAdjAgility = racialAdjAgility
      classAdjConstitution = racialAdjConstitution
      classAdjEndurance = racialAdjEndurance
      classAdjMagicSave = racialAdjMagicSave
      classAdjMindSave = racialAdjMindSave
      classAdjForceSave = racialAdjForceSave
      classAdjWeatherSave = racialAdjWeatherSave
      classAdjPoisonSave = racialAdjPoisonSave
      $('#character_health').val(level * 6)

    levelStatAdjustor = Math.round(level / 8)
    $('#character_intelligence').val(classAdjIntelligence + levelStatAdjustor)
    $('#character_patience').val(classAdjPatience + levelStatAdjustor)
    $('#character_charisma').val(classAdjCharisma + levelStatAdjustor)
    $('#character_perception').val(classAdjPerception + levelStatAdjustor)
    $('#character_strength').val(classAdjStrength + levelStatAdjustor)
    $('#character_agility').val(classAdjAgility + levelStatAdjustor)
    $('#character_constitution').val(classAdjConstitution + levelStatAdjustor)
    $('#character_endurance').val(classAdjEndurance + levelStatAdjustor)
    $('#character_magic_save').val(classAdjMagicSave)
    $('#character_mind_save').val(classAdjMindSave)
    $('#character_force_save').val(classAdjForceSave)
    $('#character_weather_save').val(classAdjWeatherSave)
    $('#character_poison_save').val(classAdjPoisonSave)

    cleanArrSkills = arrSkills.join(',').replace(/,/g, ', ')
    $('#character_skills').val(cleanArrSkills)

$(document).ready(ready)
$(document).on('page:load', ready)
