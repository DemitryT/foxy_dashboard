# Foxy Dashboard
Internal TechDev Dashboard

At the moment 2 API end points are provided:
1. a GitHub Feed for HitFox Tech Team related to Pull Requests and Push Events.
2. a HackerNews feed collecting new posts from HackerNews site.

# Setup

```bash
git clone git@github.com:HitFox/foxy_dashboard.git
cd foxy_dashboard
bundle install
rake db:setup
```
## OmniAuth2 with HitFox/Finleap account
In order to be able to access the dashboard you need to authenticate throught Google OmniAuth2 protocol.
Please follow read best practices on [OmmiAuth2] about how to get credential from the google developer console.

Now add a `.env` file to root directory if you already don't have one and set the the credential just obtained as defined in the best practices. In particular set `GOOGLE_APP_ID`, `GOOGLE_SECRET` and `DEVISE_SECRET` and `GoogleRedirect`

## HitFox GitHub Feed
You must provide a generall access token in order to being able to consume the Github API. If you don't have already one please [generate] it.

Now go to your `.env` file and set the following 2 constants:
* `GITHUB_USER` equal to your git-hub user name
* `GITHUB` equale to the github token you just created

## HackerNews Feed
Nothing to do be done... Out of the Box :-)

# Up and Run
Foxy Dashboard si composed at the moment by some workers running in the background that take care about regurlarly updating the feeds. So run:
```bash
bundle exec sidekiq
```

Now that the backgrounds process are running run the server:
```bash
rails s
```

Login with your HitFox/Finleap account. Navigate to the end points that at the moment are:
* `api/v1/hit_fox_feeds.json`
* `api/v1/hacker_news.json`

# Best Practice for adding new features/end points
If you want to add a new feature please add it under `app/features` and the relative worker ( if there is ) under `app/workers`. Business logic should stay in `app/models` and the controller in `app/controller`

Have Fun !!!


[generate]: https://github.com/blog/1509-personal-api-tokens
[OmmiAuth2]: https://github.com/HitFox/best-practices/blob/master/authentication/google_oauth2.md
