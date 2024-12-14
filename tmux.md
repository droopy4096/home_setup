# Configuring Tmux

## Persistence

`systemd` by default is configured to killing *all* user processes upon log out, including background running `tmux` or `screen`. To get back old behaviour several things need to be fixed.

### /etc/systemd/logind.conf

```
[Login]
KillUserProcesses=no
KillExcludeUsers=root,<myusername>
```

### allow lingering

```shell
loginctl enable-linger
```

### Starting tmux server as a user service upon boot

Based on [stack exchange post](https://unix.stackexchange.com/a/662443)

```bash
mkdir -p ${HOME}/.config/systemd/user

cat > ${HOME}/.config/systemd/user/tmux-server.service << EOF
[Unit]
Description=tmux server

[Service]
Type=forking
ExecStart=/usr/bin/tmux -f %h/.config/tmux/server.conf start-server
ExecStop=/usr/bin/tmux kill-server

[Install]
WantedBy=default.target
EOF

cat > /home/tom/.config/tmux/server.conf  << EOF2
set -s exit-empty off
set -s exit-unattached off
source ~/.tmux.conf
EOF2

systemctl --user start tmux-server
```


