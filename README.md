# org-repo-name-fetcher
This script fetches all names in an organisation. 
You can additionally add a second parameter to specify what prefix the names should be filtered by.

## Installation

1. Clone this repository and open up a terminal in the root directory.
2. Install `bash`, `curl` and `jq`.
3. Create a GitHub Personal Access Token ([Settings > Developer Settings > Personal Access Tokens > Generate new token](https://github.com/settings/tokens/new)).
   Select the full `repo` scope.
4. Create an environment variable called `GITHUB_TOKEN` with the token you just created.

## Usage

Run and exchange all `<variable>`s with the corresponding value. `<prefix>` is optional.
```
bash fetch_repo_names.sh <org-name> <prefix>
```

## Example

```
bash fetch_repo_names.sh sekassel assignment-1-
```
