# 📚 Not Alone

App for communicating with and organizing volunteers around the world. Finding volunteers with ease while creating an event page.

<img width="1440" alt="Not_alone_home" src="https://user-images.githubusercontent.com/102286740/205543541-e608724b-3054-4679-b10f-8039116951e9.png">
<img width="1438" alt="Find Volunteers" src="https://user-images.githubusercontent.com/102286740/205543550-6108c463-c7f4-4d3a-bfdb-eb37e97f8a58.png">
<img width="1436" alt="Look for a camp" src="https://user-images.githubusercontent.com/102286740/205543567-d7205a0a-6a91-46e5-abde-206d5e88e111.png">
<img width="1248" alt="2022-12-05 (8)" src="https://user-images.githubusercontent.com/102286740/205544115-5754b8c1-42de-45c8-afdc-4481f178d977.png">
<img width="1248" alt="2022-12-05 (10)" src="https://user-images.githubusercontent.com/102286740/205544127-a18d7c5a-5357-4825-91f3-f8178c6417aa.png">
<img width="1199" alt="show page volunteers" src="https://user-images.githubusercontent.com/102286740/205543587-9d5ea754-77f3-4f01-b8e7-7cccea9cb2e1.png">
<img width="1248" alt="2022-12-05 (12)" src="https://user-images.githubusercontent.com/102286740/205544174-f84f08fe-a45e-4c39-955e-004c9c9795e5.png">



## Getting Started
### Setup

Install gems
```
bundle install
```
Install JS packages
```
yarn install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=cloudinary://482279922763549:5tcC79BwTV8IXG2sBzPxMev7EtE@djnxkxxw9

MAPBOX_API_KEY=pk.eyJ1IjoiZGt3aWxzb24xOTkxIiwiYSI6ImNsYWtmbHhtZjA1Mmgzb3BqNnVvZm9tZ3EifQ.jqERiLo3qGRnI21NTc1YDA
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

<br>
Not Alone App: https://not-alone-na.herokuapp.com/

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements
[OperatinoSAFE](http://opsafeintl.com/), a non-profit organization which specializes in helping children who have experienced trauma by equipping volunteers with a psychological first-aid program.

## Team Members
- [Savithri Wewala](https://www.linkedin.com/in/savithri-wewala-507308a1/)
- [Yulia Naumenko](https://www.linkedin.com/in/yulia-naumenko-bba121119/)
- [Ayhem Chelly]()

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
