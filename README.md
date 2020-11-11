# Shibr
## An innovative startup disrupting the world of Shiba viewing.
To start your Shibr server:

  * run `asdf install` if you care about your versions (everything is pretty generic so most should be fine.)
  * Install dependencies with `mix deps.get`
  * Update the DB credentials in config/dev.exs. No prod setup is provided in this project.
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

# Requirements

## a picture of a Shiba
I'm assuming that we can just pick a random Shiba picture from dog.ceo
e.g. https://dog.ceo/api/breed/shiba/images/random

## a button which changes the Shiba picture
When the user clicks reload the page with a new shiba photo from dog.ceo

## a view that shows previously displayed Shibas
The URL for each Shiba photo that is viewed should be stored to the DB
When a user visits /history the previous 15 Shibas should be shown.
All views should be stored together - no per-user history
Future - delete DB entries when there are more than TDB history urls stored. If we get a lot of page views we might fill up our DB with useless info.

## a way to switch from viewing Shibas to viewing other breeds

Users can visit /breed/:breed to get another breed of dog.
Requirements are the same for the new breed as for Shibas
/history/breed/:breed should show history for the given breed 
Show a big ugly list of breeds at the bottom of the page to link to each.
Let's reuse all our code from the Shiba but with a new breed instead of the default "shiba"
Trap when users enter a non-existent breed
Future - cache the dog breeds so we don't need to hit the breed list as frequently. (Tesla might do this for us - need to check)

## a more visual way to select other breeds
Grab the list from https://dog.ceo/api/breeds/list/all
Pick 6 breeds at random and also fetch images
Future - Maybe resize images to thumbnails to speed up page load. 

# Journal

Share my work so you can see my thought process

* Run the Phoenix bootstrap
* Define requirements
* git init and initial commit. Will just work on one branch for this simple proj.
* fix basic template issues and add some copy
* Load a static image of a Shiba to get the basic template
* add Tesla to grab stuff from the dog.ceo API