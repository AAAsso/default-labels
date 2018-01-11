# Add labels used in the organization to a new repository
SH script to add labels of the AAAsso to all the managed repositories.

![preview of default labels under AAAsso organization](https://user-images.githubusercontent.com/23707217/34819347-c3448f20-f6bd-11e7-9348-fd0adfe52700.png)

# How to use it?
## Get the file
- Pull the project on your local environment.
## Get a token to be able to use it
*The GitHub API needs a token linked to your account to work.*
- In GitHub, go to `Your Settings` > `Developer settings` > `Personal access tokens`.
- Click on `Generate new token`.
- Check `admin:repo_hook` *Full control of repository hooks*
- Click on Generate Token
- Copy the generated token and save it somewhere if you want to reuse it sometimes (not recommended, I would just keep it in my paperclip)
## Run the script
*In a terminal.*
- Add execution to the script using `chmod +x ./set-github-labels.sh`
- Execute the script `./set-github-labels.sh`
- When it asks your token, paste it. It will not be displayed for security.
- When it asks you the repository name, enter `Organization/Repository` (e.G. AAAsso/aaaccueil)
## Verify it worked
- Go to your GitHub repository and check the labels are the new ones

Enjoy!

# References
This script is an edition of https://github.com/thisisarray/GitHub-Issues-Process/blob/master/set-github-labels.sh, if you liked it, please go say thanks to the devs and star the repo where this is comming from! :blue_heart:
