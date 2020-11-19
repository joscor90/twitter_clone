# README

## Summary

*Definetly not Twitter* is a Twitter like app where you can share your thoughts with other people and see what they think too about stuff. This app was developed mostly using Rails.

## Features

*Definetly not Twitter* has the following features:

+ Authentication: you can create your own account using the sign up link in the navigation bar, you will be asked to provided a user name, email, password and a url to your avatar. After signing up you will be automatically logged in and while you are you can make your own tweets and like or retweet others.

+ Retweet: you can retweet a tweet that has caught your attention. This will create a new tweet and show the tweet you are referencing to.

+ Like: you can like a tweet clicking the thumbs up icon bellow the content of the tweet. You can only like a tweet once, clicking the thumbs up icon again after giving a like will result and removing your like from that tweet.

## Ruby and Rails Version

*Definetly not Twitter* was developed using *Ruby 2.5.3* and *Rails 5.2.4*.

## Gems

Besides the default Gems that comes with a Rails project the following gems were installed:

+ *devise* 4.7.3 for authentication.

+ *kaminari* 1.2.1 for pagination.

+ *rails-erd* 1.6.0 for ERD generation.

## CSS Framework, Fonts and Icons

The style in *Definetly not Twitter* was made using *Bootstrap 4.5.3*. Two special fonts were used in this project, both collected from *Google Fonts*:

+ Fredoka One
+ Lobster Two

The thumb up icons (blank and fill) for the like feature were obtained from  *Font Awesome*.

## Model

<object data="https://github.com/joscor90/twitter_clone/blob/master/erd.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/joscor90/twitter_clone/blob/master/erd.pdf">
        <p>The entities in the app and their relationship are represented in the following ERD: <a href="https://github.com/joscor90/twitter_clone/blob/master/erd.pdf">Download PDF</a>.</p>
    </embed>
</object>

## Instructions for Use

After successfully cloning this repository you should do the following

1. Open the project in your terminal and run the command: *bundle install* this will install and/or update the gems that this project needs to work. **Remember that your Ruby and RoR versions should match the ones described in the Gemfile**.

2. Next run the following command: *rails db:setup* this will create the database, run the necessary migrations for the app to work and create a dummy account for you to use in the app.

3. After this run the command: *rails s* to start the server.

4. Finally use your browser and go to *http://localhost:3000*, you should now be able to use the app. If you want to start tweeting right away then log in with the credentials of the dummy account (check *seed.rb* for details) following de *Log In* link in the navigation bar. If instead you want to create your own account follow the *Sign Up* link in the navigation bar.

## Heroku

Follow this link to see the app in action: <a href="https://tranquil-depths-31831.herokuapp.com/" target="_blank">Definetly not Twitter</a>
