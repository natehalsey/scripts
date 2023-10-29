git config --global user.email "halseyng@outlook.com"
git config --global user.name "natehalsey"
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey "$(cat ~/.ssh/id_rsa.pub)"
