class HomeController < ApplicationController
  def index
    @person = generate_person
  end

  private


$zip_codes = [
  ["Riyadh", 11461, "Riyadh"], ["Riyadh", 11911, "Dawadmi"], ["Riyadh", 11912, "Aflaj"], ["Riyadh", 11913, "Saleel"], 
  ["Riyadh", 11914, "Ghat"], ["Riyadh", 11921, "Afeef"], ["Riyadh", 11922, "Diriyah"], ["Riyadh", 11923, "Dharmaa"], 
  ["Riyadh", 11932, "Zulfi"], ["Riyadh", 11933, "Marat"], ["Riyadh", 11941, "Hotat Bani Tameem"], ["Riyadh", 11942, "Kharj"], 
  ["Riyadh", 11952, "Majmaah"], ["Riyadh", 11953, "Thadeq"], ["Riyadh", 11961, "Shaqraa"], ["Riyadh", 11991, "Wadi Ad-Dawasir"], 
  ["Makkah", 21442, "Jeddah"], ["Makkah", 21911, "Rabegh"], ["Makkah", 21912, "Qunfudhah"], ["Makkah", 21944, "Taef"], 
  ["Makkah", 21955, "Makkah"], ["Makkah", 21961, "Leith"], ["Makkah", 21975, "Ranyah"], ["Makkah", 21982, "Turubah"], 
  ["Makkah", 21991, "Al-Lith"], ["Makkah", 21995, "Al-Qunfudhah"], ["Makkah", 21997, "Adham"],
  ["Eastern", 31146, "Dammam"], ["Eastern", 31911, "Qateef"], ["Eastern", 31932, "Dhahran"], ["Eastern", 31941, "Ras Tanurah"], 
  ["Eastern", 31951, "Jubail"], ["Eastern", 31952, "Khubar"], ["Eastern", 31971, "Khafji"], ["Eastern", 31982, "Ahssaa"], 
  ["Eastern", 31991, "Hafr Al-Baten"], ["Eastern", 31992, "Beqaiq"], ["Eastern", 31997, "Anak"], ["Eastern", 31998, "Al-Awamiyah"],
  ["Qassim", 51911, "Unaizah"], ["Qassim", 51912, "Al-Shamasia"], ["Qassim", 51921, "Al-Rass"], ["Qassim", 51922, "Oyoon Al-Jawa"], 
  ["Qassim", 51931, "Al-Maznab"], ["Qassim", 51941, "Al-Bukairiyah"], ["Qassim", 51951, "Al-Badaya"], ["Qassim", 51961, "Riyadh Al-Khabra"],
  ["Qassim", 51981, "Al-Mithnab"], ["Qassim", 51991, "Uyun Al-Jawa"],
  ["Hail", 81411, "Hail"], ["Hail", 81911, "Baqa'a"], ["Hail", 81912, "Trubah"], ["Hail", 81921, "Al-Shannan"], 
  ["Hail", 81922, "Jubbah"], ["Hail", 81931, "Al-Ghazala"], ["Hail", 81941, "Al-Hait"], ["Hail", 81951, "Moqaq"],
  ["Hail", 81971, "Samira"], ["Hail", 81991, "Al-Salaymi"],
  ["Asir", 61511, "Abha"], ["Asir", 61911, "Khamis Mushait"], ["Asir", 61921, "Ahad Rifaydah"], ["Asir", 61931, "Tanomah"],
  ["Asir", 61941, "Sarat Abidah"], ["Asir", 61951, "Rijal Alma"], ["Asir", 61961, "Mahalah"], ["Asir", 61981, "Al-Majardah"],
  ["Asir", 61991, "Balqarn"], ["Asir", 61992, "Bariq"],
  ["Jizan", 82511, "Jizan"], ["Jizan", 82911, "Abu Arish"], ["Jizan", 82921, "Baish"], ["Jizan", 82931, "Sabya"],
  ["Jizan", 82941, "Ad-darb"], ["Jizan", 82951, "Samtah"], ["Jizan", 82961, "Al-Ahad"], ["Jizan", 82971, "Al-Harth"],
  ["Jizan", 82981, "Al-Tawal"], ["Jizan", 82991, "Damad"], ["Jizan", 82992, "Farasan"], ["Jizan", 82993, "Al-Aridah"],
  ["Jizan", 82994, "Al-Idabi"], ["Jizan", 82995, "Al-Dair"],
  ["Madinah", 42511, "Madinah"], ["Madinah", 42911, "Yanbu"], ["Madinah", 42921, "Badr"], ["Madinah", 42931, "Al-Hinakiyah"],
  ["Madinah", 42941, "Mahd Al-Thahab"], ["Madinah", 42951, "Al-Ais"], ["Madinah", 42961, "Wadi Al-Far'a"], ["Madinah", 42971, "Khaybar"],
  ["Madinah", 42981, "Al-Muwayh"], ["Madinah", 42991, "Yanbu Al-Nakhl"],
  ["Tabouk", 71911, "Tabouk"], ["Tabouk", 71921, "Duba"], ["Tabouk", 71931, "Haql"], ["Tabouk", 71941, "Al-Wajh"],
  ["Tabouk", 71951, "Umluj"], ["Tabouk", 71961, "Al-Bidaa"], ["Tabouk", 71971, "Tayma"], ["Tabouk", 71981, "Al-Akhdar"],
  ["Tabouk", 71991, "Halat Ammar"], 
  ["Najran", 77111, "Najran"], ["Najran", 77151, "Sharorah"], ["Najran", 77167, "Habuna"], ["Najran", 77185, "Badr Al-Janub"],
  ["Najran", 77197, "Yadamah"], ["Najran", 77211, "Al-Kharkhir"], ["Najran", 77241, "Thar"], ["Najran", 77275, "Al-Wadiah"],
  ["Al-Baha", 65511, "Al-Baha"], ["Al-Baha", 65911, "Baljurashi"], ["Al-Baha", 65931, "Al-Mandaq"], ["Al-Baha", 65951, "Al-Aqiq"],
  ["Al-Baha", 65971, "Al-Qura"], ["Al-Baha", 65991, "Al-Mukhwah"],
  ["Al-Jouf", 75511, "Sakaka"], ["Al-Jouf", 75911, "Dumat Al-Jandal"], ["Al-Jouf", 75931, "Qurayyat"], ["Al-Jouf", 75951, "Tabarjal"],
  ["Al-Jouf", 75971, "Arar"], ["Al-Jouf", 75991, "Rafha"],
  ["Northern Borders", 91351, "Rafha"], ["Northern Borders", 91371, "Arar"], ["Northern Borders", 91431, "Turaif"],
  ["Northern Borders", 91471, "Al-Uwayqilah"], ["Northern Borders", 91491, "Al-Qurayyat"]
]

