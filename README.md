### Github Tag Management

#### Joseph Persie


Install Require Dependencies
```bash
yarn install
```

Login to github with `gh`
```bash
npm run gh-auth
```

Create and export github token:

https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/

```bash
export GITHUB_LABEL_TOKEN='Your Token Here'
```

Run the config script on an orhanization repository to generate desired labels.


```bash
./config.sh [organization] [source_repo]
```

- Organization: The organization which to retieve the repos from
- Source Repository: The repository to fetch all tags from and apply elsewhere

e.g. 

```bash
./config.sh nodejs node
```

The command above will generate a `config/labels.json` 

Add entries there to distribute to all repositories listed in `config/repo.config`

```bash
./createOrganizationLabels.sh
```
