echo ''
echo 'This script will remove the GitHub default labels and create the 80|20 process labels for your repo. A personal access token is required to access private repos.'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. foo/bar): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)


# -----------------------------
# --- Delete default labels ---
# -----------------------------
echo ''
echo 'Deleting default labels...'
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/good%20first%20issue
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix
echo ''
echo 'Default labels deleted!'


# -----------------------------
# --- Create cancel labels ----
# -----------------------------
echo ''
echo 'Creating "cancel" labels...'
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"c- will not be realized","color":"ffffff"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"c- clone","color":"cccccc"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"c- invalide","color":"e6e6e6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"


# -----------------------------
# - Create depends on labels --
# -----------------------------
echo ''
echo 'Creating "depends on" labels...'
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"d- need Crystale","color":"C05192"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"d- need Parmi","color":"A93177"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"d- need testing","color":"8B195C"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"


# -----------------------------
# -- Create internal labels ---
# -----------------------------
echo ''
echo 'Creating "internal" labels...'
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"i- enhancement","color":"146a87"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"i- help needed","color":"4d90a6"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"i- question","color":"033f53"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"


# -----------------------------
# -- Create external labels ---
# -----------------------------
echo ''
echo 'Creating "external" labels...'
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"x- bug in prod","color":"d2111f"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"x- bug","color":"e93a47"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"x- urgent","color":"83000a"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"








