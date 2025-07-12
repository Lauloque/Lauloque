using [github cli](https://github.com/cli/cli):

```
 gh api users/Lauloque/repos --paginate --jq ".[] | select(.fork == false and .archived == false) | .name" | sort
```

Reference: [REST API endpoints for repositories - GitHub Docs](https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#list-repositories-for-a-user)

Then use 

```md
[![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=Lauloque&repo=convertRotationMode&theme=catppuccin_mocha)](https://github.com/Lauloque/convertRotationMode)
```
[![Repo Card](https://github-readme-stats.vercel.app/api/pin/?username=Lauloque&repo=convertRotationMode&theme=catppuccin_mocha)](https://github.com/Lauloque/convertRotationMode)
