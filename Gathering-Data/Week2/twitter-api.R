library(httr)
library(RJSONIO)

myapp = oauth_app("twitter", 
                  key="ll5iyr7Ky6gYySIZ3nbOw",
                  secret="tfAFNrTWDpYBnQFIi6jNGkwSFB1oOyVALA0Xk4GtxQ")
sig = sign_oauth1.0(myapp,
                    token="63185956-5cZWGddYbGzKGu1blzxU6j8zbyQje9yBi1byysIZq",
                    token_secret= "diH3yC5CNpIZRCYMOXn51bLtkm5wKUWWjOEklLp507HGJ")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]
