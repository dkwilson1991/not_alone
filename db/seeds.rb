require "open-uri"

puts "Destroying all users..."
User.destroy_all
puts "Destroying all Assignments..."
Assignment.destroy_all
puts "Destroying all Camps..."
Camp.destroy_all

location = ["Japan, Tokyo", "Chile, Santiago", "Costa, Rica", "Havana, Cuba", "Iraq Bagdad", "Canada Ottawa", "Ukraine, Kyiv", "Spain, Madrid", "Philippines, Manila", "Tunisia, Tunis"]
email = ['savi@not-alone.online', 'keita@not-alone.online', 'yulia@not-alone.online', 'ayhem@not-alone.online']
training = ["None", "1 Day", "3 Days"]
roles = ["Camp Director", "Station Leader", "Crew Leader", "Game", "Story telling", "Songs", "Snacks", "Crafts"]
date = Faker::Date.between(from: 'July 1, 2022', to: 'Feb 1, 2023')

admin = User.where(admin_status: true)

# camps = [
#   {
#     description: "Możesz pomóc już teraz! Weź udział w szkoleniu - pomóż dzieciom!
#     Szkolenie przygotuje Cię do udzielania pierwszej pomocy psychologicznej dzieciom dotkniętym wojną.
#     Wszystko, co dzieje się z dzieckiem po doświadczeniu stresu, nagłej zmiany okoliczności życiowych jest normalną reakcją na nienormalną sytuację. Ale wszystkie dzieci potrzebują pomocy po doświadczeniu traumy!
#     OperationSAFE to program zajęć dla dzieci 6-12 lat, który pomaga prowadzić dzieci do emocjonalnego uzdrowienia, rozwijając u nich odporność na traumatyczne przeżycia oraz ucząc znaleźć ukojenie w sytuacji chaosu.",
#     images: "poland.jpeg",
#     comments: "none",
#     camp_name: "OpSAFE camp in Poland",
#     newsfeed_post: 'Miło jest wspomnieć szkolenie OpSAFE w Mińsku Mazowieckim. Tak duża grupa była dla nas nie lada wyzwaniem!
#     Dużo było spisanych kartek, dużo dyskusji, trochę łez wzruszenia, ale dużo też uśmiechu i wdzięczności.
#     Dziękujemy Inna Karpenko za zaproszenie i pomoc w organizacji. Bardzo dziękujemy Svetlana Popovych i Sofii za nakarmienie 100 osób oraz opiekę nad dziećmi 🙂 I serdecznie dziękujemy OM w Polsce za realizację takich spotkań jak to!
#     Pięknie dziękujemy wszystkim za udział i cieszymy się, że już za chwilę zaczynacie zajęcia OpSAFE z dziećmi w Mińsku Mazowieckim i okolicach!
#     Jesteśmy z Wami 🫶'
#   },


#   {
#     description: "During war in Ukraine we need volunteers to help kinds.",
#     images: "ukraine1.jpeg",
#     comments: "none",
#     camp_name: "OpSAFE camp in Ukraine",
#     newsfeed_post: "We are seeing some really great results from the camps in Ukraine.  With seven out of ten camps reporting, we found 37 out of 145 children were 'at risk' with more severe post-traumatic stress symptoms than their peers. What was wonderful was that 20 of these children made enough progress that their symptoms were similar to their peers by the end of the camp. The remaining 17 still had more severe symptoms than their peers, but all of them showed substantial improvement.
#     Of the 108 children who exhibited mild PTSS, 80 showed significant improvement in their symptoms, and 25 did not primarily because their initial symptoms were very mild leaving not much room for improvement. 3 of these children showed a slight regression.
#     By the end of the camps, none of the children were flagged as being exceptionally at risk in comparison with their peers. Continued support from friends and community should see continued progress in children's resilience to trauma.
#     Thank you for your support for Ukrainian Christians making a difference in children's lives."
#   },

