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

### Generate The Token File
Run the auth script to generate the GitHub token configutation file in `config/.env.token`.
```bash
./golm -a [github_token]
```

### Generate The Labels File
Generate `config/labels.json` and `config/repos.config` files.
```bash
./golm -g [organization] [source_repo]
```

- Organization: The organization of the Source Repository.
- Source Repository: The repository to fetch all labels from and distribute throughout the organization.

### Distrubute The Organization Labels Throughout
This will apply label to each repository through the organization based on each repository listed in the generated `config/repos.config` file.
```bash
./golm -s [organization]
```

### Reauthenitcate Without Token Specification
Assuming the `config/.env.token` file is present it will use this token to reuathenticate to GitHub using the GitHub CLI.
```bash
./golm -r
```