$streets = [
  "King Fahd Road", "King Abdullah Road", "Prince Sultan Road", "King Abdulaziz Road", "King Salman Road",
  "Prince Mohammed bin Salman Road", "Prince Nayef Road", "King Khaled Road", "King Faisal Road", "Prince Saud Al-Faisal Road",
  "Al-Madinah Al-Munawarah Road", "Al-Haram Road", "Makkah Al-Mukarramah Road", "Al-Batha Road", "Al-Siteen Road",
  "Imam Saud bin Faisal Road", "King Saud Road", "Prince Majed Road", "Al-Imam Muhammad Ibn Saud Road", "Al-Malaz Road",
  "Al-Takhasusi Road", "Al-Takhassusi Street", "Abi Bakr As-Siddiq Road", "Umar Ibn Al-Khattab Road", "Othman bin Affan Road",
  "Al-Olaya Road", "Al-Orouba Road", "Al-Mather Road", "Al-Maather Road", "King Abdul Aziz Road", "Prince Turki Road",
  "Imam Abdullah bin Saud Road", "Al-Shifa Street", "Al-Rawdah Street", "Al-Andalus Street", "Al-Suwaidi Street", 
  "Al-Nakheel Street", "Al-Nuzha Street", "Al-Yarmouk Street", "Al-Nahda Street", "Al-Rabwah Street", "Al-Rayyan Street", 
  "Al-Aqeeq Street", "Al-Quds Street", "Al-Sahafa Street", "Al-Mughrizat Street", "Al-Waha Street", "Al-Andalus Street", 
  "Al-Amal Street", "Al-Fayha Street", "Al-Wadi Street", "Al-Hamra Street", "Al-Malqa Street", "Al-Narjis Street", 
  "Al-Noor Street", "Al-Salam Street", "Al-Taawun Street", "Al-Mohammadiyah Street", "Al-Faisaliyah Street", "Al-Jawhara Street", 
  "Al-Khaleej Street", "Al-Kindi Street", "Al-Murabba Street", "Al-Murjan Street", "Al-Nakhil Street", "Al-Naseem Street", 
  "Al-Qadsiyah Street", "Al-Rahmaniyah Street", "Al-Rawabi Street", "Al-Rimal Street", "Al-Sadeeq Street", "Al-Safa Street", 
  "Al-Sahab Street", "Al-Sulaimaniyah Street", "Al-Tawfiq Street", "Al-Thaghr Street", "Al-Thamir Street", "Al-Thaqafah Street", 
  "Al-Uqair Street", "Al-Wurud Street", "Al-Yamamah Street", "Al-Zahra Street", "Al-Zuhour Street", "Ar Rahmaniyah Street", 
  "Ash Shumookh Street", "Ash Shurooq Street", "Az Zahra Street", "Az Zuhoor Street", "East Circle Road", 
  "Imam Ali bin Abi Talib Street", "North Circle Road", "Prince Abdulaziz bin Musaed Street", "Prince Mishal bin Abdulaziz Street", 
  "Prince Talal Street", "Qurtubah Street", "Riyadh-Dammam Road", "Riyadh-Makkah Road", "Salahuddin Al-Ayoubi Street", 
  "Sari Street", "South Circle Road", "Tareq bin Ziyad Street", "University Street", "West Circle Road", "Al-Imam Ali Road", 
  "Al-Bukhary Street", "Al-Farouq Omar ibn Al-Khattab Street", "Al-Hijaz Road", "Al-Iman Road", "Al-Jazeerah Street", 
  "Al-Karama Street", "Al-Khansa Street", "Al-Marwah Street", "Al-Misk Street", "Al-Muhajirin Street", "Al-Mukarramah Street", 
  "Al-Mumtaz Street", "Al-Nada Street", "Al-Naqeel Street", "Al-Nuzhah Street", "Al-Qasim Street", "Al-Quds Street", 
  "Al-Sabeel Street", "Al-Sail Street", "Al-Shaqra Street", "Al-Shorouq Street", "Al-Sulay Street", "Al-Waha Street", 
  "Al-Watan Street", "Al-Aziziyah Street", "Al-Fakhiriyah Street", "Al-Firdous Street", "Al-Nahdah Street", "Al-Nasriyah Street",
  "Al-Qasr Street", "Al-Rabiah Street", "Al-Safa Street", "Al-Safwa Street", "Al-Salam Street", "Al-Seef Street",
  "Al-Wafa Street", "Ar Rawabi Street", "Ar Rayan Street", "Al-Arid Street", "Al-Malaz Street", "Al-Manakh Street", 
  "Al-Maseef Street", "Al-Maseela Street", "Al-Shula Street", "Al-Wizarat Street", "Hail Street", "Jarir Street", 
  "Okaz Street", "Uhud Street", "King Abdulrahman Road", "Al-Kharj Road", "Prince Muqrin Road", "Prince Ahmed bin Abdulaziz Road",
  "Prince Turki Al-Awwal Road", "King Saud bin Abdulaziz Road", "Al-Ihsaa Street", "Al-Qatif Street", "Al-Taif Street",
  "Aseer Street", "Jizan Street", "Najran Street", "Al-Jawf Street", "Al-Zulfi Street"
]

