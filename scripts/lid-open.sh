#!/bin/bash
# Handle laptop lid opening - always enable eDP-1

# Always enable eDP-1 when lid opens
hyprctl keyword monitor "eDP-1,2880x1800@120.00100,0x0,2"