#   {
#     description: "OpSAFE camps are continuing in Ukraine! Keep praying for these children and hundreds more who are being helped to feel safe, important, empowered, loved, and hopeful.",
#     images: "ukraine2.jpeg",
#     comments: "none",
#     camp_name: "OpSAFE camp in Ukraine",
#     newsfeed_post: "今週はウクライナにおいて10個のプログラムキャンプが行われます。
#     ここに養育者の方やボランティアの方から送られてきたレポートを分かち合います。
#     ある養育者の方から
#     「私の息子は8歳です。彼はいつもキャンプや他のイベントに参加するのは嫌だと言って泣いていました。でも今日はオペレーションセイフのキャンプが最後の日であると泣いています。私は本当にびっくりしています。私が彼にキャンプでは何をしているのと聞いたとき、彼はこのように答えました。「神様についてだよ。」これは彼が初めてキリスト教に対して興味を持った事でした。ありがとう。」
#     ある養育者の方から
#     「私は私の息子が変化したことに気づきました。息子はもっと喜びにあふれ、そして、いつも笑顔を向けてくれるようになりました。友達を作ることに対してももっと勇気を持つようになったし、特に彼はクラフトが好きで、クラフトを通して子供たちと良い関係を結びました。私の息子をケアして下さって本当にありがとうございます。」
#     ある養育者の方から
#     「私の子供に大きな変化があることに気づきました。彼はとても活発になったし、オープンにもなり、感情を表してくれるようになりました。いろいろなことを考えることに対しても恐れを抱くことなく、そして、いろいろなことに対して目を向けるようになりました。彼はリーダーやクラフト、このキャンプのことをとても愛していています。」
#     ある養育者の方から
#     「私は私の子供にとても良い影響があったの見ることができています。彼女はウクライナで行われているレッスンにオンラインで参加していましたが、ポーランドでは一人ぼっちでした。でも今彼女は家のそばにたくさん友達を持つ見つけて、それを喜んでいます。」
#     あるボランティアの方から
#     「ある男の子は1日目にキャンプにやってきました。けれども彼はどんなイベントにも参加したくないと言っていました。彼は本当にに一匹狼だったのです。しかし、3日目、彼は私たちのキャンプではとてもアクティブな男の子の1人となり、そして、最後の日には一人ひとりのリーダーにハグをしてくれました。その後、日曜学校に来てくれました。私たちは彼を再び見ることができて本当に嬉しいです。実際に、オペレーションセイフのキャンプの後、日曜学校の子供たちの人数は2倍になりました。」
#     あるボランティアから
#     「私はこれが子供を守るプログラムであることを知っていますが、実際に、このプログラムは、私が必要とされていること、そして、愛されていることを知るためにとても役立ったプログラムでした。」"
#   },

#   {
#     description: "It was a fire in Quezon City, Philippines literally just down the street from our partners the Philippine Children's Ministry Network.  The fire affected 100 families with 140 children and OpSAFE trained volunteers are already responding to bring hugs, help and hope to the children.  Please pray for these volunteers and the children they are serving. " ,
#     images: "philippines1.png",
#     comments: "You should have excperions of working with kids",
#     camp_name: "Camp in Philippine",
#     newsfeed_post: "An Opsafe camp reaches  to 51 children affected by the fire in Pajo St., Project 2, QC. Church of Praise lead the team of station leaders from  PCMN staff. The crew leaders and volunteers' food were supplied by Pajo Outreach Church. The venue was lent by Community Bible Church. It took the unity of 3 churches and PCMN to respond to the psycho-social trauma debriefing camp for these children. Praise God for the unity of believers!"
#   },
#   {
#     description: "Day 5 of the #OpSAFECamp of Ilog Baptist Church with almost 50 children. It was another afternoon of fun and learning. Through the story of the main character - Pete the Penguin, and the character of the day - Cory the Polar Bear, the children learned the message that #YouAreLoved therefore they should  #FearNot. Each child received the message of love and hope through the stories of Pete's Adventure and from the Bible, crafts, games and snacks.
#     Praise God for the lives of these volunteers who shared their time and talents that facilitated the successful implementation:
#     Thank you also to the support of the leadership of IBC thru Pastor Ninfa Espina - Senior Pastor and Mrs. Gyceria Paglumotan - Chairperson of the BOT.
#     This initiative is in partnership with the Alliance of Children's Ministries in Negros (ACMN) thru its Post Disaster Response Project in Ilog and Kabankalan. Funding support comes from the Philippine Children's Ministries Network, Inc., Viva, Global Care Kinderhilfswerk, and Aktion Deutschland Hilft.",
#     images: "nepal.jpeg",
#     comments: "none",
#     camp_name: "Alliance of Children's Ministries in Negros",
#     newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
#     As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
#     Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
#     We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
#     Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
#     We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
#     My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
#     Thank you for praying and encouraging me during this time of research."
#   },