$male_names = [
  "mohammed", "ahmed", "saud", "abdullah", "abdulelah", "abdulaziz", "ibrahim", "omar", "osama", "ismael",
  "saleh", "salman", "sultan", "rakan", "rayan", "eyad", "nawaf", "nasser", "naif", "majed",
  "mohannad", "yasser", "yahya", "yousef", "tariq", "talal", "turki", "thamir", "jawad", "jaber",
  "hasan", "husain", "haitham", "hamza", "hani", "hammad", "hadi", "khalid", "khaled", "khalil",
  "raed", "rashed", "rashid", "rami", "ramzi", "ragheb", "raji", "rajeh", "zaid", "ziad",
  "ziyad", "zahir", "zaheer", "zubair", "zaki", "zakaria", "sabir", "saber", "sami", "samir",
  "sameer", "samer", "saad", "sadiq", "sadeq", "saqr", "salem", "salim", "samer", "sari",
  "sarie", "saif", "saifuldeen", "shadi", "shaker", "shaheen", "shaya","shakir", "shukri",
"safwan", "sabir", "sohail", "suhail", "suhaib", "sulaiman", "salah", "salim", "sameh", "samir",
"sami", "saqr", "saud", "safi", "sajid", "sakher", "saleem", "samer", "samir", "sayed",
"taha", "tamer", "taher", "tariq", "tawfiq", "tayseer", "taymoor", "turki", "tammam", "thabit",
"thamer", "thani", "wadee", "wael", "waheeb", "waheed", "waleed", "waseem", "wajdi", "wajdy",
"yehya", "yasser", "yamin", "yaqoob", "yasin", "yasir", "younis", "yousef", "youssef", "yousuf",
"yousif", "yousri", "yousry", "yehia", "yousif", "yaqoob", "yousef", "yasser", "yahya", "yaman",
"yanal", "yazen", "yousuf", "yahia", "younis", "yaseen", "yehya", "yassin", "yousuf", "yahya",
"amjad", "ammar", "amro", "anas", "anwar", "aqeel", "amer", "amir", "ashraf", "asim",
"atmaan", "atef", "adham", "adel", "adham", "adnan", "afif", "akram", "alaa", "ali",
"ali", "ameen", "amjad", "arafat", "aref", "arif"
]

