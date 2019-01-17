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

---
Note: the command above generate a file ~/.gh.json which in turn generates a access-token. This omits the need for the step below,
however one must assure to remove any sensitive privileges granted to the token by default and ideally remove all privileges when the 
token is no longer in use. If the token is removed from github the file will still exist resulting in 403 errors even after attempting
to reauthenticate with `npm run gh-auth`.

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
