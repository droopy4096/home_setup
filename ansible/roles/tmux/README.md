## Configuration of background Tmux processes

In modern distributions `systemd` kills off all user processes upon last logout. 

I require my `tmux` to run past logouts etc. So we'll [[re]]configure system to do just that - leave my processes alone upon logout.
