### Github Tag Management

#### Joseph Persie

1. Install Require Dependencies
```bash
yarn install
```

1. Install GithHub CLI
[Installation](https://github.com/cli/cli#installation)

1. You'll also need a GitHub access token ready so that the the tool will have access to your repositories.
You can [generate an access token here](https://github.com/settings/tokens), be sure to allow the `"repo"` scope.

1. Run the auth script to generate the github token

```bash
./auth.sh [github_token]
```

1. Run the config script on an organization repository to generate desired labels.

```bash
./config.sh [organization] [source_repo]
```

- Organization: The organization which to retieve the repos from
- Source Repository: The repository to fetch all tags from and apply elsewhere

1. The command above will generate a `config/labels.json` 

1. Add entries there to distribute to all repositories listed in `config/repo.config`

```bash
./createOrganizationLabels.sh [organization]
```
