## Explanation

using [github cli](https://github.com/cli/cli):

```
 gh api users/Lauloque/repos --paginate --jq ".[] | select(.fork == false and .archived == false) | .name" | sort
```

Reference: [REST API endpoints for repositories - GitHub Docs](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-a-user)

Then use 

```md
[![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=Lauloque&repo=convertRotationMode&theme=catppuccin_mocha)](https://github.com/Lauloque/convertRotationMode)
```
[![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=Lauloque&repo=convertRotationMode&theme=catppuccin_mocha&hide_border=true)](https://github.com/Lauloque/convertRotationMode)

## Using the bat file

Using [`generate_repo_list.bat`](https://github.com/Lauloque/Lauloque/blob/main/generate_repo_list.bat) will try to use Github CLI and fetch the current logged-in user's repos which you own (no forks) and aren't archived, and prints them in the console as markdown cards ready for use.

The line `set THEME=catppuccin_mocha&hide_border=true` sets the default theme to Catppuchin mocha as the above and disables the default 1px white border, but you can use any available themes from there: https://github.com/anuraghazra/github-readme-stats/blob/master/themes/README.md
