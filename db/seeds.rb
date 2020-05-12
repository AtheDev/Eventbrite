User.create(first_name: "John",
            last_name: "Doe",
            description: "Coucou coucou tout le monde!",
            email: "johndoe@yopmail.com",
            password: "coucou11"
          )

User.create(first_name: "Jess",
            last_name: "Doe",
            description: "Coucou coucou tout le monde!",
            email: "jessdoe@yopmail.com",
            password: "coucou11"
            )

Event.create(start_date: "20200515203000",
    duration: 135,
    title: "Why Don’t We Virtual Concert #WhyDontWeFromHome",
    description: "#WhyDontWeFromHome is a virtual ‘concert’ hosted by us fans for fans to bring a Why Don’t We concert to you right at home!!",
    price: 1,
    location: "at home",
    admin_id: 1,
    )

Event.create(start_date: "20200611183000",
    duration: 120,
    title: "THE SHOW MUST GO ON! The Afro-Peruvian Sextet's Livestreaming Experience",
    description: "In times of COVID-19, we will not stop playing for you. We are curating a professional three camara shoot for this special concert!",
    price: 20,
    location: "at home",
    admin_id: 2,
    )

Event.create(start_date: "20200516193000",
    duration: 120,
    title: "Shawn Mendes The Virtual Tour",
    description: "giving you all a concert experience by sorting a live with a compilation of old tour videos to make lockdown more exciting!!",
    price: 10,
    location: "at home",
    admin_id: 1,
    )

Event.create(start_date: "20200516203000",
    duration: 135,
    title: "Carats World Tour",
    description: "This is a livestream for carats to enjoy with each other! It will be held on May 16 at 7pm on twitch. You can follow the twitch account which is caratsworldtour.",
    price: 30,
    location: "at home",
    admin_id: 2,
    )