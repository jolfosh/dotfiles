#!/usr/bin/env bash
# Hyprland lid-switch handler.
#
# DOCKED (an external monitor is present): on lid close, power the internal
# panel down with DPMS; on open, power it back up. We use DPMS (a power-state
# toggle) on purpose, NOT `monitor eDP-1,disable`:
#   * `disable` removes eDP from the layout, so unplugging the dock while closed
#     leaves Hyprland headless, and re-enabling the sole panel on open wedges the
#     i915 (Meteor Lake) display engine -> black screen.
#   * DPMS keeps eDP in the layout (just powered off), so undocking-while-closed
#     can't strand it, and open is a no-modeset power-on. DPMS is already proven
#     safe on this machine (hypridle uses it for the idle timeout).
#
# UNDOCKED: do nothing on close and let logind suspend (suspend/resume is
# healthy). On open, just make sure the panel is powered on.
set -euo pipefail

EDP="eDP-1"

has_external() { hyprctl monitors -j | jq -e 'any(.[]; .name != "'"$EDP"'")' >/dev/null 2>&1; }

case "${1:-}" in
  close)
    # Docked: blank the laptop panel (power only). Undocked: leave it; logind suspends.
    if has_external; then hyprctl dispatch dpms off "$EDP"; fi
    ;;
  open)
    # Always make sure the panel is powered back on (idempotent if already on).
    hyprctl dispatch dpms on "$EDP"
    ;;
  *)
    echo "usage: $0 {open|close}" >&2; exit 2 ;;
esac
