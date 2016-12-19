#!/bin/bash
WKNAME=$1
echo workspace name given is $WKNAME
if i3-msg -t get_workspaces | jq ".[] | .name" | grep -q -w $WKNAME; then
  i3-msg "workspace $WKNAME"
else
  i3-msg "workspace $WKNAME; append_layout ~/.i3/empty_workspace.json"
fi
