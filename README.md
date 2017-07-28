### Github Tag Management

#### Joseph Persie


Install Require Dependencies
```bash
./install.sh
```

Login to github with `gh`
```bash
gh user -l
```

Create and export github token:

https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/

```bash
export GITHUB_LABEL_TOKEN='Your Token Here'
```

Run the config script to generate necessary labels

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
