ufw allow in on tailscale0
ufw enable
ufw default deny incoming
ufw default allow outgoing
ufw delete 22/tcp
ufw reload
service ssh restart
