def create_categores
  category_attributes.each do |attribute_hash|
    Category.create(attribute_hash)
  end
end

def create_items
  item_attributes.each do |item_attribute|
    category = Category.all.sample
    item = Item.new(item_attribute)
    item.categories << category
    item.save
  end
end

def add_items_to_categories
  15.times do
    item = Item.all.sample
    category = Category.all.sample
    item.item_categories.find_or_create_by(category_id: category.id)
    item.save
  end
end

def create_users
  user_attributes.each do |attribute_hash|
    User.create(attribute_hash)
  end
end

def user_attributes
  [{username: "rachel", first_name: "Rachel", last_name: "Warbelo", email: "demo+rachel@jumpstartlab.com", password: "password", password_confirmation: "password"},
   {username: "jeff", first_name: "Jeff", last_name: "Casimir", email: "demo+jeff@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "j3"},
   {username: "jorge", first_name: "Jorge", last_name: "Tellez", email: "demo+jorge@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "novohispano"},
   {username: "josh", first_name: "Josh", last_name: "Cheek", email: "demo+josh@jumpstartlab.com", password: "password", password_confirmation: "password", display_name: "josh", role: "admin"}]
end

def item_attributes
  [{name: '20ft Ceiling Espresso', description: "Effulgenter, caramelliest, more enveloping, nuttier", price: 39,
    overview: "We developed this espresso blend for our café on Mint Plaza in downtown San Francisco. This is a pleasant, consistent espresso – enjoyable without being demanding – plump with unremarkable complexity. What is remarkable, however, is the sweet simplicity owing to the fact that we reverse-engineered a blue-collar Italian espresso blend (yes … robusta!) and substituted higher-end organic coffees. Our goal was a robust, crema-heavy, unpretentious coffee. If the Hayes Valley espresso can be like consuming a volume of In Search of Lost Time in liquid form, then the 17ft ceiling is like flipping through the New Yorker – edifying without being taxing. The baristas at the café updose massively, set the PID two or three degrees hotter than the Hayes Valley espresso (typically 202 F on the GB5), and pull leisurely, avuncular 35 second shots, often skipping the first few drops. Served with a water back, of course.",
    details: 'Grown in a Siberian kibbutz by Argentine monks'},
   {name: 'Bella Donovan', description: 'Heavier, more comforting, exremely deeply-fruited', price: 29,
    overview: "The Bella is the wool sweater of our blends -- warm, comforting, familiar. Wild and citrusy organic African paired with earthy organic Indonesian makes for a vivid and fairly complex Moka/Java blend. It seems to weather the rigors of the automatic drip machine as well. This is, perhaps, why it's our most popular blend. It is also on the darker side: nice and thick without being inelegant. Bella stands up to milk or cream well, and is easily enjoyed black.",
    details: 'Detroit, Minneapolis, Milwaukee'},
   {name: 'Brazil FAF Santa Clara Red Catuai Natural', description: 'Praline, toffee, dried cherry', price: 37,
    overview: "In the highlands of Divinolandia, Brazil, Milton Nogueira, the esteemed producer of Santa Clara estate, cares for his red Catuai coffee variety trees with a lot of pride. When they're ready for harvest, Milton spreads them thinly on African-style drying beds, and allows them to dry for two weeks or more before removing the dried fruit. When you want (nay, need) a full and fruity coffee that you can sink your teeth into, make a cup of Santa Clara, take a seat, and let its praline, toffee, and dried cherry deliciousness sink in.",
    details: 'Certified Organic by CCOF (and Gwyneth)'},
   {name: "Burundi Kayanza Mpanga", description: 'Green apple, honey, golden raisin', price: 34,
    overview: "Jean Clément Birabereye represents a new generation of entrepreneur for Burundi—he’s working to develop a mill and cupping lab so that his team can manage the coffee from tree to port. The result of their hard work is an incredibly fresh, well-balanced cup brimming with green apple, honey, and golden raisin flavors. It’s no wonder that Mpanga recently took first place in Burundi’s Cup of Excellence.",
    details: "Gary Busy grows this in his backyard"},
   {name: 'Colombia Popayán Spring Harvest', description: 'Brown sugar, orange, fig', price: 33,
    overview: "This coffee is brought to you by the 100 members of the Asociación de Productores de Cafés Especiales del Municipio de Popayán (APROCEP) in Cauca, Colombia. The farms range from 3 to 5 hectares and mostly grow Typica and Caturra varieties. With compact rainy seasons, the area produces two distinct coffee crops per year. After picking and processing the coffee, they’re laid to rest on roof-top solar driers. The zesty orange and fig flavors of Popayán play well together, while a hint of brown sugar ties everything together like the streusel topping on a tart fruit pie.",
    details: "Just like mom used to roast"},
   {name: 'Decaf Noir', description: 'Versatile, incisive, vivid', price: 29,
    overview: "A water process decaf that is vivid and packed with flavor, Decaf Noir is made from 100% organic water processed decaffeinated beans from Mexico and Sumatra. If you drink it strong, store it carefully and use it up quickly (buy a smaller amount and try to use it up in a week), you will be rewarded with very big flavors. The decaf Noir is surprisingly (some say freakishly) versatile: about the only preparation we don’t see consistently enjoyable results in is the siphon.",
    details: "It's decaf, why are you even here?"},
   {name: 'Giant Steps', description: 'Viscous, fudgy, substantial', price: 19,
    overview: "A blend of organic coffee that is quite dark and chocolaty. Maybe a bit more one-dimensional than the Bella Donovan, but it is a good dimension. Giant Steps is delightfully fudgy and thick in a French press or drip pot, and stands up to cream quite well. If it were any heavier-bodied, you could pour it on pancakes.",
    details: "Flavor only out-weighed by the pretention of our description"},
   {name: "Hayes Valley Espresso", description: "Cocoa, orange zest, smoky finish", price: 70,
    overview: "We developed this espresso over five years ago for the launch of our Kiosk on Linden Street. This is probably our darkest espresso: lower-toned, minimal brightness, plenty of chocolate – with an engaging complexity as a straight shot. The shots are gorgeous: achingly heavy with voluptuous red-brown crema, and the silky, somewhat dangerous-looking viscosity of a power-steering stop-leak product once used on our (now departed) heroically battered 1983 Peugeot. In milk, it tastes like chocolate ovaltine, and holds its own from the daintiest 3oz Macchiato to our towering 12oz caffe latte. This is the most Brahmsian espresso we have. Brooding and autumnal, it is a coffee to mourn the passing of time.",
    details: "We price this stuff per word it takes to explain it"},
   {name: 'New Orleans Iced Kit', description: 'Sophisticated and unpretentious', price: 25,
    overview: "Our New Orleans is a sweet and thick iced coffee, cold-brewed with roasted chicory, then cut with whole milk and organic cane sugar.",
    details: "New Orleans-style iced coffee and chicory: There's been a certain amount of clamoring -- yes, clamoring! -- for a way to make our New Orleans-style Iced Coffee at home. So, here we are: a kit! We'll set you up with a pound of the coffee we use for our refreshing New Orleans-style Iced Coffee, an envelope of pre-measured, roasted French chicory, and a copy of the recipe we use -- scaled for one pound of coffee. You will need to add milk, a little sugar, and ice."},
   {name: "Opascope Espresso", description: "Fig, honey, floral, lime", price: 22,
    overview: "What’s in a name? Well, we’ve always been fans of the opascope, a beautiful tool for projecting handwriting and finely rendered artwork onto a larger surface. We could blab for hours about its quaint design, its bulky contours, its place in our childhood classrooms. But for expediency’s sake, let’s put it this way: The opascope is a tool for taking careful craftsmanship and scaling it up to a size everyone can access and enjoy. Sound familiar? Available only in the Bay Area and online, the three-component Opascope Espresso is a refreshing addition to a lineup once dominated by dense, chocolatey selections. It yields an effervescent shot, packed with stripes of tropicalia.",
    details: "Oprah recommends! (The views and opinions expressed on this site are those of the authors and do not necessarily reflect the official opinion or position of any Oprah or Oprah subsidiary.)"},
   {name: "Panama Emporium Estate Natural", description: "Blackberry, plum, tropical", price: 26,
    overview: "Panama’s Emporium Estate (the farm formerly known as Doña Berta), is handily managed by owner Graciano Cruz. Having placed in the Top 10 coffees in the annual Panama’s Best competition in past years, it’s no wonder that Emporium continues to surprise and delight us with tropical-tasting naturals. This one makes us want to book a tropical island getaway with its vibrant blackberry and plum notes.",
    details: "I'm half-way through and I'm running out of ideas"},
   {name: "Régulo de Rivas", description: "Cranberry, toasted almond, nougat", price: 19,
    overview: "A delicate drip blend composed of three Costa Rican selections, the Régulo de Rivas is a sparkly riff on our other, sturdier drip blends. Rather than picking lots with a distinct profile in mind, our coffee sourcing team (with input from our Digital team) aimed for an ever-evolving interplay of flavors. In an appropriate twist, this coffee is available for online purchase only.",
    details: "Mønti Pythøn ik den Hølie Gräilen Røtern nik Akten Di Wik Alsø wik Alsø alsø wik Wi nøt trei a høliday in Sweden this yër? See the løveli lakes The wøndërful telephøne system And mäni interesting furry animals The characters and incidents portrayed and the names used are fictitious and any similarity to the names, characters, or history of any person is entirely accidental and unintentional. Signed RICHARD M. NIXON "},
   {name: "Rwanda Nyanza Kirezi", description: "Apricot, tangerine, honey", price: 21,
    overview: "Hailing from a 2000-member cooperative in the Nyanza district, Kirezi embodies pretty much everything we love about Rwandan coffees—in fact, we love it so much that we buy all of it. Since water is such a precious resource in the region, the co-op utilizes water-efficient technology and careful monitoring to ensure the coffee’s sustainability and superior quality.",
    details: "Including the majestik møøse A Møøse once bit my sister... No realli! She was Karving her initials on the møøse with the sharpened end of an interspace tøøthbrush given her by Svenge - her brother-in-law - an Oslo dentist and star of many Norwegian møvies: 'The Høt Hands of an Oslo Dentist', 'Fillings of Passion', 'The Huge Mølars of Horst Nordfink'... We apologise for the fault in the descriptions. Those responsible have been sacked."},
   {name: "Three Africans", description: "Fruity, radiant, creamy", price: 19,
    overview: "This coffee is generally a blend of Congolese and two different Ethiopians coffees. Together, these components produce a big, chocolaty aroma and excel in just about every prep method, save espresso and siphon. Unlike some of our fancy-shmancy single origins, this blend has a very easy-to-like personality, good body, unthreatening complexity, and a reasonably clean aftertaste. The coffees—two Ethiopians, one dry-processed and one wet processed; and a wet-processed Congolese—leave subtle imprints of dried blueberries and cardamom. A fairly dark roast, this inclusive blend will take milk or cream well. Some say damn well.",
    details: "Mynd you, møøse bites Kan be pretti nasti... We apologise again for the fault in the subtitles. Those responsible for sacking the people who have just been sacked have been sacked. Møøse trained by YUTTE HERMSGERVØRDENBRØTBØRDA Special Møøse Effects OLAF PROT Møøse Costumes SIGGI CHURCHILLMøøse Choreographed by HORST PROT III Miss Taylor's Møøses by HENGST DOUGLAS-HOME Møøse trained to mix concrete and sign complicated insurance forms by JURGEN WIGG Møøses' noses wiped by BJØRN IRKESTØM-SLATER WALKER Large møøse on the left hand side of the screen in the third scene from the end, given a thorough grounding in Latin, French and 'O' Level Geography by BO BENN Suggestive poses for the Møøse suggested by VIC ROTTER Antler-care by LIV THATCHER"},
   {name: "Finca Takesi Typica", description: "Organic Bolivia", price: 38,
    overview: "At altitudes reaching 2500 m.a.s.l., Finca Takesi is the highest coffee farm in the world. Extreme temperature shifts between day and night slow cherry maturation, resulting in sweet, intense flavors of kiwi, green grape and candied ginger.",
    details: "The directors of the firm hired to continue the credits after the other people had been sacked, wish it to be known that they have just been sacked. The credits have been completed in an entirely different style at great expense and at the last minute. Executive Producer JOHN GOLDSTONE & 'RALPH' The Wonder Llama Producer MARK FORSTATER Assisted By EARL J. LLAMA MIKE Q. LLAMA III SY LLAMA MERLE Z. LLAMA IX Directed By 40 SPECIALLY TRAINED ECUADORIAN MOUNTAIN LLAMAS 6 VENEZUELAN RED LLAMAS 142 MEXICAN WHOOPING LLAMAS 14 NORTH CHILEAN GUANACOS (CLOSELY RELATED TO THE LLAMA) REG LLAMA OF BRIXTON 76000 BATTERY LLAMAS FROM 'LLAMA-FRESH' FARMS LTD. NEAR PARAGUAY and TERRY GILLIAM & TERRY JONES"},
   {name: "In Season/ Direct Trade", description: "Select Offering", price: 21,
    overview: "We will select a different single origin In Season and/or Direct Trade coffee for this offering at random intervals. We may change what’s sent out within a week or within six weeks – it’s all dependent upon what coffee we’re excited about at any given time.  Reserve offerings will not be included as a part of this program.",
    details: "Well that whole Monty Python thing took up a few items. That was nice. Have you ever seen an actual moose in the wild? I haven't but I'm looking forward to it someday. I mean, I live in Colorado now so I'm bound to see a moose at some point."},
   {name: "Organic Los Delirios", description: "Nicaragua", price: 18,
    overview: "For over a decade we've seen the Canales family develop and improve their coffee. This year's harvest sets an exciting new standard. We’re impressed by the delicately sweet flavors of cinnamon and sugar underscored by notes of pear and caramel.",
    details: "Speaking of moose, have you ever watched Northern Exposure? I love that show! It used to be on all the time when I was in college but I can't find it anywhere online. Someone should put it on Netflix."},
   {name: "Tikur Anbessa", description: "Ethiopia", price: 21,
    overview: "Named for the culturally symbolic Ethiopian Black Lion, this is our first direct relationship in the Yirgacheffe region. Distinct citrus blossom aromas precipitate flavors of white peach and honeydew melon and a resonant dark chocolate finish.",
    details: "You're still here? It's over. Go home. Go!"},
   {name: "Flecha Roja", description: "Costa Rica", price: 19,
    overview: "This season's release of Flecha Roja coincides with the ten-year anniversary of our Direct Trade relationship with Coopedota. Clean, juicy flavors of kiwi and mandarin lead to a sweet honey finish.",
    details: "Seriously there's nothing left to see here. Call your mom."},
   {name: "Matalapa", description: "El Salvador", price: 48,
    overview: "The first arrival from Central America this year, Finca Matalapa returns to the lineup earlier than ever. In the cup the coffee is sweet and light with flavors of crisp pear, honey and sweet marzipan.",
    details: "It's coffee. That is all."}]
end

def category_attributes
  [{name: 'fair trade'},
   {name: 'unfair trade'},
   {name: 'dark'},
   {name: 'light'},
   {name: 'organic'},
   {name: 'toxic'}]
end

create_categores
create_items
add_items_to_categories
create_users
