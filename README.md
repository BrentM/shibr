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
When a user visits /history the previous 15 Shibas(or other dogs) should be shown.
All views should be stored together - no per-user history
Future - delete DB entries when there are more than TDB history urls stored. If we get a lot of page views we might fill up our DB with useless info.
Future - allow the user to see history for each breed (they are all lumped together for now).

## a way to switch from viewing Shibas to viewing other breeds

Users can visit /breed/:breed to get another breed of dog.
Requirements are the same for the new breed as for Shibas
/history/breed/:breed should show history for the given breed 
Show a big ugly list of breeds at the bottom of the page to link to each.
Let's reuse all our code from the Shiba but with a new breed instead of the default "shiba"
Trap when users enter a non-existent breed - Just show shibas if a breed is not found.
Future - cache the dog breeds so we don't need to hit the breed list as frequently. (Tesla might do this for us - need to check)

## a more visual way to select other breeds
Grab the list from https://dog.ceo/api/breeds/list/all
~~ Pick 6 breeds at random and also fetch images ~~
Load an image for all breeds in the big list. A "card" view would look good for this but an ugly list if fine for now until we add some CSS.
Future - Maybe resize images to thumbnails to speed up page load.
Future - Cache imagesRLs to speed up page load.

## Prelaunch cleanup
Verify inputs from the API better.
Non-happy path handling for API responses.

## Future
Empty for now but handy as we choose to defer functionality to post-launch

# Journal

Share my work so you can see my thought process

* Run the Phoenix bootstrap
* Define requirements
* git init and initial commit. Will just work on one branch for this simple proj.
* fix basic template issues and add some copy
* Load a static image of a Shiba to get the basic template
* add Tesla to grab stuff from the dog.ceo API
* wrapper for dog.ceo API to find any quirks and start getting our random Shibas
* Let's fetch all the breeds too as long as we are working with the API
* now that we have a random image and all the breeds lets generalize our random image for arbitrary breeds.
* Lets get our schema for history into the DB. phx.gen.html does most of the heavy lifting. Creates more than is needed but the extra views and forms tend to be helpful (and are easy to delete if not).
* I backed off on the requirements a bit to hit the time window. We can add per-dog history back easily with the stored breed.
* Lets glue all our new history functionality into the templates.
* We're almost done. Lets just fetch and show a random dog image for all breeds for our "visual" way to select other breeds. I'd probably ask for more input from users for this - this isn't well enough understood to make it worth the dev time (and performance hit) IMO.

# Thoughts

* I hijacked the page controller for dogs. This is fine in a small project but for a larger/longer-term project I'd make a dog-specific controller so we can separate landing pages from standard dog pages.
* The dog API has a confusing (and probably redundant) "status" field that needs more investigation. Does this overlap with the standard status codes or does it do something different.
* Primary keys as UUIDs - not really needed for the project but easy and are really handy if you need to generate an ID outside the DB or in an external system and then import a record.
* I've left a lot of error handling and testing out. I'll add some failing test stubs for things that should be tested if I have time. This is an experimental project so I've waited until I understand the functionality better before writing tests. For a better defined (or higher risk) project I would do more testing in tandem.
* I left the dog-history resources in for the purposes of this demo. I would remove access to the edit
* I like adding a Pre-launch checklist to things