$female_names = [
"noor", "sarah", "salma", "mariam", "maryam", "amal", "amani", "ahlam", "abeer", "afaf",
"afnan", "arwa", "aisha", "alaa", "alya", "aya", "ayat", "iman", "amira", "asma",
"aseel", "asmaa", "azeeza", "aziza", "badria", "basma", "basima", "bushra", "buthaina", "dalal",
"daad", "dalia", "dana", "dania", "danya", "deema", "dina", "doa", "duaa", "dunya",
"eman", "esraa", "ethar", "farah", "fareeda", "faten", "fatin", "fatma", "faiza", "fayza",
"feryal", "fida", "galila", "ghada", "ghadah", "ghadeer", "ghalia", "hadir", "hadeel", "hala",
"hana", "hanaa", "hanan", "haneen", "haya", "hayat", "heba", "hibah", "hind", "huda",
"hagar", "hala", "halima", "hameeda", "hana", "hanin", "hasna", "hawa", "hawraa", "haya",
"hefaa", "hesa", "hessa", "hiba", "hoda", "houda", "huda", "hyam", "inas", "islam",
"isra", "israa", "ithar", "jala", "jalila", "jana", "jihan", "joumana", "joud", "jouri",
"judy", "kafa", "kawthar", "khadija", "khalda", "lamia", "lamis", "lamya", "lana", "layal",
"layla", "layan", "leen", "leena", "lina", "lojain", "lubna", "leen", "maha", "maha",
"mahasen", "maisa", "manal", "manar", "maram", "mariam", "marwa", "maha", "maram", "mariam",
"maryam", "mariam", "majd", "majda", "malak", "manal", "manar", "maram", "marwa", "maryam",
"maha", "maram", "maryam", "maryam", "mariam", "marah", "marwa", "maha", "maisa", "malak",
"manal", "maram", "mariam", "maryam", "marwa", "maha", "maram", "maysoon", "maysaa", "maysa",
"maysam", "mena", "menna", "mervat", "mona", "muna", "munira", "nada", "nadia", "nadine",
"nahla", "najah", "najat", "najla", "najwa", "nashwa", "nawal", "nayla", "nesma", "nesreen",
"nidal", "nora", "noha", "noor", "noura", "nuha", "nura", "ola", "omayma", "omaima", 
"raeda", "rafa", "rafif", "raghad", "rahaf", "rana", "rand", "raneem", "rania", "rasha",
"raseel", "rasheeda", "razan", "rawan", "rayya", "reem", "reema", "rehab", "rida", "riham",
"rim", "roaa", "roula", "ruba", "rufaida", "ruqayya", "saba", "sabah", "sahar", "sahra",
"sajida", "salam", "salma", "salwa"
]