#   {
#     description: "Typhoon Odette Response and Early Recovery.
#     4Days now in St Bernard, Southern Leyte.
#     - trained 15 Youth volunteers on MHPSS, CFS, CPIE and OPSAFE Camp
#      - rolled out 3 sessions of OPSAFE CAMP to 100 children. 100 plus more children coming.
#      - assessed target Communities identified as Most Affected and Most Vulnerable communities: Malibago, Sitio Maria Soccoro, Brgy San Isidro, and Brgu Lipanto, St Bernard. Courtesy with Brgy Officials of Malibago; conducted FGDs with Fisherfolks and their families in Ma. Soccoro, and field visit and interview in Brgy Lipanto. Join us pray as we lift these communities to God for His plans,help and interventions thru us - His people.
#     Thanks to all who sponsored and extended their help.
#     Needs
#     1. MHPSS is needed for children and adults as well
#     2. Safe Food Package
#     3. Shelter kits
#     4. Feeding
#     5. Hygiene kit
#     6. Kitchen kit
#     7. Committed volunteers ready to respond
#     Thanks for all your support and prayers. ",
#     images: "philippines.jpeg",
#     comments: "none",
#     camp_name: "Camp in St Bernard, Southern Leyte.",
#     newsfeed_post: "A month ago a late-season super typhoon struck the Philippines doing great damage across the Visayas. Super Typhoon Odette (known internationally as Rai) has been ranked as the 3rd costliest storm in Philippine history.
#     OpSAFE International has been working in this region since 2013 training communities how to care for the emotional needs of children who have experienced mass trauma. Two partners are conducting training in South Leyte and Negros Occidental in response to Typhoon Odette.
#     Pray for Gintong Aral (Jackson Toledo Natividad) and the Philippine Children's Ministry Network (Fe Adul Foronda) as they lead these efforts and pray for the children and communities that will be strengthened after the disaster."
#   },

#   {
#     description: "After the devastating earthquake, thousands of homes and schools across 14 districts were destroyed,
#     forcing people to take shelter in open grounds. In Kathmandu city, most of the mid-city dwellers
#     congregated in Tundikhel - the large parade ground - and within a week Tundikhel had become a tented city.
#     In the first week itself, UNICEF and partners set up a child-friendly space made of bamboo and
#     tarpaulin in Tundikhel.",
#     images: "nepal2.jpeg",
#     comments: "none",
#     camp_name: "UNICEF tent in Nepal",
#     newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
#     As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
#     Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
#     We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
#     Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
#     We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
#     My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
#     Thank you for praying and encouraging me during this time of research."
#   },
#   {
#     description: "Możesz pomóc już teraz! Weź udział w szkoleniu - pomóż dzieciom!
#     Szkolenie przygotuje Cię do udzielania pierwszej pomocy psychologicznej dzieciom dotkniętym wojną.
#     Wszystko, co dzieje się z dzieckiem po doświadczeniu stresu, nagłej zmiany okoliczności życiowych jest normalną reakcją na nienormalną sytuację. Ale wszystkie dzieci potrzebują pomocy po doświadczeniu traumy!
#     OperationSAFE to program zajęć dla dzieci 6-12 lat, który pomaga prowadzić dzieci do emocjonalnego uzdrowienia, rozwijając u nich odporność na traumatyczne przeżycia oraz ucząc znaleźć ukojenie w sytuacji chaosu.",
#     images: "poland.jpeg",
#     comments: "none",
#     camp_name: "OpSAFE camp in Poland",
#     newsfeed_post: 'Miło jest wspomnieć szkolenie OpSAFE w Mińsku Mazowieckim. Tak duża grupa była dla nas nie lada wyzwaniem!
#     Dużo było spisanych kartek, dużo dyskusji, trochę łez wzruszenia, ale dużo też uśmiechu i wdzięczności.
#     Dziękujemy Inna Karpenko za zaproszenie i pomoc w organizacji. Bardzo dziękujemy Svetlana Popovych i Sofii za nakarmienie 100 osób oraz opiekę nad dziećmi 🙂 I serdecznie dziękujemy OM w Polsce za realizację takich spotkań jak to!
#     Pięknie dziękujemy wszystkim za udział i cieszymy się, że już za chwilę zaczynacie zajęcia OpSAFE z dziećmi w Mińsku Mazowieckim i okolicach!
#     Jesteśmy z Wami 🫶'
#   },

#   {
#     description: "During war in Ukraine we need volunteers to help kinds.",
#     images: "ukraine3.jpeg",
#     comments: "none",
#     camp_name: "OpSAFE camp in Ukraine",
#     newsfeed_post: "We are seeing some really great results from the camps in Ukraine.  With seven out of ten camps reporting, we found 37 out of 145 children were 'at risk' with more severe post-traumatic stress symptoms than their peers. What was wonderful was that 20 of these children made enough progress that their symptoms were similar to their peers by the end of the camp. The remaining 17 still had more severe symptoms than their peers, but all of them showed substantial improvement.
#     Of the 108 children who exhibited mild PTSS, 80 showed significant improvement in their symptoms, and 25 did not primarily because their initial symptoms were very mild leaving not much room for improvement. 3 of these children showed a slight regression.
#     By the end of the camps, none of the children were flagged as being exceptionally at risk in comparison with their peers. Continued support from friends and community should see continued progress in children's resilience to trauma.
#     Thank you for your support for Ukrainian Christians making a difference in children's lives."
#   },

#   {
#     description: "OpSAFE camps are continuing in Ukraine! Keep praying for these children and hundreds more who are being helped to feel safe, important, empowered, loved, and hopeful.",
#     images: "ukraine1.jpeg",
#     comments: "none",
#     camp_name: "OpSAFE camp in Ukraine",
#     newsfeed_post: "今週はウクライナにおいて10個のプログラムキャンプが行われます。
#     ここに養育者の方やボランティアの方から送られてきたレポートを分かち合います。
#     ある養育者の方から
#     「私の息子は8歳です。彼はいつもキャンプや他のイベントに参加するのは嫌だと言って泣いていました。でも今日はオペレーションセイフのキャンプが最後の日であると泣いています。私は本当にびっくりしています。私が彼にキャンプでは何をしているのと聞いたとき、彼はこのように答えました。「神様についてだよ。」これは彼が初めてキリスト教に対して興味を持った事でした。ありがとう。」
#     ある養育者の方から
#     「私は私の息子が変化したことに気づきました。息子はもっと喜びにあふれ、そして、いつも笑顔を向けてくれるようになりました。友達を作ることに対してももっと勇気を持つようになったし、特に彼はクラフトが好きで、クラフトを通して子供たちと良い関係を結びました。私の息子をケアして下さって本当にありがとうございます。」
#     ある養育者の方から
#     「私の子供に大きな変化があることに気づきました。彼はとても活発になったし、オープンにもなり、感情を表してくれるようになりました。いろいろなことを考えることに対しても恐れを抱くことなく、そして、いろいろなことに対して目を向けるようになりました。彼はリーダーやクラフト、このキャンプのことをとても愛していています。」
#     ある養育者の方から
#     「私は私の子供にとても良い影響があったの見ることができています。彼女はウクライナで行われているレッスンにオンラインで参加していましたが、ポーランドでは一人ぼっちでした。でも今彼女は家のそばにたくさん友達を持つ見つけて、それを喜んでいます。」
#     あるボランティアの方から
#     「ある男の子は1日目にキャンプにやってきました。けれども彼はどんなイベントにも参加したくないと言っていました。彼は本当にに一匹狼だったのです。しかし、3日目、彼は私たちのキャンプではとてもアクティブな男の子の1人となり、そして、最後の日には一人ひとりのリーダーにハグをしてくれました。その後、日曜学校に来てくれました。私たちは彼を再び見ることができて本当に嬉しいです。実際に、オペレーションセイフのキャンプの後、日曜学校の子供たちの人数は2倍になりました。」
#     あるボランティアから
#     「私はこれが子供を守るプログラムであることを知っていますが、実際に、このプログラムは、私が必要とされていること、そして、愛されていることを知るためにとても役立ったプログラムでした。」"
#   },

#   {
#         description: "It was a fire in Quezon City, Philippines literally just down the street from our partners the Philippine Children's Ministry Network.  The fire affected 100 families with 140 children and OpSAFE trained volunteers are already responding to bring hugs, help and hope to the children.  Please pray for these volunteers and the children they are serving. " ,
#     images: "philippines3.jpeg",
#     comments: "You should have excperions of working with kids",
#     camp_name: "Camps in Philippine",
#     newsfeed_post: "An Opsafe camp reaches  to 51 children affected by the fire in Pajo St., Project 2, QC. Church of Praise lead the team of station leaders from  PCMN staff. The crew leaders and volunteers' food were supplied by Pajo Outreach Church. The venue was lent by Community Bible Church. It took the unity of 3 churches and PCMN to respond to the psycho-social trauma debriefing camp for these children. Praise God for the unity of believers!"
#   },
#   {
#     description: "Day 5 of the #OpSAFECamp of Ilog Baptist Church with almost 50 children. It was another afternoon of fun and learning. Through the story of the main character - Pete the Penguin, and the character of the day - Cory the Polar Bear, the children learned the message that #YouAreLoved therefore they should  #FearNot. Each child received the message of love and hope through the stories of Pete's Adventure and from the Bible, crafts, games and snacks.
#     Praise God for the lives of these volunteers who shared their time and talents that facilitated the successful implementation:
#     Thank you also to the support of the leadership of IBC thru Pastor Ninfa Espina - Senior Pastor and Mrs. Gyceria Paglumotan - Chairperson of the BOT.
#     This initiative is in partnership with the Alliance of Children's Ministries in Negros (ACMN) thru its Post Disaster Response Project in Ilog and Kabankalan. Funding support comes from the Philippine Children's Ministries Network, Inc., Viva, Global Care Kinderhilfswerk, and Aktion Deutschland Hilft.",
#     images: "philippines1.png",
#     comments: "none",
#     camp_name: "Alliance of Children's Ministries in Negros",
#     newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
#     As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
#     Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
#     We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
#     Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
#     We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
#     My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
#     Thank you for praying and encouraging me during this time of research."
#   },

