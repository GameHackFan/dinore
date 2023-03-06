const dataPatch = 
{
  type: "overwrite",
  filename: "cde_re.10f",
  byteFormat: "hex",
  data:
  {
    // Tyrog Puke Pallete Fix (01 to 03 - 81 to 83)
    "317120": ["83", "00"],



    // Pallete 03 (Previous Mess' pallete, now Hannah's Custom pallete)
    "752306":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "00", "05", "00", "08", "00", "0B",
      "40", "0F", "80", "0F", "EE", "0F", "BB", "0C",
      "88", "09", "55", "06", "FF", "0F", "A9", "00"
    ],

    // Pallete 16 (Razor's Pallete, Gray and Purple)
    "752914":
    [
      "11", "01", "A8", "0E", "65", "0B", "43", "07",
      "30", "05", "47", "02", "69", "04", "9C", "07",
      "BE", "09", "DF", "0B", "9C", "0A", "6A", "07",
      "48", "05", "26", "03", "FF", "0F", "A9", "00"
    ],


    
    // Need a Hand Speech Balloon Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "932868": ["16", "80"],

    // Need a Hand Speech Balloon Pallete Fix 2 (00 to 16 - 0000 to 0016)
    "932874": ["16", "00"],

    // Need a Hand Speech Balloon Pallete Fix 3 (00 to 16 - 0400 to 0416)
    "932878": ["16", "04"],


    // They're Gonna Pay For This Speech Balloon Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "932884": ["16", "80"],

    // They're Gonna Pay For This Speech Balloon Pallete Fix 2 (00 to 16 - 0400 to 0416)
    "932890": ["16", "04"],

    // They're Gonna Pay For This Speech Balloon Pallete Fix 3 (00 to 16 - 0400 to 0416)
    "932894": ["16", "04"],


    // Type 1 Knife 1 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935702": ["16", "80"],

    // Type 1 Knife 1 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "935708": ["16", "01"],

    // Type 1 Knife 2 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935714": ["16", "80"],

    // Type 1 Knife 2 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "935720": ["16", "01"],

    // Type 1 Knife 3 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935726": ["16", "80"],

    // Type 1 Knife 3 Pallete Fix 2 (00 to 16 - 0000 to 0016)
    "935732": ["16", "00"],

    // Type 1 Knife 3 Pallete Fix 3 (00 to 16 - 0100 to 0116)
    "935736": ["16", "01"],

    // Type 1 Knife 4 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935742": ["16", "80"],

    // Type 1 Knife 4 Pallete Fix 2 (00 to 16 - 1000 to 0116)
    "935748": ["16", "10"],

    // Type 1 Knife 5 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935754": ["16", "80"],

    // Type 1 Knife 5 Pallete Fix 2 (00 to 16 - 1000 to 0116)
    "935760": ["16", "10"],

    // Type 1 Knife 6 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935766": ["16", "80"],

    // Type 1 Knife 6 Pallete Fix 2 (00 to 16 - 1000 to 0116)
    "935772": ["16", "10"],

    // Type 1 Knife 7 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935778": ["16", "80"],

    // Type 1 Knife 7 Pallete Fix 2 (00 to 16 - 0000 to 0016)
    "935784": ["16", "00"],

    // Type 1 Knife 7 Pallete Fix 3 (00 to 16 - 0100 to 0116)
    "935788": ["16", "01"],

    // Type 1 Knife 8 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "935794": ["16", "80"],

    // Type 1 Knife 8 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "935800": ["16", "01"],

    // Type 1 Knife 9 Pallete Fix (00 to 16 - 0000 to 0016)
    "935806": ["16", "00"],

    // Type 1 Knife 10 Pallete Fix (00 to 16 - 0000 to 0016)
    "935818": ["16", "00"],

    // Type 1 Knife 11 Pallete Fix (00 to 16 - 0000 to 0016)
    "935830": ["16", "00"],

    // Type 1 Knife 12 Pallete Fix (00 to 16 - 0000 to 0016)
    "935844": ["16", "00"],

    // Type 1 Knife 13 Pallete Fix (00 to 16 - 0000 to 0016)
    "935856": ["16", "00"],

    // Type 1 Knife 14 Pallete Fix (00 to 16 - 0000 to 0016)
    "935868": ["16", "00"],

    // Type 1 Knife 15 Pallete Fix (00 to 16 - 0000 to 0016)
    "935880": ["16", "00"],

    // Type 1 Knife 16 Pallete Fix (00 to 16 - 0000 to 0016)
    "935894": ["16", "00"],

    // Type 1 Knife 17 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "938658": ["16", "80"],

    // Type 1 Knife 17 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "938664": ["16", "01"],


    // Slice Boomerang 1 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "940736": ["16", "01"],

    // Slice Boomerang 1 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "940740": ["16", "01"],

    // Slice Boomerang 2 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "940768": ["16", "01"],

    // Slice Boomerang 2 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "940772": ["16", "01"],

    // Slice Boomerang 3 Pallete Fix 1 (00 to 16 - 0000 to 0016)
    "940812": ["16", "00"],

    // Slice Boomerang 3 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "940816": ["16", "01"],

    // Slice Boomerang 4 Pallete Fix 1 (00 to 16 - 0000 to 0016)
    "940848": ["16", "00"],

    // Slice Boomerang 4 Pallete Fix 2 (00 to 16 - 1000 to 1016)
    "940852": ["16", "10"],

    // Slice Boomerang 5 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "940960": ["16", "01"],

    // Slice Boomerang 5 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "940964": ["16", "01"],

    // Slice Boomerang 6 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "940988": ["16", "01"],

    // Slice Boomerang 6 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "940992": ["16", "01"],

    // Slice Boomerang 7 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941024": ["16", "01"],

    // Slice Boomerang 7 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941028": ["16", "01"],

    // Slice Boomerang 8 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941060": ["16", "01"],

    // Slice Boomerang 8 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941064": ["16", "01"],

    // Slice Boomerang 9 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941092": ["16", "01"],

    // Slice Boomerang 9 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941096": ["16", "01"],

    // Slice Boomerang 10 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941120": ["16", "01"],

    // Slice Boomerang 10 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941124": ["16", "01"],

    // Slice Boomerang 11 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941152": ["16", "01"],

    // Slice Boomerang 11 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941156": ["16", "01"],

    // Slice Boomerang 12 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941184": ["16", "01"],

    // Slice Boomerang 12 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941188": ["16", "01"],

    // Slice Boomerang 13 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941228": ["16", "01"],

    // Slice Boomerang 13 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941232": ["16", "01"],

    // Slice Boomerang 14 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941268": ["16", "01"],

    // Slice Boomerang 14 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941272": ["16", "01"],

    // Slice Boomerang 15 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941312": ["16", "01"],

    // Slice Boomerang 15 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941316": ["16", "01"],

    // Slice Boomerang 16 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941400": ["16", "01"],

    // Slice Boomerang 16 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941404": ["16", "01"],

    // Slice Boomerang 17 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941436": ["16", "01"],

    // Slice Boomerang 17 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941440": ["16", "01"],

    // Slice Boomerang 18 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941468": ["16", "01"],

    // Slice Boomerang 18 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941472": ["16", "01"],

    // Slice Boomerang 19 Pallete Fix 1 (00 to 16 - 0000 to 0016)
    "941504": ["16", "00"],

    // Slice Boomerang 20 Pallete Fix 1 (00 to 16 - 0000 to 0016)
    "941532": ["16", "00"],

    // Slice Boomerang 20 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941536": ["16", "01"],

    // Slice Boomerang 21 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941576": ["16", "01"],

    // Slice Boomerang 21 Pallete Fix 2 (00 to 16 - 0000 to 0016)
    "941580": ["16", "00"],

    // Slice Boomerang 21 Pallete Fix 3 (00 to 16 - 0000 to 0016)
    "941584": ["16", "00"],

    // Slice Boomerang 22 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941620": ["16", "01"],

    // Slice Boomerang 22 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941624": ["16", "01"],

    // Slice Boomerang 23 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "941668": ["16", "01"],

    // Slice Boomerang 23 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "941672": ["16", "01"],

    // Slice Boomerang 24 Pallete Fix 1 (00 to 16 - 0100 to 0116)
    "977326": ["16", "01"],

    // Slice Boomerang 24 Pallete Fix 2 (00 to 16 - 0100 to 0116)
    "977330": ["16", "01"],


    // Boom Label Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "961336": ["03", "80"],

    // Boom Label Pallete Fix 2 (01 to 03 - 0201 to 0203)
    "961342": ["03", "02"],

    // Boom Label Pallete Fix 3 (01 to 03 - 8001 to 8003)
    "961348": ["03", "80"],

    // Boom Label Pallete Fix 4 (01 to 03 - 1301 to 1303)
    "961354": ["03", "13"],

    // Boom Label Pallete Fix 5 (01 to 03 - 8001 to 8003)
    "961360": ["03", "80"],

    // Boom Label Pallete Fix 6 (01 to 03 - 1401 to 1403)
    "961366": ["03", "14"],

    // Boom Label Pallete Fix 7 (01 to 03 - 8001 to 8003)
    "961372": ["03", "80"],

    // Boom Label Pallete Fix 8 (01 to 03 - 1401 to 1403)
    "961378": ["03", "14"],


    // Dinosaur Sleeping "Zzzz" Pallete Fix 1 (00 to 0E - 0000 to 000E) 
    "961476": ["0E", "00"],

    // Dinosaur Sleeping "Zzzz" Pallete Fix 2 (00 to 0E - 0000 to 000E) 
    "961486": ["0E", "00"],

    // Dinosaur Sleeping "Zzzz" Pallete Fix 3 (00 to 0E - 0000 to 000E) 
    "961496": ["0E", "00"],


    // M16 Uzi "Ta" Pallete Fix (00 to 0E - 0000 to 000E) 
    "961506": ["0E", "00"],

    // M16 Uzi "Ka" Pallete Fix (00 to 0E - 0000 to 000E) 
    "961516": ["0E", "00"],


    // Dialogue "Question" Pallete Fix (00 to 16 - 0000 to 0016) 
    "961538": ["16", "00"],

    // Dialogue "Exclamation" Pallete Fix (00 to 16 - 0000 to 0016)
    "961548": ["16", "00"],


    // Baby Dinosaur and Egg Pallete Fix 1 (02 to 17 - 8002 to 8017)
    "962740": ["17", "80"],

    // Baby Dinosaur and Egg Pallete Fix 2 (02 to 17 - 1202 to 1217)
    "962746": ["17", "12"],

    // Baby Dinosaur and Egg Pallete Fix 3 (02 to 17 - 8002 to 8017)
    "962752": ["17", "80"],

    // Baby Dinosaur and Egg Pallete Fix 4 (02 to 17 - 1002 to 1017)
    "962758": ["17", "10"],

    // Baby Dinosaur and Egg Pallete Fix 5 (02 to 17 - 0002 to 0017)
    "962762": ["17", "00"],

    // Baby Dinosaur and Egg Pallete Fix 6 (02 to 17 - 0002 to 0017)
    "962766": ["17", "00"],

    // Baby Dinosaur and Egg Pallete Fix 7 (02 to 17 - 0102 to 0117)
    "962770": ["17", "01"],


    // Sunglassess Pallete Fix (00 to 16 - 0000 to 0016)
    "962786": ["16", "00"],


    // Player Indicator 1P 1 Fix 1 (00 to 03 - 8000 to 8003)
    "961558": ["03", "80"],

    // Player Indicator 1P 1 Fix 2 (00 to 03 - 0000 to 0003)
    "961564": ["03", "00"],

    // Player Indicator 1P 1 Fix 3 (00 to 03 - 0100 to 0103)
    "961568": ["03", "01"],

    // Player Indicator 1P 2 Fix 1 (00 to 03 - 8000 to 8003)
    "961574": ["03", "80"],

    // Player Indicator 1P 2 Fix 2 (00 to 03 - 0000 to 0003)
    "961580": ["03", "00"],

    // Player Indicator 1P 2 Fix 3 (00 to 03 - 0100 to 0103)
    "961584": ["03", "01"],

    // Player Indicator 1P 3 Fix 1 (00 to 03 - 8000 to 8003)
    "961590": ["03", "80"],

    // Player Indicator 1P 3 Fix 2 (00 to 03 - 0000 to 0003)
    "961596": ["03", "00"],

    // Player Indicator 1P 3 Fix 3 (00 to 03 - 0100 to 0103)
    "961600": ["03", "01"],


    // Player Indicator 2P 1 Fix 1 (07 to 0E - 8007 to 800E)
    "963396": ["0E", "80"],

    // Player Indicator 2P 1 Fix 2 (07 to 0E - 0007 to 000E)
    "963402": ["0E", "00"],

    // Player Indicator 2P 1 Fix 3 (07 to 0E - 0107 to 010E)
    "963406": ["0E", "01"],

    // Player Indicator 2P 2 Fix 1 (07 to 0E - 8007 to 800E)
    "963412": ["0E", "80"],

    // Player Indicator 2P 2 Fix 2 (07 to 0E - 0007 to 000E)
    "963418": ["0E", "00"],

    // Player Indicator 2P 2 Fix 3 (07 to 0E - 0107 to 010E)
    "963422": ["0E", "01"],

    // Player Indicator 2P 3 Fix 1 (07 to 0E - 8007 to 800E)
    "963428": ["0E", "80"],

    // Player Indicator 2P 3 Fix 2 (07 to 0E - 0007 to 000E)
    "963434": ["0E", "00"],

    // Player Indicator 2P 3 Fix 3 (07 to 0E - 0107 to 010E)
    "963438": ["0E", "01"],



    // Body Parts 1 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963788": ["03", "80"],

    // Body Parts 1 Pallete Fix 2 (01 to 03 - 0101 to 0103)
    "963794": ["03", "01"],

    // Body Parts 2 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963800": ["03", "80"],

    // Body Parts 2 Pallete Fix 2 (01 to 03 - 1001 to 1003)
    "963806": ["03", "10"],

    // Body Parts 3 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963812": ["03", "80"],

    // Body Parts 3 Pallete Fix 2 (01 to 03 - 0101 to 0103)
    "963818": ["03", "01"],

    // Body Parts 4 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963824": ["03", "80"],

    // Body Parts 4 Pallete Fix 2 (01 to 03 - 0141 to 0143)
    "963830": ["43", "01"],

    // Body Parts 5 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963836": ["03", "80"],

    // Body Parts 5 Pallete Fix 2 (01 to 03 - 1041 to 1043)
    "963666": ["43", "10"],

    // Body Parts 6 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963848": ["03", "80"],

    // Body Parts 6 Pallete Fix 2 (01 to 03 - 0141 to 0143)
    "963854": ["43", "01"],

    // Body Parts 7 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963860": ["03", "80"],

    // Body Parts 7 Pallete Fix 2 (01 to 03 - 0001 to 0003)
    "963866": ["03", "00"],

    // Body Parts 7 Pallete Fix 3 (01 to 03 - 1001 to 1003)
    "963870": ["03", "10"],

    // Body Parts 8 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963876": ["03", "80"],

    // Body Parts 8 Pallete Fix 2 (01 to 03 - 0001 to 0003)
    "963882": ["03", "00"],

    // Body Parts 8 Pallete Fix 3 (01 to 03 - 1001 to 1003)
    "963886": ["03", "10"],

    // Body Parts 9 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963892": ["03", "80"],

    // Body Parts 9 Pallete Fix 2 (01 to 03 - 1101 to 1103)
    "963898": ["03", "11"],

    // Body Parts 10 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963904": ["03", "80"],

    // Body Parts 10 Pallete Fix 2 (01 to 03 - 0061 to 0063)
    "963910": ["63", "00"],

    // Body Parts 10 Pallete Fix 3 (01 to 03 - 1061 to 1063)
    "963914": ["63", "10"],

    // Body Parts 11 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963920": ["03", "80"],

    // Body Parts 11 Pallete Fix 2 (01 to 03 - 0061 to 0063)
    "963926": ["63", "00"],

    // Body Parts 11 Pallete Fix 3 (01 to 03 - 1061 to 1063)
    "963930": ["63", "10"],

    // Body Parts 12 Pallete Fix 1 (01 to 03 - 8001 to 8003)
    "963936": ["03", "80"],

    // Body Parts 12 Pallete Fix 2 (01 to 03 - 1161 to 1163)
    "963942": ["63", "11"],

    // Body Parts 13 Pallete Fix 1 (01 to 03 - 0001 to 0003)
    "963948": ["03", "00"],

    // Body Parts 14 Pallete Fix 1 (01 to 03 - 0001 to 0003)
    "963958": ["03", "00"],

    // Body Parts 15 Pallete Fix 1 (01 to 03 - 0001 to 0003)
    "963968": ["03", "00"],

    // Body Parts 16 Pallete Fix 1 (01 to 03 - 0001 to 0003)
    "963978": ["03", "00"],


    // 7th Stage Library Book 1 Pallete Fix 1 (03 to 1C - 8003 to 801C)
    "965172": ["1C", "80"],

    // 7th Stage Library Book 1 Pallete Fix 2 (03 to 1C - 1103 to 111C)
    "965178": ["1C", "11"],

    // 7th Stage Library Book 2 Pallete Fix 1 (03 to 01 - 8003 to 8014)
    "965184": ["14", "80"],

    // 7th Stage Library Book 2 Pallete Fix 2 (03 to 01 - 0103 to 0114)
    "965190": ["14", "01"],

    // 7th Stage Library Book 2 Pallete Fix 3 (03 to 01 - 0203 to 0214)
    "965194": ["14", "02"],

    // 7th Stage Library Book 3 Pallete Fix 1 (03 to 03 - 8003 to 8003)
    "965200": ["03", "80"],

    // 7th Stage Library Book 3 Pallete Fix 2 (03 to 03 - 1103 to 1103)
    "965206": ["03", "11"],


    // Type 2 Knife 1 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967746": ["16", "80"],

    // Type 2 Knife 1 Pallete Fix 2 (00 to 16 - 0160 to 0176)
    "967752": ["76", "01"],

    // Type 2 Knife 2 Pallete Fix 1 (00 to 16 - 8000 to 8076)
    "967758": ["16", "80"],

    // Type 2 Knife 2 Pallete Fix 2 (00 to 16 - 0160 to 0176)
    "967764": ["76", "01"],

    // Type 2 Knife 3 Pallete Fix 1 (00 to 16 - 8000 to 8076)
    "967770": ["16", "80"],

    // Type 2 Knife 3 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967776": ["76", "00"],

    // Type 2 Knife 3 Pallete Fix 3 (00 to 16 - 0160 to 0176)
    "967780": ["76", "01"],

    // Type 2 Knife 4 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967786": ["16", "80"],

    // Type 2 Knife 4 Pallete Fix 2 (00 to 16 - 1060 to 1076)
    "967792": ["76", "10"],

    // Type 2 Knife 5 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967798": ["16", "80"],

    // Type 2 Knife 5 Pallete Fix 2 (00 to 16 - 1060 to 1076)
    "967804": ["76", "10"],

    // Type 2 Knife 6 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967810": ["16", "80"],

    // Type 2 Knife 6 Pallete Fix 2 (00 to 16 - 1060 to 1076)
    "967816": ["76", "10"],

    // Type 2 Knife 7 Pallete Fix 1 (00 to 16 - 8000 to 8076)
    "967822": ["16", "80"],

    // Type 2 Knife 7 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967828": ["76", "00"],

    // Type 2 Knife 7 Pallete Fix 3 (00 to 16 - 0160 to 0176)
    "967832": ["76", "01"],

    // Type 2 Knife 8 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967838": ["16", "80"],

    // Type 2 Knife 8 Pallete Fix 2 (00 to 16 - 0160 to 0176)
    "967844": ["76", "01"],

    // Type 2 Knife 9 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967850": ["16", "80"],

    // Type 2 Knife 9 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967856": ["76", "00"],

    // Type 2 Knife 9 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967860": ["76", "00"],

    // Type 2 Knife 10 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967866": ["16", "80"],

    // Type 2 Knife 10 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967872": ["76", "00"],

    // Type 2 Knife 10 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967876": ["76", "00"],

    // Type 2 Knife 11 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967882": ["16", "80"],

    // Type 2 Knife 11 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967888": ["76", "00"],

    // Type 2 Knife 11 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967892": ["76", "00"],

    // Type 2 Knife 11 Pallete Fix 4 (00 to 16 - 0060 to 0076)
    "967896": ["76", "00"],

    // Type 2 Knife 12 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967902": ["16", "80"],

    // Type 2 Knife 12 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967908": ["76", "00"],

    // Type 2 Knife 12 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967912": ["76", "00"],

    // Type 2 Knife 13 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967918": ["16", "80"],

    // Type 2 Knife 13 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967924": ["76", "00"],

    // Type 2 Knife 13 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967928": ["76", "00"],

    // Type 2 Knife 14 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967934": ["16", "80"],

    // Type 2 Knife 14 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967940": ["76", "00"],

    // Type 2 Knife 14 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967944": ["76", "00"],

    // Type 2 Knife 15 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967950": ["16", "80"],

    // Type 2 Knife 15 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967956": ["76", "00"],

    // Type 2 Knife 15 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967960": ["76", "00"],

    // Type 2 Knife 15 Pallete Fix 4 (00 to 16 - 0060 to 0076)
    "967964": ["76", "00"],

    // Type 2 Knife 16 Pallete Fix 1 (00 to 16 - 8000 to 8016)
    "967970": ["16", "80"],

    // Type 2 Knife 16 Pallete Fix 2 (00 to 16 - 0060 to 0076)
    "967976": ["76", "00"],

    // Type 2 Knife 16 Pallete Fix 3 (00 to 16 - 0060 to 0076)
    "967980": ["76", "00"],


    // Bludge Spit 1 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975020": ["15", "80"],

    // Bludge Spit 1 Pallete Fix 2 (02 to 15 - 0102 to 0115)
    "975026": ["15", "01"],

    // Bludge Spit 2 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975032": ["15", "80"],

    // Bludge Spit 2 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975038": ["15", "02"],

    // Bludge Spit 2 Pallete Fix 3 (02 to 15 - 0202 to 0215)
    "975042": ["15", "02"],

    // Bludge Spit 3 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975048": ["15", "80"],

    // Bludge Spit 3 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975054": ["15", "02"],

    // Bludge Spit 4 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975060": ["15", "80"],

    // Bludge Spit 4 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975066": ["15", "02"],

    // Bludge Spit 4 Pallete Fix 3 (02 to 15 - 0202 to 0215)
    "975070": ["15", "02"],

    // Bludge Spit 5 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975076": ["15", "80"],

    // Bludge Spit 5 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975082": ["15", "02"],

    // Bludge Spit 6 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975088": ["15", "80"],

    // Bludge Spit 6 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975094": ["15", "02"],

    // Bludge Spit 7 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975100": ["15", "80"],

    // Bludge Spit 7 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975106": ["15", "02"],

    // Bludge Spit 8 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975112": ["15", "80"],

    // Bludge Spit 8 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975118": ["15", "02"],

    // Bludge Spit 9 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975124": ["15", "80"],

    // Bludge Spit 9 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975130": ["15", "02"],

    // Bludge Spit 10 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975136": ["15", "80"],

    // Bludge Spit 10 Pallete Fix 2 (02 to 15 - 0102 to 0115)
    "975142": ["15", "01"],

    // Bludge Spit 10 Pallete Fix 3 (02 to 15 - 0102 to 0115)
    "975146": ["15", "01"],

    // Bludge Spit 10 Pallete Fix 4 (02 to 15 - 0002 to 0015)
    "975150": ["15", "00"],

    // Bludge Spit 11 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975156": ["15", "80"],

    // Bludge Spit 11 Pallete Fix 2 (02 to 15 - 0202 to 0215)
    "975162": ["15", "02"],

    // Bludge Spit 11 Pallete Fix 3 (02 to 15 - 0202 to 0215)
    "975166": ["15", "02"],

    // Bludge Spit 12 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975172": ["15", "80"],

    // Bludge Spit 12 Pallete Fix 2 (02 to 15 - 0402 to 0415)
    "975178": ["15", "04"],

    // Bludge Spit 12 Pallete Fix 3 (02 to 15 - 0402 to 0415)
    "975182": ["15", "04"],

    // Bludge Spit 12 Pallete Fix 4 (02 to 15 - 0302 to 0315)
    "975186": ["15", "03"],

    // Bludge Spit 13 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975192": ["15", "80"],

    // Bludge Spit 13 Pallete Fix 2 (02 to 15 - 0002 to 0015)
    "975198": ["15", "00"],

    // Bludge Spit 13 Pallete Fix 3 (02 to 15 - 0002 to 0015)
    "975202": ["15", "00"],

    // Bludge Spit 13 Pallete Fix 4 (02 to 15 - 0302 to 0315)
    "975206": ["15", "03"],

    // Bludge Spit 13 Pallete Fix 5 (02 to 15 - 0002 to 0015)
    "975210": ["15", "00"],

    // Bludge Spit 13 Pallete Fix 6 (02 to 15 - 0302 to 0315)
    "975214": ["15", "03"],

    // Bludge Spit 14 Pallete Fix 1 (02 to 15 - 8002 to 8015)
    "975220": ["15", "80"],

    // Bludge Spit 14 Pallete Fix 2 (02 to 15 - 0002 to 0015)
    "975226": ["15", "00"],

    // Bludge Spit 14 Pallete Fix 3 (02 to 15 - 0002 to 0015)
    "975230": ["15", "00"],

    // Bludge Spit 14 Pallete Fix 4 (02 to 15 - 0002 to 0015)
    "975234": ["15", "00"],

    // Bludge Spit 14 Pallete Fix 5 (02 to 15 - 0302 to 0315)
    "975238": ["15", "03"],

    // Bludge Spit 14 Pallete Fix 6 (02 to 15 - 0302 to 0315)
    "975242": ["15", "03"],



    // Jack Pallete 1 (Original)
    "1703936":
    [
      "11", "01", "CA", "0F", "96", "0D", "64", "0A",
      "30", "07", "07", "00", "3B", "02", "7E", "04",
      "BE", "08", "EF", "0C", "B0", "0E", "70", "0B",
      "50", "08", "40", "05", "FF", "0F", "A9", "00"
    ],

    // Jack Pallete 2 (Red and Dark Brown)
    "1703968":
    [
      "11", "01", "A8", "0D", "75", "0B", "42", "08",
      "10", "05", "00", "0A", "21", "0D", "43", "0F",
      "86", "0F", "B9", "0F", "66", "07", "44", "05",
      "22", "03", "11", "02", "DC", "0F", "A9", "00"
    ],

    // Jack Pallete 3 (Black and Blue)
    "1704000":
    [
      "11", "01", "B9", "0E", "86", "0C", "53", "09",
      "20", "06", "00", "01", "22", "03", "44", "05",
      "88", "09", "BB", "0C", "69", "05", "47", "03",
      "25", "01", "13", "00", "DD", "0E", "A9", "00"
    ],

    // Jack Pallete 4 (Green and Grey)
    "1704032":
    [
      "11", "01", "CA", "0F", "96", "0D", "64", "0A",
      "30", "07", "30", "00", "61", "03", "93", "05",
      "C8", "0A", "FB", "0D", "88", "07", "55", "04",
      "33", "02", "11", "00", "FF", "0F", "A9", "00"
    ],

    // Jack Pallete 5 (Purple and Green)
    "1704064":
    [
      "11", "01", "CA", "0F", "96", "0D", "64", "0A",
      "30", "07", "13", "03", "26", "05", "5A", "07",
      "AD", "09", "DF", "0C", "86", "05", "54", "03",
      "32", "01", "11", "00", "FF", "0F", "A9", "00"
    ],

    // Jack Pallete 6 (Cyan and Purple)
    "1704096":
    [
      "11", "01", "CA", "0F", "96", "0D", "64", "0A",
      "30", "07", "44", "00", "66", "02", "99", "05",
      "CE", "08", "EF", "0C", "58", "07", "36", "05",
      "14", "03", "02", "01", "FF", "0F", "A9", "00"
    ],

    // Jack Pallete 7 (Orange and Brown)
    "1704128":
    [
      "11", "01", "CA", "0F", "96", "0D", "64", "0A",
      "30", "07", "20", "0A", "40", "0C", "72", "0F",
      "C3", "0F", "F9", "0F", "75", "09", "42", "06",
      "21", "04", "10", "02", "FD", "0F", "A9", "00"
    ],

    // Jack Pallete 8 (Pink and Wine)
    "1704160":
    [
      "11", "01", "CA", "0F", "96", "0D", "64", "0A",
      "30", "07", "01", "08", "23", "0A", "56", "0C",
      "89", "0F", "CD", "0F", "67", "09", "34", "06",
      "12", "04", "01", "02", "EE", "0F", "A9", "F0"
    ],



    // Mustapha Pallete 1 (Original)
    "1704192":
    [
      "11", "01", "87", "0E", "54", "0A", "43", "06",
      "30", "04", "50", "00", "80", "03", "C5", "06",
      "F8", "09", "FB", "0D", "FC", "0F", "E0", "0F",
      "A0", "0F", "60", "0B", "FF", "0F", "90", "0A"
    ],

    // Mustapha Pallete 2 (Black and Pink)
    "1704224":
    [
      "11", "01", "76", "0D", "43", "09", "22", "05",
      "11", "03", "12", "00", "23", "01", "45", "03",
      "78", "06", "AB", "09", "AA", "0F", "67", "0F",
      "34", "0D", "12", "0B", "FF", "0F", "90", "0A"
    ],

    // Mustapha Pallete 3 (Blue and Light Brown)
    "1704256":
    [
      "11", "01", "86", "0D", "64", "0A", "43", "07",
      "30", "05", "39", "02", "5B", "04", "7C", "06",
      "AE", "09", "DF", "0B", "CB", "0E", "98", "0B",
      "65", "08", "43", "06", "FF", "0F", "90", "0A"
    ],

    // Mustapha Pallete 4 (Gray and Orange)
    "1704288":
    [
      "11", "01", "86", "0D", "64", "0A", "43", "07",
      "30", "05", "45", "04", "67", "06", "9A", "09",
      "BC", "0B", "EF", "0E", "C9", "0F", "95", "0F",
      "63", "0E", "31", "0C", "FF", "0F", "90", "0A"
    ],

    // Mustapha Pallete 5 (Cyan and Magenta)
    "1704320":
    [
      "11", "01", "87", "0E", "54", "0B", "32", "08",
      "21", "05", "34", "01", "67", "02", "9A", "04",
      "CD", "06", "EF", "09", "CC", "0F", "9B", "0D",
      "6A", "0B", "39", "09", "FF", "0F", "A9", "00"
    ],

    // Mustapha Pallete 6 (Red and Green)
    "1704352":
    [
      "11", "01", "75", "0C", "53", "09", "32", "06",
      "20", "04", "00", "08", "10", "0B", "21", "0D",
      "43", "0F", "76", "0F", "CA", "0D", "B7", "0A",
      "93", "07", "61", "04", "FF", "0F", "A9", "00"
    ],

    // Mustapha Pallete 7 (Orange and Purple)
    "1704384":
    [
      "11", "01", "55", "0B", "33", "07", "22", "05",
      "00", "03", "30", "0B", "51", "0D", "72", "0E",
      "A6", "0F", "DA", "0F", "99", "0D", "67", "0A",
      "47", "08", "25", "05", "DD", "0F", "A9", "00"
    ],

    // Mustapha Pallete 8 (Purple and Dark Orange)
    "1704416":
    [
      "11", "01", "54", "09", "32", "06", "21", "04",
      "00", "02", "25", "04", "48", "07", "6B", "0A",
      "8E", "0D", "BF", "0F", "98", "0C", "64", "0B",
      "42", "0A", "20", "08", "DD", "0F", "A9", "00"
    ],



    // Hannah Pallete 1 (Original)
    "1704448":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "00", "05", "00", "08", "00", "0B",
      "40", "0F", "80", "0F", "FF", "0C", "DF", "0A",
      "9E", "08", "5C", "06", "FF", "0F", "A9", "00"
    ],

    // Hannah Pallete 2 (Red and Gray)
    "1704480":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "00", "03", "00", "06", "00", "09",
      "10", "0C", "32", "0E", "DE", "0D", "BB", "0A",
      "88", "07", "45", "04", "FF", "0F", "A9", "00"
    ],

    // Hannah Pallete 3 (Yellow and Blue)
    "1704512":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "10", "05", "40", "09", "80", "0C",
      "A1", "0D", "D3", "0F", "DF", "0B", "BE", "08",
      "7B", "04", "59", "02", "FF", "0F", "A9", "00"
    ],

    // Hannah Pallete 4 (Blue and Purple)
    "1704544":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "02", "01", "25", "01", "38", "02",
      "5C", "04", "7F", "06", "DE", "0F", "AC", "0D",
      "69", "0A", "37", "08", "FF", "0F", "A9", "00"
    ],

    // Hannah Pallete 5 (Purple and Pink)
    "1704576":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "02", "01", "16", "03", "28", "04",
      "4A", "06", "6B", "08", "CD", "0F", "9A", "0F",
      "46", "0E", "12", "0B", "EE", "0F", "A9", "00"
    ],

    // Hannah Pallete 6 (Green and Orange)
    "1704608":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "10", "00", "30", "00", "50", "02",
      "72", "04", "A4", "07", "CA", "0F", "97", "0F",
      "42", "0E", "11", "0B", "ED", "0F", "A9", "00"
    ],

    // Hannah Pallete 7 (Pink and Green)
    "1704640":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "02", "05", "24", "08", "46", "0B",
      "68", "0D", "9B", "0F", "EC", "0D", "D9", "09",
      "A7", "05", "75", "02", "FF", "0F", "A9", "00"
    ],

    // Hannah Pallete 8 (Black and Green)
    "1704672":
    [
      "11", "01", "CB", "0F", "A8", "0E", "75", "0B",
      "43", "08", "00", "00", "11", "01", "22", "02",
      "33", "03", "55", "05", "FD", "0E", "D9", "0B",
      "95", "06", "62", "03", "FF", "0F", "A9", "00"
    ],



    // Mess Pallete 1 (Original)
    "1704704":
    [
      "11", "01", "CA", "0F", "96", "0C", "64", "0A",
      "42", "07", "10", "05", "20", "07", "30", "09",
      "60", "0C", "80", "0F", "FA", "0E", "C8", "0A",
      "95", "06", "63", "03", "FF", "0F", "A9", "00"
    ],

    // Mess Pallete 2 (Green and Blue)
    "1704736":
    [
      "11", "01", "CA", "0F", "97", "0D", "64", "0A",
      "32", "07", "30", "01", "50", "03", "72", "05",
      "94", "07", "C7", "0A", "CF", "0A", "AF", "07",
      "7E", "04", "5C", "02", "FF", "0F", "A9", "00"
    ],

    // Mess Pallete 3 (Yellow and Gray)
    "1704768":
    [
      "11", "01", "CA", "0F", "97", "0D", "64", "0A",
      "32", "07", "30", "0A", "60", "0C", "91", "0E",
      "C2", "0F", "E7", "0F", "EF", "0D", "BC", "0A",
      "89", "07", "56", "04", "FF", "0F", "A9", "00"
    ],

    // Mess Pallete 4 (Blue and Yellow)
    "1704800":
    [
      "11", "01", "CA", "0F", "97", "0D", "64", "0A",
      "32", "07", "07", "00", "3B", "01", "5E", "03",
      "8F", "05", "BF", "08", "EA", "0F", "C6", "0F",
      "A2", "0F", "80", "0E", "FF", "0F", "A9", "00"
    ],

    // Mess Pallete 5 (Black and Orange)
    "1704832":
    [
      "11", "01", "A8", "0D", "75", "0B", "53", "09",
      "32", "07", "02", "01", "24", "03", "46", "05",
      "79", "08", "AB", "0A", "B8", "0F", "94", "0F",
      "62", "0F", "41", "0E", "EC", "0F", "A9", "00"
    ],

    // Mess Pallete 6 (Gray and Magenta)
    "1704864":
    [
      "11", "01", "CA", "0F", "97", "0D", "64", "0A",
      "32", "07", "56", "05", "78", "07", "AB", "0A",
      "CD", "0C", "EF", "0F", "CF", "0E", "9D", "0C",
      "6B", "0A", "38", "07", "FF", "0F", "A9", "00"
    ],

    // Mess Pallete 7 (Pink and Purple)
    "1704896":
    [
      "11", "01", "CA", "0F", "97", "0D", "64", "0A",
      "32", "07", "12", "0B", "34", "0C", "56", "0D",
      "89", "0E", "BC", "0F", "CF", "0D", "9E", "0A",
      "5C", "07", "2A", "04", "FF", "0F", "A9", "00"
    ],

    // Mess Pallete 8 (Red and Blue - Hannah Like)
    "1704928":
    [
      "11", "01", "CA", "0F", "97", "0D", "64", "0A",
      "32", "07", "21", "00", "32", "00", "43", "01",
      "64", "02", "86", "04", "DD", "0E", "BB", "0C",
      "88", "09", "55", "06", "FF", "0F", "A9", "00"
    ]
  }
}