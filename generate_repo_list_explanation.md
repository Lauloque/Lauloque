## Using the bat file

Using [`generate_repo_list.bat`](https://github.com/Lauloque/Lauloque/blob/main/generate_repo_list.bat) will try to use Github CLI and fetch the current logged-in user's repos which you own (no forks) and aren't archived, and prints them in the console as markdown cards ready for use.

The line `set THEME=catppuccin_mocha&hide_border=true` sets the default theme to Catppuchin mocha as the above and disables the default 1px white border, but you can use any available themes from there: https://github.com/anuraghazra/github-readme-stats/blob/master/themes/README.md

## Manual process:

[Github cli](https://github.com/cli/cli) can generate the list of a user's owned and unarchived repos:

```
 gh api users/<YOUR USER NAME>/repos --paginate --jq ".[] | select(.fork == false and .archived == false) | .name" | sort
```

Reference: [REST API endpoints for repositories - GitHub Docs](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-a-user)

Then use [anuraghazra/github-readme-stats](https://github.com/anuraghazra/github-readme-stats) to make the cards which automatically contain the repo's name, description and minimal stats. Example:

```md
[![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=Lauloque&repo=convertRotationMode&theme=catppuccin_mocha&hide_border=true)](https://github.com/Lauloque/convertRotationMode)
```
[![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=Lauloque&repo=convertRotationMode&theme=catppuccin_mocha&hide_border=true)](https://github.com/Lauloque/convertRotationMode)