#   {
#     description: "Typhoon Odette Response and Early Recovery.
#     4Days now in St Bernard, Southern Leyte.
#     - trained 15 Youth volunteers on MHPSS, CFS, CPIE and OPSAFE Camp
#      - rolled out 3 sessions of OPSAFE CAMP to 100 children. 100 plus more children coming.
#      - assessed target Communities identified as Most Affected and Most Vulnerable communities: Malibago, Sitio Maria Soccoro, Brgy San Isidro, and Brgu Lipanto, St Bernard. Courtesy with Brgy Officials of Malibago; conducted FGDs with Fisherfolks and their families in Ma. Soccoro, and field visit and interview in Brgy Lipanto. Join us pray as we lift these communities to God for His plans,help and interventions thru us - His people.
#     Thanks to all who sponsored and extended their help.
#     Needs
#     1. MHPSS is needed for children and adults as well
#     2. Safe Food Package
#     3. Shelter kits
#     4. Feeding
#     5. Hygiene kit
#     6. Kitchen kit
#     7. Committed volunteers ready to respond
#     Thanks for all your support and prayers. ",
#     images: "philippines3.jpeg",
#     comments: "none",
#     camp_name: "Camp in St Bernard, Southern Leyte.",
#     newsfeed_post: "A month ago a late-season super typhoon struck the Philippines doing great damage across the Visayas. Super Typhoon Odette (known internationally as Rai) has been ranked as the 3rd costliest storm in Philippine history.
#     OpSAFE International has been working in this region since 2013 training communities how to care for the emotional needs of children who have experienced mass trauma. Two partners are conducting training in South Leyte and Negros Occidental in response to Typhoon Odette.
#     Pray for Gintong Aral (Jackson Toledo Natividad) and the Philippine Children's Ministry Network (Fe Adul Foronda) as they lead these efforts and pray for the children and communities that will be strengthened after the disaster."
#   },

#   {
#     description: "After the devastating earthquake, thousands of homes and schools across 14 districts were destroyed,
#     forcing people to take shelter in open grounds. In Kathmandu city, most of the mid-city dwellers
#     congregated in Tundikhel - the large parade ground - and within a week Tundikhel had become a tented city.
#     In the first week itself, UNICEF and partners set up a child-friendly space made of bamboo and
#     tarpaulin in Tundikhel.",
#     images: "nepal2.jpeg",
#     comments: "none",
#     camp_name: "UNICEF tent in Nepal",
#     newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
#     As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
#     Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
#     We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
#     Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
#     We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
#     My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
#     Thank you for praying and encouraging me during this time of research."
#   },
# ]

User.create!(
  email: "savi@not-alone.online",
  password: "123456",
  first_name: "Savithri",
  last_name: "Wewala",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  language: "English",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664769848/vdngpd4bmtp7oioig3bo.jpg"
)

User.create!(
  email: "keita@not-alone.online",
  password: "123456",
  first_name: "Keita",
  last_name: "Wilson",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  language: "English, Japanese",
  past_roles: "Camp Director",
  certifications: "Programmer",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664721811/macovccaszdtnctrjxbt.jpg"
)

User.create!(
  email: "ayhem@not-alone.online",
  password: "123456",
  first_name: "Ayhem",
  last_name: "Chelly",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  language: "English, Arabic",
  past_roles: "Crew Leader",
  certifications: "Programmer",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667954040/heegtqhasvkercvbbzi4.jpg"
)

User.create!(
  email: "yulia@not-alone.online",
  password: "123456",
  first_name: "Yulia",
  last_name: "Naumenko",
  location: "Kyiv, Ukraine",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  language: "English, Ukranian, Polish",
  past_roles: "Station Leader, Crew Leader",
  certifications: "Programmer",
  admin_status: true,
  avatar_pic: "https://avatars.githubusercontent.com/u/114731843?v=4"
)

User.create!(
  email: "joyce@not-alone.online",
  password: "123456",
  first_name: "Joyce",
  last_name: "Chan",
  location: "Toronto, Canada",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/109743083?v=4"
)

User.create!(
  email: "fred@not-alone.online",
  password: "123456",
  first_name: "Fred",
  last_name: "Faeger",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "1 Days",
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664745102/jdcxntptl5cqvp63kvmi.jpg"
)

User.create!(
  email: "will@not-alone.online",
  password: "123456",
  first_name: "Will",
  last_name: "Hargrave",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "1 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/77623750?v=4"
)

User.create!(
  email: "yumi@not-alone.online",
  password: "123456",
  first_name: "Yumi",
  last_name: "Kimura",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "1 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/88379080?v=4"
)

