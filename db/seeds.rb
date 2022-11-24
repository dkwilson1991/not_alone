# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Destroying all users..."
User.destroy_all
puts "Destroying all Assignments..."
Assignment.destroy_all
puts "Destroying all Camps..."
Camp.destroy_all

location = ["Japan, Tokyo", "Chile, Santiago", "Costa, Rica", "Havana, Cuba", "Iraq Bagdad", "Canada Ottawa", "Ukraine, Kyiv", "Spain, Madrid", "Philippines, Manila", "Tunisia, Tunis"]
email = ['savi@me.com', 'keita@me.com', 'yulia@me.com', 'ayhem@me.com']
training = ["None", "1 Day", "3 Days"]
roles = ["Camp Director", "Station Leader", "Crew Leader"]

camps = [
  {
    description: "Możesz pomóc już teraz! Weź udział w szkoleniu - pomóż dzieciom!
    Szkolenie przygotuje Cię do udzielania pierwszej pomocy psychologicznej dzieciom dotkniętym wojną.
    Wszystko, co dzieje się z dzieckiem po doświadczeniu stresu, nagłej zmiany okoliczności życiowych jest normalną reakcją na nienormalną sytuację. Ale wszystkie dzieci potrzebują pomocy po doświadczeniu traumy!
    OperationSAFE to program zajęć dla dzieci 6-12 lat, który pomaga prowadzić dzieci do emocjonalnego uzdrowienia, rozwijając u nich odporność na traumatyczne przeżycia oraz ucząc znaleźć ukojenie w sytuacji chaosu.",
    images: "https://scontent.fhnd2-4.fna.fbcdn.net/v/t39.30808-6/311478875_646734176984296_7991225747355725212_n.jpg?stp=cp6_dst-jpg&_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=IwnGdVHgmM4AX8tIAv7&tn=twxPw37y5vdtVh8L&_nc_ht=scontent.fhnd2-4.fna&oh=00_AfDGYyZ09XQz8MCbDydUOwxGWCnoXt1a00PF-9yXSIlu1Q&oe=63808582",
    comments: "none",
    camp_name: "OpSAFE camp in Poland",
    newsfeed_post: 'Miło jest wspomnieć szkolenie OpSAFE w Mińsku Mazowieckim. Tak duża grupa była dla nas nie lada wyzwaniem!
    Dużo było spisanych kartek, dużo dyskusji, trochę łez wzruszenia, ale dużo też uśmiechu i wdzięczności.
    Dziękujemy Inna Karpenko za zaproszenie i pomoc w organizacji. Bardzo dziękujemy Svetlana Popovych i Sofii za nakarmienie 100 osób oraz opiekę nad dziećmi 🙂 I serdecznie dziękujemy OM w Polsce za realizację takich spotkań jak to!
    Pięknie dziękujemy wszystkim za udział i cieszymy się, że już za chwilę zaczynacie zajęcia OpSAFE z dziećmi w Mińsku Mazowieckim i okolicach!
    Jesteśmy z Wami 🫶'
  },

  {
    description: "During war in Ukraine we need volunteers to help kinds.",
    images: "https://scontent-nrt1-1.xx.fbcdn.net/v/t39.30808-6/293354658_10160681233332518_8084655627895499452_n.jpg?stp=cp6_dst-jpg_p960x960&_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=8KsmmZwhtLQAX9LtPmu&_nc_ht=scontent-nrt1-1.xx&oh=00_AfBIV888Cc4_re6E7jroQ32FDkiXyLLT0B6sk10QXzip2Q&oe=6380A2A1",
    comments: "none",
    camp_name: "OpSAFE camp in Ukraine",
    newsfeed_post: "We are seeing some really great results from the camps in Ukraine.  With seven out of ten camps reporting, we found 37 out of 145 children were 'at risk' with more severe post-traumatic stress symptoms than their peers. What was wonderful was that 20 of these children made enough progress that their symptoms were similar to their peers by the end of the camp. The remaining 17 still had more severe symptoms than their peers, but all of them showed substantial improvement.
    Of the 108 children who exhibited mild PTSS, 80 showed significant improvement in their symptoms, and 25 did not primarily because their initial symptoms were very mild leaving not much room for improvement. 3 of these children showed a slight regression.
    By the end of the camps, none of the children were flagged as being exceptionally at risk in comparison with their peers. Continued support from friends and community should see continued progress in children's resilience to trauma.
    Thank you for your support for Ukrainian Christians making a difference in children's lives."
  },

  {
    description: "OpSAFE camps are continuing in Ukraine! Keep praying for these children and hundreds more who are being helped to feel safe, important, empowered, loved, and hopeful.",
    images: "https://scontent-nrt1-1.xx.fbcdn.net/v/t39.30808-6/315590583_139977992135778_7807916700988978741_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=zX9ADdDCA0AAX-zc_5d&_nc_ht=scontent-nrt1-1.xx&oh=00_AfAYangxdA-FDkPyAnPnkRusoVlwK2rpQu12DqDV_Vsp2Q&oe=638076BC",
    comments: "none",
    camp_name: "OpSAFE camp in Ukraine",
    newsfeed_post: "今週はウクライナにおいて10個のプログラムキャンプが行われます。
    ここに養育者の方やボランティアの方から送られてきたレポートを分かち合います。
    ある養育者の方から
    「私の息子は8歳です。彼はいつもキャンプや他のイベントに参加するのは嫌だと言って泣いていました。でも今日はオペレーションセイフのキャンプが最後の日であると泣いています。私は本当にびっくりしています。私が彼にキャンプでは何をしているのと聞いたとき、彼はこのように答えました。「神様についてだよ。」これは彼が初めてキリスト教に対して興味を持った事でした。ありがとう。」
    ある養育者の方から
    「私は私の息子が変化したことに気づきました。息子はもっと喜びにあふれ、そして、いつも笑顔を向けてくれるようになりました。友達を作ることに対してももっと勇気を持つようになったし、特に彼はクラフトが好きで、クラフトを通して子供たちと良い関係を結びました。私の息子をケアして下さって本当にありがとうございます。」
    ある養育者の方から
    「私の子供に大きな変化があることに気づきました。彼はとても活発になったし、オープンにもなり、感情を表してくれるようになりました。いろいろなことを考えることに対しても恐れを抱くことなく、そして、いろいろなことに対して目を向けるようになりました。彼はリーダーやクラフト、このキャンプのことをとても愛していています。」
    ある養育者の方から
    「私は私の子供にとても良い影響があったの見ることができています。彼女はウクライナで行われているレッスンにオンラインで参加していましたが、ポーランドでは一人ぼっちでした。でも今彼女は家のそばにたくさん友達を持つ見つけて、それを喜んでいます。」
    あるボランティアの方から
    「ある男の子は1日目にキャンプにやってきました。けれども彼はどんなイベントにも参加したくないと言っていました。彼は本当にに一匹狼だったのです。しかし、3日目、彼は私たちのキャンプではとてもアクティブな男の子の1人となり、そして、最後の日には一人ひとりのリーダーにハグをしてくれました。その後、日曜学校に来てくれました。私たちは彼を再び見ることができて本当に嬉しいです。実際に、オペレーションセイフのキャンプの後、日曜学校の子供たちの人数は2倍になりました。」
    あるボランティアから
    「私はこれが子供を守るプログラムであることを知っていますが、実際に、このプログラムは、私が必要とされていること、そして、愛されていることを知るためにとても役立ったプログラムでした。」"
  },

  {
    description: "It was a fire in Quezon City, Philippines literally just down the street from our partners the Philippine Children's Ministry Network.  The fire affected 100 families with 140 children and OpSAFE trained volunteers are already responding to bring hugs, help and hope to the children.  Please pray for these volunteers and the children they are serving. " ,
    images: "https://scontent.fhnd2-3.fna.fbcdn.net/v/t39.30808-6/313286194_10160875257947518_3560365381643599798_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=aq5Rr6uTwQ8AX-8c5dm&_nc_ht=scontent.fhnd2-3.fna&oh=00_AfBJv0J-vjQ1oeVr_zoyrj5i1g6oRqo5K_HkMphxExkvjw&oe=637F6CDD",
    comments: "You should have excperions of working with kids",
    camp_name: "Camp in Philippine",
    newsfeed_post: "An Opsafe camp reaches  to 51 children affected by the fire in Pajo St., Project 2, QC. Church of Praise lead the team of station leaders from  PCMN staff. The crew leaders and volunteers' food were supplied by Pajo Outreach Church. The venue was lent by Community Bible Church. It took the unity of 3 churches and PCMN to respond to the psycho-social trauma debriefing camp for these children. Praise God for the unity of believers!"
  },
  {
    description: "Day 5 of the #OpSAFECamp of Ilog Baptist Church with almost 50 children. It was another afternoon of fun and learning. Through the story of the main character - Pete the Penguin, and the character of the day - Cory the Polar Bear, the children learned the message that #YouAreLoved therefore they should  #FearNot. Each child received the message of love and hope through the stories of Pete's Adventure and from the Bible, crafts, games and snacks.
    Praise God for the lives of these volunteers who shared their time and talents that facilitated the successful implementation:
    Thank you also to the support of the leadership of IBC thru Pastor Ninfa Espina - Senior Pastor and Mrs. Gyceria Paglumotan - Chairperson of the BOT.
    This initiative is in partnership with the Alliance of Children's Ministries in Negros (ACMN) thru its Post Disaster Response Project in Ilog and Kabankalan. Funding support comes from the Philippine Children's Ministries Network, Inc., Viva, Global Care Kinderhilfswerk, and Aktion Deutschland Hilft.",
    images: "https://scontent.fhnd2-4.fna.fbcdn.net/v/t39.30808-6/218960379_4079597528761428_6312920815306183617_n.png?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=VRt-1fmzpagAX9ojucr&tn=twxPw37y5vdtVh8L&_nc_ht=scontent.fhnd2-4.fna&oh=00_AfDla-Zq47LXYWITLd8NOV43hdhEMVUXUF49XXHtGqCZhA&oe=63804C64",
    comments: "none",
    camp_name: "Alliance of Children's Ministries in Negros",
    newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
    As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
    Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
    We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
    Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
    We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
    My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
    Thank you for praying and encouraging me during this time of research."
  },

  {
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
    images: "https://scontent.fhnd2-3.fna.fbcdn.net/v/t39.30808-6/278953355_10158109863002136_3395951317285035086_n.jpg?stp=dst-jpg_p960x960&_nc_cat=100&ccb=1-7&_nc_sid=0debeb&_nc_ohc=Uf5ox9X4B5sAX99whbj&_nc_ht=scontent.fhnd2-3.fna&oh=00_AfDWg6G5rbCFbsf_ylbrhdS4qEOJyhRME-i4_u5gi3gp5w&oe=6380EF5F",
    comments: "none",
    camp_name: "Camp in St Bernard, Southern Leyte.",
    newsfeed_post: "A month ago a late-season super typhoon struck the Philippines doing great damage across the Visayas. Super Typhoon Odette (known internationally as Rai) has been ranked as the 3rd costliest storm in Philippine history.
    OpSAFE International has been working in this region since 2013 training communities how to care for the emotional needs of children who have experienced mass trauma. Two partners are conducting training in South Leyte and Negros Occidental in response to Typhoon Odette.
    Pray for Gintong Aral (Jackson Toledo Natividad) and the Philippine Children's Ministry Network (Fe Adul Foronda) as they lead these efforts and pray for the children and communities that will be strengthened after the disaster."
  },

  {
    description: "After the devastating earthquake, thousands of homes and schools across 14 districts were destroyed,
    forcing people to take shelter in open grounds. In Kathmandu city, most of the mid-city dwellers
    congregated in Tundikhel - the large parade ground - and within a week Tundikhel had become a tented city.
    In the first week itself, UNICEF and partners set up a child-friendly space made of bamboo and
    tarpaulin in Tundikhel.",
    images: "https://scontent.fhnd2-4.fna.fbcdn.net/v/t39.30808-6/278940936_10158109865607136_8893217911541043320_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=wYEP6XrNNp0AX8D7vdo&tn=twxPw37y5vdtVh8L&_nc_ht=scontent.fhnd2-4.fna&oh=00_AfB98OTkazZkLDcmSpIJrHsDzM7ytdZIuLxe6MlxDLyXGg&oe=637FDC5F",
    comments: "none",
    camp_name: "UNICEF tent in Nepal",
    newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
    As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
    Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
    We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
    Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
    We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
    My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
    Thank you for praying and encouraging me during this time of research."
  },
  {
    description: "Możesz pomóc już teraz! Weź udział w szkoleniu - pomóż dzieciom!
    Szkolenie przygotuje Cię do udzielania pierwszej pomocy psychologicznej dzieciom dotkniętym wojną.
    Wszystko, co dzieje się z dzieckiem po doświadczeniu stresu, nagłej zmiany okoliczności życiowych jest normalną reakcją na nienormalną sytuację. Ale wszystkie dzieci potrzebują pomocy po doświadczeniu traumy!
    OperationSAFE to program zajęć dla dzieci 6-12 lat, który pomaga prowadzić dzieci do emocjonalnego uzdrowienia, rozwijając u nich odporność na traumatyczne przeżycia oraz ucząc znaleźć ukojenie w sytuacji chaosu.",
    images: "https://scontent.fhnd2-4.fna.fbcdn.net/v/t39.30808-6/311478875_646734176984296_7991225747355725212_n.jpg?stp=cp6_dst-jpg&_nc_cat=111&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=IwnGdVHgmM4AX8tIAv7&tn=twxPw37y5vdtVh8L&_nc_ht=scontent.fhnd2-4.fna&oh=00_AfDGYyZ09XQz8MCbDydUOwxGWCnoXt1a00PF-9yXSIlu1Q&oe=63808582",
    comments: "none",
    camp_name: "OpSAFE camp in Poland",
    newsfeed_post: 'Miło jest wspomnieć szkolenie OpSAFE w Mińsku Mazowieckim. Tak duża grupa była dla nas nie lada wyzwaniem!
    Dużo było spisanych kartek, dużo dyskusji, trochę łez wzruszenia, ale dużo też uśmiechu i wdzięczności.
    Dziękujemy Inna Karpenko za zaproszenie i pomoc w organizacji. Bardzo dziękujemy Svetlana Popovych i Sofii za nakarmienie 100 osób oraz opiekę nad dziećmi 🙂 I serdecznie dziękujemy OM w Polsce za realizację takich spotkań jak to!
    Pięknie dziękujemy wszystkim za udział i cieszymy się, że już za chwilę zaczynacie zajęcia OpSAFE z dziećmi w Mińsku Mazowieckim i okolicach!
    Jesteśmy z Wami 🫶'
  },

  {
    description: "During war in Ukraine we need volunteers to help kinds.",
    images: "https://scontent-nrt1-1.xx.fbcdn.net/v/t39.30808-6/293354658_10160681233332518_8084655627895499452_n.jpg?stp=cp6_dst-jpg_p960x960&_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=8KsmmZwhtLQAX9LtPmu&_nc_ht=scontent-nrt1-1.xx&oh=00_AfBIV888Cc4_re6E7jroQ32FDkiXyLLT0B6sk10QXzip2Q&oe=6380A2A1",
    comments: "none",
    camp_name: "OpSAFE camp in Ukraine",
    newsfeed_post: "We are seeing some really great results from the camps in Ukraine.  With seven out of ten camps reporting, we found 37 out of 145 children were 'at risk' with more severe post-traumatic stress symptoms than their peers. What was wonderful was that 20 of these children made enough progress that their symptoms were similar to their peers by the end of the camp. The remaining 17 still had more severe symptoms than their peers, but all of them showed substantial improvement.
    Of the 108 children who exhibited mild PTSS, 80 showed significant improvement in their symptoms, and 25 did not primarily because their initial symptoms were very mild leaving not much room for improvement. 3 of these children showed a slight regression.
    By the end of the camps, none of the children were flagged as being exceptionally at risk in comparison with their peers. Continued support from friends and community should see continued progress in children's resilience to trauma.
    Thank you for your support for Ukrainian Christians making a difference in children's lives."
  },

  {
    description: "OpSAFE camps are continuing in Ukraine! Keep praying for these children and hundreds more who are being helped to feel safe, important, empowered, loved, and hopeful.",
    images: "https://scontent-nrt1-1.xx.fbcdn.net/v/t39.30808-6/315590583_139977992135778_7807916700988978741_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=zX9ADdDCA0AAX-zc_5d&_nc_ht=scontent-nrt1-1.xx&oh=00_AfAYangxdA-FDkPyAnPnkRusoVlwK2rpQu12DqDV_Vsp2Q&oe=638076BC",
    comments: "none",
    camp_name: "OpSAFE camp in Ukraine",
    newsfeed_post: "今週はウクライナにおいて10個のプログラムキャンプが行われます。
    ここに養育者の方やボランティアの方から送られてきたレポートを分かち合います。
    ある養育者の方から
    「私の息子は8歳です。彼はいつもキャンプや他のイベントに参加するのは嫌だと言って泣いていました。でも今日はオペレーションセイフのキャンプが最後の日であると泣いています。私は本当にびっくりしています。私が彼にキャンプでは何をしているのと聞いたとき、彼はこのように答えました。「神様についてだよ。」これは彼が初めてキリスト教に対して興味を持った事でした。ありがとう。」
    ある養育者の方から
    「私は私の息子が変化したことに気づきました。息子はもっと喜びにあふれ、そして、いつも笑顔を向けてくれるようになりました。友達を作ることに対してももっと勇気を持つようになったし、特に彼はクラフトが好きで、クラフトを通して子供たちと良い関係を結びました。私の息子をケアして下さって本当にありがとうございます。」
    ある養育者の方から
    「私の子供に大きな変化があることに気づきました。彼はとても活発になったし、オープンにもなり、感情を表してくれるようになりました。いろいろなことを考えることに対しても恐れを抱くことなく、そして、いろいろなことに対して目を向けるようになりました。彼はリーダーやクラフト、このキャンプのことをとても愛していています。」
    ある養育者の方から
    「私は私の子供にとても良い影響があったの見ることができています。彼女はウクライナで行われているレッスンにオンラインで参加していましたが、ポーランドでは一人ぼっちでした。でも今彼女は家のそばにたくさん友達を持つ見つけて、それを喜んでいます。」
    あるボランティアの方から
    「ある男の子は1日目にキャンプにやってきました。けれども彼はどんなイベントにも参加したくないと言っていました。彼は本当にに一匹狼だったのです。しかし、3日目、彼は私たちのキャンプではとてもアクティブな男の子の1人となり、そして、最後の日には一人ひとりのリーダーにハグをしてくれました。その後、日曜学校に来てくれました。私たちは彼を再び見ることができて本当に嬉しいです。実際に、オペレーションセイフのキャンプの後、日曜学校の子供たちの人数は2倍になりました。」
    あるボランティアから
    「私はこれが子供を守るプログラムであることを知っていますが、実際に、このプログラムは、私が必要とされていること、そして、愛されていることを知るためにとても役立ったプログラムでした。」"
  },

  {
        description: "It was a fire in Quezon City, Philippines literally just down the street from our partners the Philippine Children's Ministry Network.  The fire affected 100 families with 140 children and OpSAFE trained volunteers are already responding to bring hugs, help and hope to the children.  Please pray for these volunteers and the children they are serving. " ,
    images: "https://scontent.fhnd2-3.fna.fbcdn.net/v/t39.30808-6/313286194_10160875257947518_3560365381643599798_n.jpg?stp=cp6_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=aq5Rr6uTwQ8AX-8c5dm&_nc_ht=scontent.fhnd2-3.fna&oh=00_AfBJv0J-vjQ1oeVr_zoyrj5i1g6oRqo5K_HkMphxExkvjw&oe=637F6CDD",
    comments: "You should have excperions of working with kids",
    camp_name: "Camps in Philippine",
    newsfeed_post: "An Opsafe camp reaches  to 51 children affected by the fire in Pajo St., Project 2, QC. Church of Praise lead the team of station leaders from  PCMN staff. The crew leaders and volunteers' food were supplied by Pajo Outreach Church. The venue was lent by Community Bible Church. It took the unity of 3 churches and PCMN to respond to the psycho-social trauma debriefing camp for these children. Praise God for the unity of believers!"
  },
  {
    description: "Day 5 of the #OpSAFECamp of Ilog Baptist Church with almost 50 children. It was another afternoon of fun and learning. Through the story of the main character - Pete the Penguin, and the character of the day - Cory the Polar Bear, the children learned the message that #YouAreLoved therefore they should  #FearNot. Each child received the message of love and hope through the stories of Pete's Adventure and from the Bible, crafts, games and snacks.
    Praise God for the lives of these volunteers who shared their time and talents that facilitated the successful implementation:
    Thank you also to the support of the leadership of IBC thru Pastor Ninfa Espina - Senior Pastor and Mrs. Gyceria Paglumotan - Chairperson of the BOT.
    This initiative is in partnership with the Alliance of Children's Ministries in Negros (ACMN) thru its Post Disaster Response Project in Ilog and Kabankalan. Funding support comes from the Philippine Children's Ministries Network, Inc., Viva, Global Care Kinderhilfswerk, and Aktion Deutschland Hilft.",
    images: "https://scontent.fhnd2-4.fna.fbcdn.net/v/t39.30808-6/218960379_4079597528761428_6312920815306183617_n.png?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=VRt-1fmzpagAX9ojucr&tn=twxPw37y5vdtVh8L&_nc_ht=scontent.fhnd2-4.fna&oh=00_AfDla-Zq47LXYWITLd8NOV43hdhEMVUXUF49XXHtGqCZhA&oe=63804C64",
    comments: "none",
    camp_name: "Alliance of Children's Ministries in Negros",
    newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
    As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
    Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
    We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
    Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
    We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
    My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
    Thank you for praying and encouraging me during this time of research."
  },

  {
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
    images: "https://scontent.fhnd2-3.fna.fbcdn.net/v/t39.30808-6/278953355_10158109863002136_3395951317285035086_n.jpg?stp=dst-jpg_p960x960&_nc_cat=100&ccb=1-7&_nc_sid=0debeb&_nc_ohc=Uf5ox9X4B5sAX99whbj&_nc_ht=scontent.fhnd2-3.fna&oh=00_AfDWg6G5rbCFbsf_ylbrhdS4qEOJyhRME-i4_u5gi3gp5w&oe=6380EF5F",
    comments: "none",
    camp_name: "Camp in St Bernard, Southern Leyte.",
    newsfeed_post: "A month ago a late-season super typhoon struck the Philippines doing great damage across the Visayas. Super Typhoon Odette (known internationally as Rai) has been ranked as the 3rd costliest storm in Philippine history.
    OpSAFE International has been working in this region since 2013 training communities how to care for the emotional needs of children who have experienced mass trauma. Two partners are conducting training in South Leyte and Negros Occidental in response to Typhoon Odette.
    Pray for Gintong Aral (Jackson Toledo Natividad) and the Philippine Children's Ministry Network (Fe Adul Foronda) as they lead these efforts and pray for the children and communities that will be strengthened after the disaster."
  },

  {
    description: "After the devastating earthquake, thousands of homes and schools across 14 districts were destroyed,
    forcing people to take shelter in open grounds. In Kathmandu city, most of the mid-city dwellers
    congregated in Tundikhel - the large parade ground - and within a week Tundikhel had become a tented city.
    In the first week itself, UNICEF and partners set up a child-friendly space made of bamboo and
    tarpaulin in Tundikhel.",
    images: "https://scontent.fhnd2-4.fna.fbcdn.net/v/t39.30808-6/278940936_10158109865607136_8893217911541043320_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=0debeb&_nc_ohc=wYEP6XrNNp0AX8D7vdo&tn=twxPw37y5vdtVh8L&_nc_ht=scontent.fhnd2-4.fna&oh=00_AfB98OTkazZkLDcmSpIJrHsDzM7ytdZIuLxe6MlxDLyXGg&oe=637FDC5F",
    comments: "none",
    camp_name: "UNICEF tent in Nepal",
    newsfeed_post: "This was me in a UNICEF tent in Nepal training local communities how to provide pediatric mental health first-aid after disaster.  We have been doing this now for 12 years and collecting data on the children served.
    As part of my PhD program I am now digging deeper into the data we collected on over 7,000 children after disasters.  Let me share a little of what I am discovering.
    Many studies point to around 30% of children exposed to traumatic events being at risk for developing mental health pathologies.  We assess each child at the beginning (pre) and end (post) of each camp and one thing our data shows clearly is that younger children make up proportionately more of the lowest 30% than older school age children. There were 262 six year olds (32.7%) and 309 seven year olds (31.6%) in this most at-risk group.  But there was also good news!
    We knew that most children made significant improvement in trauma symptoms by the end of the camp, but I wondered if these most vulnerable children were also improving or were being left behind.
    Looking deeper into the post data, I found that out of the 262 at-risk 6yr olds only one child finished the camp still in the lowest 30%.  Out of the most vulnerable 309 7 yr. olds only three failed to improve out of the bottom 30%.
    We don't yet know all the reasons why some children are more vulnerable to mass trauma than others, because all we can do is look at the symptoms.  But even when symptoms are severe, most children respond to being safe, listened to, given hope, encouraged to ask for help, and loved by volunteers in their own community.
    My hope is that my research will enable communities to focus more timely help to the most vulnerable children.
    Thank you for praying and encouraging me during this time of research."
  },
]

