## GitHub Organization Label Manager
#### Joseph Persie

### Install Required NPM Dependencies
```bash
yarn install
```

### Install GithHub CLI
[Installation](https://github.com/cli/cli#installation)

### Acquire Access Token
You'll also need a GitHub access token ready so that the the tool will have access to your repositories.
You can [generate an access token here](https://github.com/settings/tokens), be sure to allow the `"repo"` scope.

### Generate Token File
Run the auth script to generate the GitHub token configutation file in `config/.env.token`,

```bash
./auth.sh [github_token]
```

### Generate The Labels File
Run the config script on an organizations repository to generate `config/labels.json` file
```bash
./config.sh [organization] [source_repo]
```

- Organization: The organization which to retieve the repos from
- Source Repository: The repository to fetch all tags from and apply elsewhere

### Distrubute The Organization Labels Throughout
Add entries there to distribute to all repositories listed in `config/repo.config`

```bash
./createOrganizationLabels.sh [organization]
```