User.create!(
  email: "thomas@not-alone.online",
  password: "123456",
  first_name: "Thomas",
  last_name: "Price",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1666749630/eest1b3axeabmyxbrbhj.jpg"
)

User.create!(
  email: "mo@not-alone.online",
  password: "123456",
  first_name: "Mohamed",
  last_name: "Shegow",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664760791/juaab3x4dpcoqyd7tte9.jpg"
)

User.create!(
  email: "soren@not-alone.online",
  password: "123456",
  first_name: "Soren",
  last_name: "Umstot",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/108733009?v=4"
)

User.create!(
  email: "erika@not-alone.online",
  password: "123456",
  first_name: "Erika",
  last_name: "Ura",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/104239957?v=4"
)

User.create!(
  email: "kaho@not-alone.online",
  password: "123456",
  first_name: "Kaho",
  last_name: "Cheng",
  location: "London, UK",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/59798103?v=4"
)
User.create!(
  email: "clement@not-alone.online",
  password: "123456",
  first_name: "Clement",
  last_name: "Choi",
  location: "Hong Kong, Hong Kong",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664808689/oiwkwdtavfgvgwuczsgn.jpg"
)


User.create!(
  email: "cris@not-alone.online",
  password: "123456",
  first_name: "Christopher",
  last_name: "Bush",
  location: "Barcelona, Spain",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/22954474?v=4"
)

User.create!(
  email: "tash@not-alone.online",
  password: "123456",
  first_name: "Tashika",
  last_name: "Cruz",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664802291/etmamyn3hjuz1pqq1gik.jpg"
)

User.create!(
  email: "sho@not-alone.online",
  password: "123456",
  first_name: "Sho",
  last_name: "Fujiwara",
  location: "Manila, Philippines",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://media-exp1.licdn.com/dms/image/C5603AQGhlFSlqVzV8g/profile-displayphoto-shrink_800_800/0/1616994473301?e=2147483647&v=beta&t=hWhpcfI8L40nGokDPdqbpd_eL_8-OXslFL6NupxVPJY"
)

User.create!(
  email: "sammy@not-alone.online",
  password: "123456",
  first_name: "Sammy",
  last_name: "Kavanagh",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/113871255?v=4"
)

User.create!(
  email: "sunny@not-alone.online",
  password: "123456",
  first_name: "Sunny",
  last_name: "Liu",
  location: "Taiwan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/99332370?v=4"
)

User.create!(
  email: "hafid@not-alone.online",
  password: "123456",
  first_name: "Hafid",
  last_name: "Qarchi",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/113567278?v=4"
)

User.create!(
  email: "patrick@not-alone.online",
  password: "123456",
  first_name: "Patrick",
  last_name: "Stark",
  location: "Tokyo, Japan",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/94529648?v=4"
)

User.create!(
  email: "mattias@not-alone.online",
  password: "123456",
  first_name: "Mattias",
  last_name: "Velamsson",
  location: "Stockholm, Sweden",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 40),
  training: "3 Days",
  avatar_pic: "https://avatars.githubusercontent.com/u/66011769?v=4"
)

# admin_user = User.all.where do |user|
#   user if user.admin_status == true
# end

puts "... created #{User.count} Users."

# camp1 = Camp.create!(
#   address: "Japan, Tokyo",
#   required_number_volunteers: 11,
#   start_date: date,
#   end_date: date + 7,
#   description: "You'll be volunteers at shelters when a disaster happens. Let's think about how we can make life easier for evacuees! Lets make children to play together in nature and to cultivate their sensitivity through living together. We hope they'll realize that, while nature can be terrifying, it can also be gentle and warm.",
#   images: "https://www.jrc.or.jp/eq-japan2011/news-stories/assets_c/2015/11/%E2%98%85IMG_0762-cropped-proto-custom_317.jpg",
#   camp_name: "Camp for Disaster Prevension in Akita",
#   required_roles: "Camp Director, Station Leader, Crew Leader",
#   newsfeed_post: "This year's camp, the 5th time it has been held, was co-hosted by many organizations such as universities, companies, and NPOs. One hundred and fifty volunteers, including university students, participated as instructors and organizers.",
#   user: admin.sample
# )

file1 = URI.open("https://i.guim.co.uk/img/media/d682d208509a7d55cbd03e0eecaa264679f130ee/0_127_2048_1229/master/2048.jpg?width=480&quality=85&dpr=1&s=none")
camp1.photos.attach(io: file1, filename: "tokyo.png", content_type: "image/png")
camp1.save

