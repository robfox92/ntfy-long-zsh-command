# ntfy-long-zsh-command

Notifies you (via [ntfy.sh](https://github.com/binwiederhier/ntfy)) once a long-running command completes. The following params are used:
- NTFY_EXCLUDE: Names of commands to never notify you for. You probably don't care about when your ssh session ends because you've probably just logged out.
- NTFY_MIN_SECONDS: Minimum execution time (in seconds) before you get notified. If this is 300 (default), you'll not get a notification unless the command takes >300 seconds to return
- NTFY_URL: where should we send the notification to?

To overwrite the defaults, set the following in your .zshrc:

```zsh
typeset -g NTFY_MIN_SECONDS=600
typeset -g NTFY_URL="https://my_private_ntfy_instance.xzy/my_ntfy_topic"
typeset -g NTFY_EXCLUDE=(ssh)
```
