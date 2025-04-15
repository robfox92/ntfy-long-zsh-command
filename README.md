# ntfy-long-zsh-command

## Installation

Download the script to plugin directory:

```zsh
curl -sSL https://raw.githubusercontent.com/robfox92/ntfy-long-zsh-command/refs/heads/main/ntfy-long-command.zsh > /path/to/plugin/dir/ntfy-long-zsh-command.zsh
```

Add the following to `~/.zshrc`:

```zsh
source /path/to/plugin/dir/ntfy-long-zsh-command.zsh
```

Run the following to load the plugin:

```zsh
source ~/.zshrc
```

## Configuration

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
