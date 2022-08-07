NTFY_EXCLUDE=(vim ssh tmux watch)
NTFY_MIN_SECONDS=600
NTFY_URL="https://ntfy.sh/my-topic"

function ntfy_preexec() {
  # executed between when you press enter on a command prompt 
  # but before command is executed
  if [ -n "$NTFY_EXCLUDE" ]; then
    # NTFY_EXCLUDE is defined
    NTFY_CMD="$1"
    for exc in $NTFY_EXCLUDE; do
      if [ "$(echo $NTFY_CMD | grep -c "$exc")" -gt 0 ]; then
        # this command is excluded
        return
      fi
    done
  fi
  NTFY_TIMER=${NTFY_TIMER:-$SECONDS}
}


function ntfy_precmd() {
  # executed before prompt is displayed 
  if [ $NTFY_TIMER ]; then
    NTFY_DURATION=$(($SECONDS - $NTFY_TIMER))
    if [[ $NTFY_DURATION -gt $NTFY_MIN_SECONDS ]]; then
      local ntfy_payload="command \""$NTFY_CMD"\" on "$(hostname)" complete (took "$NTFY_DURATION" seconds)"
      curl  -d $ntfy_payload \
            -H "Tags: "$(hostname)""
            $NTFY_URL
    fi
    unset NTFY_TIMER
    unset NTFY_CMD
  fi
}
precmd_functions=("${(@)precmd_functions:#ntfy_precmd}")
precmd_functions+=(ntfy_precmd)
preexec_functions=("${(@)preexec_functions:#ntfy_preexec}")
preexec_functions+=(ntfy_preexec)