camp2 = Camp.create!(
  address: "Nepal, Kathmandu",
  required_number_volunteers: 9,
  start_date: date,
  end_date: date + 7,
  description: "After the devastating earthquake, thousands of homes and schools across 14 districts were destroyed, forcing people to take shelter in open grounds. In Kathmandu city, most of the mid-city dwellers congregated in Tundikhel - the large parade ground - and within a week Tundikhel had become a tented city. In the first week itself, UNICEF and partners set up a child-friendly space made of bamboo and tarpaulin in Tundikhel.",
  camp_name: "UNICEF tent in Nepal",
  required_roles: "Camp Director, Station Leader, Crew Leader, Story telling, Songs, Snacks, Crafts",
  newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served. As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering. Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news! We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind. Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%. We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community. My hope is that my research will enable communities to focus more timely help to the most vulnerable children. xsThank you for praying and encouraging me during this time of research.",
user: admin.sample
)
file2 = URI.open("https://www.volunteersinitiativenepal.org/wp-content/uploads/2013/08/children.jpg")
camp2.photos.attach(io: file2, filename: "nepal.png", content_type: "image/png")
camp2.save


camp3 = Camp.create!(
  address: "Philippines, Saint Bernard",
  required_number_volunteers: 5,
  start_date: date,
  end_date: date + 7,
  description: "Typhoon Odette Response and Early Recovery.
  4Days now in St Bernard, Southern Leyte.
  - trained 15 Youth volunteers on MHPSS, CFS, CPIE and OPSAFE Camp
   - rolled out 3 sessions of OPSAFE CAMP to 100 children. 100 plus more children coming.
   - assessed target Communities identified as Most Affected and Most Vulnerable communities: Malibago, Sitio Maria Soccoro, Brgy San Isidro, and Brgu Lipanto, St Bernard. Courtesy with Brgy Officials of Malibago; conducted FGDs with Fisherfolks and their families in Ma. Soccoro, and field visit and interview in Brgy Lipanto. Join us pray as we lift these communities to God for His plans,help and interventions thru us - His people.
  Thanks to all who sponsored and extended their help.
  Needs
  1. MHPSS is needed for children and adults as well
  2. Safe Food Package
  3. Shelter kits
  4. Feeding
  5. Hygiene kit
  6. Kitchen kit
  7. Committed volunteers ready to respond
  Thanks for all your support and prayers. ",
  camp_name: "Camp in St Bernard, Southern Leyte.",
  required_roles: "Camp Director, Station Leader, Crew Leader",
  newsfeed_post: "A month ago a late-season super typhoon struck the Philippines doing great damage across the Visayas. Super Typhoon Odette (known internationally as Rai) has been ranked as the 3rd costliest storm in Philippine history.
  OpSAFE International has been working in this region since 2013 training communities how to care for the emotional needs of children who have experienced mass trauma. Two partners are conducting training in South Leyte and Negros Occidental in response to Typhoon Odette.
  Pray for Gintong Aral (Jackson Toledo Natividad) and the Philippine Children's Ministry Network (Fe Adul Foronda) as they lead these efforts and pray for the children and communities that will be strengthened after the disaster.",
user: admin.sample
)

file3 = URI.open("https://ftcj.org/wp/wp-content/uploads/2019/12/2-2-1-e1575457082586.jpg")
camp3.photos.attach(io: file3, filename: "philippines.png", content_type: "image/png")
camp3.save

camp4 = Camp.create!(
  address:  "Philippines, Manila",
  required_number_volunteers: 10,
  start_date: date,
  end_date: date + 7,
  description: "It was a fire in Quezon City, Philippines literally just down the street from our partners the Philippine Children's Ministry Network.  The fire affected 100 families with 140 children and OpSAFE trained volunteers are already responding to bring hugs, help and hope to the children.  Please pray for these volunteers and the children they are serving. " ,
  comments: "You should have excperions of working with kids",
  camp_name: "Camp in Philippine",
  required_roles: "Camp Director, Station Leader, Crew Leader, Snacks, Crafts",
  newsfeed_post: "An Opsafe camp reaches  to 51 children affected by the fire in Pajo St., Project 2, QC. Church of Praise lead the team of station leaders from  PCMN staff. The crew leaders and volunteers' food were supplied by Pajo Outreach Church. The venue was lent by Community Bible Church. It took the unity of 3 churches and PCMN to respond to the psycho-social trauma debriefing camp for these children. Praise God for the unity of believers!",
  user: admin.sample
)
file4 = URI.open("https://www.adb.org/sites/default/files/styles/content_media/public/content-media/8170-primary-education.jpg?itok=d4nBXY-g")
camp4.photos.attach(io: file4, filename: "philippine.png", content_type: "image/png")
camp4.save

