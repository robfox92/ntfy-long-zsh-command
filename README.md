# ntfy-long-zsh-command

Notifies you (via ntfy.sh) once a long-running command completes. The following params are used:
- NTFY_EXCLUDE: Names of commands to never notify you for. You probably don't care about when your ssh session ends because you've probably just logged out.
- NTFY_MIN_SECONDS: Minimum execution time (in seconds) before you get notified. If this is 600 (default), you'll not get a notification unless the command takes >600 seconds to return
- NTFY_UTL: where should we send the notification to?