$last_names = [
"Al-Ghamdi", "Al-Zahrani", "Al-Dossari", "Al-Otaibi", "Al-Shehri", "Al-Harthi", "Al-Amri", "Al-Malki", "Al-Qahtani",
"Al-Rehaili", "Al-Ghamdi", "Al-Zahrani", "Al-Asmari", "Al-Omairi", "Al-Anazi", "Al-Bishi", "Al-Shammari", "Al-Harbi",
"Al-Haqbani", "Al-Johani", "Al-Sulami", "Al-Yami", "Al-Zahim", "Al-Otaibi", "Al-Shehri", "Al-Qurashi", "Al-Tamimi",
"Al-Osaimi", "Al-Hazmi", "Al-Subaie", "Al-Omari", "Al-Asiri", "Al-Qahtani", "Al-Zahrani", "Al-Ghamdi", "Al-Malki",
"Al-Otaibi", "Al-Anazi", "Al-Dossari", "Al-Shammari", "Al-Harbi", "Al-Amri", "Al-Zahim", "Al-Yami", "Al-Qurashi",
"Al-Omari", "Al-Johani", "Al-Shehri", "Al-Qahtani", "Al-Sulami", "Al-Omairi", "Al-Malki", "Al-Zahrani", "Al-Anazi",
"Al-Haqbani", "Al-Bishi", "Al-Subaie", "Al-Asiri", "Al-Hothali", "Al-Hothli", "Al-Hazmi", "Al-Thaqafi", "Al-Mutairi",
"Al-Shammari", "Al-Ghamdi", "Al-Harbi", "Al-Zahrani", "Al-Malki", "Al-Amri", "Al-Otaibi", "Al-Omari", "Al-Qahtani",
"Al-Johani", "Al-Shehri", "Al-Qurashi", "Al-Tamimi", "Al-Osaimi", "Al-Haqbani", "Al-Zahim", "Al-Yami", "Al-Sulami",
"Al-Omairi", "Al-Shammari", "Al-Hazmi", "Al-Thaqafi", "Al-Mutairi", "Al-Anazi", "Al-Dossari", "Al-Bishi", "Al-Subaie",
"Al-Amri", "Al-Hajri", "Al-Hajri", "Al-Hilali", "Al-Hakami", "Al-Hariri", "Al-Hawsawi", "Al-Hudhaili", "Al-Husseini",
"Al-Idrissi", "Al-Jabri", "Al-Juhani", "Al-Khayyat", "Al-Khuzaie", "Al-Lihyani", "Al-Maghrabi", "Al-Mahmoudi",
"Al-Majed", "Al-Malak", "Al-Marhabi", "Al-Marwani", "Al-Mashat", "Al-Masoud", "Al-Matari", "Al-Mehaini", "Al-Mezaini",
"Al-Mubarak", "Al-Mubaraki", "Al-Muhaimeed", "Al-Mulhim", "Al-Mutlaq", "Al-Nabhani", "Al-Nafe", "Al-Nafea", "Al-Nafisah",
"Al-Nuaimi", "Al-Nufaie", "Al-Obaidi", "Al-Obaid", "Al-Omar", "Al-Onazi", "Al-Othaim", "Al-Qaisi", "Al-Qaisi",
"Al-Qasem", "Al-Qasim", "Al-Radi", "Al-Radwan", "Al-Rashed", "Al-Rasheed", "Al-Rashid", "Al-Rashoudi", "Al-Rifai",
"Al-Saad", "Al-Saadi", "Al-Saati", "Al-Saeed", "Al-Saeedi", "Al-Sahn", "Al-Sahli", "Al-Sahli", "Al-Sakran",
"Al-Saleh", "Al-Salman", "Al-Samhan", "Al-Sanea", "Al-Sanie", "Al-Sebaei", "Al-Sehli", "Al-Shahrani", "Al-Shahri",
"Al-Shammari", "Al-Shareef"
]


  def generate_person
    def address_generator(rand_address, choose)
      case choose
      when 1
        rand_address[0]
      when 2
        rand_address[1].to_s
      when 3
        rand_address[2].to_s
      end
    end

    def gender_generator
      rand(100) >= 50 ? "male" : "female"
    end

    def name_generator(gender)
      if gender == "male"
        "#{$male_names.sample} #{$male_names.sample} #{$last_names.sample}"
      else
        "#{$female_names.sample} #{$male_names.sample} #{$last_names.sample}"
      end
    end

    def street_generator
      $streets.sample
    end

    def id_generator
      "1" + rand(2).to_s + Array.new(8) { rand(10).to_s }.join
    end

    rand_address = $zip_codes.sample
    gender = gender_generator
    fullname = name_generator(gender)
    age = rand(15..65).to_s
    region = address_generator(rand_address, 1)
    zip_code = address_generator(rand_address, 2)
    province = address_generator(rand_address, 3)
    street = street_generator
    id = id_generator

    {
      fullname: fullname,
      gender: gender,
      id: id,
      age: age,
      region: region,
      zip_code: zip_code,
      province: province,
      street: street,
      full_address: "#{region}, #{zip_code}, #{province}, #{street}"
    }
  end
end