User.create!(
  email: "savi@me.com",
  password: "123456",
  first_name: "Savithri",
  last_name: "Wewala",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664769848/vdngpd4bmtp7oioig3bo.jpg"
)

User.create!(
  email: "keita@me.com",
  password: "123456",
  first_name: "Keita",
  last_name: "Wilson",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664721811/macovccaszdtnctrjxbt.jpg"
)

User.create!(
  email: "ayhem@me.com",
  password: "123456",
  first_name: "Ayhem",
  last_name: "Chelly",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1667954065/heegtqhasvkercvbbzi4.jpg"
)

User.create!(
  email: "yulia@me.com",
  password: "123456",
  first_name: "Yulia",
  last_name: "Naumenko",
  location: "Japan, Tokyo",
  birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
  training: "3 Days",
  admin_status: true,
  avatar_pic: "https://avatars.githubusercontent.com/u/114731843?v=4"
)

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456",
    location: location.sample,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    language: Faker::Nation.language,
    past_roles: roles.sample,
    admin_status: false,
    training: training.sample,
    certifications: Faker::Job.title,
    avatar_pic: "https://thispersondoesnotexist.com/image"
)
  file = URI.open("https://thispersondoesnotexist.com/image")
  user.photo.attach(io: file, filename: "user.png", content_type: "image/png")
