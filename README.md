## ASK.ME
#### Ask.fm clone made for learning the basics about Ruby and Rails. 

The project is based on `Ruby on Rails` for training purposes. 
About Ask.Fm: https://wikipedia.org/wiki/ASKfm

#### Demo
http://askme.rabadan.ru

### How to install:
```ssh
git clone git@github.com:rabadan/askme.git askme
cd askme
bundle install
bundle exec rake db:migrate
```

### Set ENV key you environments
#### REcaptha https://www.google.com/recaptcha
```
RECAPTCHA_ASKME_PRIVATE_KEY = <REcaptha private key>
RECAPTCHA_ASKME_PUBLIC_KEY = <REcaptha public key>
```

### Start the server
```ssh
bundle exec rails s -b 0.0.0.0 -p 3000
```

### Screenshot
![Ask question](app/assets/images?raw=true "Ask")

