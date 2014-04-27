library(httr)

oauth_endpoints("github")

myapp = oauth_app("Github",
                  key="18a477438e2ac55610f7",
                  secret="bdf128f869cbb086acdb9f6ade706a878d040f50")


github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

req <- GET("https://api.github.com/users/jtleek/repos", config(token=github_token))
#stop_for_status(req)
content(req)

library(RJSONIO)
json2 = jsonlite::fromJSON(toJSON(req))