end

# admin_user = User.all.where do |user|
#   user if user.admin_status == true
# end

puts "... created #{User.count} Users."
camps.each do |camp|
  date = Faker::Date.between(from: 'July 1, 2022', to: 'Feb 1, 2023')
  Camp.create!(
    user: User.where(admin_status: true).sample,
    description: camp[:description],
    images: camp[:images],
    comments: camp[:comments],
    camp_name: camp[:camp_name],
    newsfeed_post: camp[:newsfeed_post],
    address: location.sample,
    required_number_volunteers: rand(15..30),
    start_date: date,
    end_date: date + 7,
    director_email: email.sample,
    required_roles: "Camp Director; Station Leader: Game, Story telling, Songs, Snacks, Crafts; Crew Leader"
  )
end

puts "... created #{Camp.count} Camps"

role = ["Camp Director", "Station Leader: Game", "Station Leader: Story telling", "Station Leader: Songs", "Station Leader: Snacks", "Station Leader: Crafts", "Crew Leader", "Volunteer"]

Camp.all.each do |camp|
  User.all.each do |user|
    Assignment.create!(
      final_volunteer_count: user.count,
      roles: role.sample,
      start_date: camp.start_date,
      end_date: camp.end_date,
      status: "pending",
      user: user,
      camp: camp
    )
  end
end

puts "... created #{Assignment.count} Assignments"