camp5 = Camp.create!(
  address: "Ukraine, Kyiv",
  required_number_volunteers: 10,
  start_date: date,
  end_date: date + 7,
  description: "OpSAFE camps are continuing in Ukraine! Keep praying for these children and hundreds more who are being helped to feel safe, important, empowered, loved, and hopeful.",
  camp_name: "OpSAFE camp in Ukraine",
  required_roles: "Camp Director, Station Leader, Crew Leader, Game, Story telling, Songs, Snacks, Crafts",
  newsfeed_post: "We are seeing some really great results from the camps in Ukraine.  With seven out of ten camps reporting, we found 37 out of 145 children were 'at risk' with more severe post-traumatic stress symptoms than their peers. What was wonderful was that 20 of these children made enough progress that their symptoms were similar to their peers by the end of the camp. The remaining 17 still had more severe symptoms than their peers, but all of them showed substantial improvement.
  Of the 108 children who exhibited mild PTSS, 80 showed significant improvement in their symptoms, and 25 did not primarily because their initial symptoms were very mild leaving not much room for improvement. 3 of these children showed a slight regression.
  By the end of the camps, none of the children were flagged as being exceptionally at risk in comparison with their peers. Continued support from friends and community should see continued progress in children's resilience to trauma.
  Thank you for your support for Ukrainian Christians making a difference in children's lives.",
user: admin.sample
)

file5 = URI.open("https://www.worldvision.org/wp-content/uploads/2022/03/01_W322-0075-145.jpg")
camp5.photos.attach(io: file5, filename: "kyiv.png", content_type: "image/png")
camp5.save


camp6 = Camp.create!(
  address: "Poland, Masovian Minsk",
  required_number_volunteers: 15,
  start_date: date,
  end_date: date + 7,
  description: "Możesz pomóc już teraz! Weź udział w szkoleniu - pomóż dzieciom!
  Szkolenie przygotuje Cię do udzielania pierwszej pomocy psychologicznej dzieciom dotkniętym wojną.
  Wszystko, co dzieje się z dzieckiem po doświadczeniu stresu, nagłej zmiany okoliczności życiowych jest normalną reakcją na nienormalną sytuację. Ale wszystkie dzieci potrzebują pomocy po doświadczeniu traumy!
  OperationSAFE to program zajęć dla dzieci 6-12 lat, który pomaga prowadzić dzieci do emocjonalnego uzdrowienia, rozwijając u nich odporność na traumatyczne przeżycia oraz ucząc znaleźć ukojenie w sytuacji chaosu.",
  images: "poland.jpegg",
  camp_name: "OpSAFE camp in Poland",
  required_roles: "Camp Director, Station Leader, Crew Leader, Game, Story telling, Songs, Snacks, Crafts",
  newsfeed_post: 'Miło jest wspomnieć szkolenie OpSAFE w Mińsku Mazowieckim. Tak duża grupa była dla nas nie lada wyzwaniem!
  Dużo było spisanych kartek, dużo dyskusji, trochę łez wzruszenia, ale dużo też uśmiechu i wdzięczności.
  Dziękujemy Inna Karpenko za zaproszenie i pomoc w organizacji. Bardzo dziękujemy Svetlana Popovych i Sofii za nakarmienie 100 osób oraz opiekę nad dziećmi 🙂 I serdecznie dziękujemy OM w Polsce za realizację takich spotkań jak to!
  Pięknie dziękujemy wszystkim za udział i cieszymy się, że już za chwilę zaczynacie zajęcia OpSAFE z dziećmi w Mińsku Mazowieckim i okolicach!
  Jesteśmy z Wami 🫶',
  user: admin.sample
)
file6 = URI.open("https://qph.cf2.quoracdn.net/main-qimg-fccf290e25ca2c9ad2946ac99c297dba-lq")
camp6.photos.attach(io: file6, filename: "kyiv.png", content_type: "image/png")
camp6.save


camps = [camp2, camp3, camp4, camp5, camp6]

# camps.each do |camp|
#   date = Faker::Date.between(from: 'July 1, 2022', to: 'Feb 1, 2023')
#   Camp.create!(
#     user: User.where(admin_status: true).sample,
#     description: camp[:description],
#     images: camp[:images],
#     comments: camp[:comments],
#     camp_name: camp[:camp_name],
#     newsfeed_post: camp[:newsfeed_post],
#     address: location.sample,
#     required_number_volunteers: rand(15..30),
#     start_date: date,
#     end_date: date + 7,
#     director_email: email.sample,
#     required_roles: "Camp Director; Station Leader: Game, Story telling, Songs, Snacks, Crafts; Crew Leader"
#   )
# end

User.all.each do |user|
  Assignment.create!(
    final_volunteer_count: rand(9..15),
    status: "user_apply",
    user: user,
    camp: camps.sample
  )
end

puts "... created #{Camp.count} Camps"

puts "... created #{Assignment.count} Assignments"
