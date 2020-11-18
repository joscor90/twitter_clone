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

## CSS Framework

The style in *Definetly not Twitter* was made using *Bootstrap 4.5.3*.

## Model

<object data="https://github.com/joscor90/twitter_clone/blob/master/erd.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="https://github.com/joscor90/twitter_clone/blob/master/erd.pdf">
        <p>The entities in the app and their relationship are represented in the following ERD: <a href="https://github.com/joscor90/twitter_clone/blob/master/erd.pdf">Download PDF</a>.</p>
    </embed>
</object>

