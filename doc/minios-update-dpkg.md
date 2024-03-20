# MiniOS dpkg Database Builder Manual

## NAME
**MiniOS dpkg Database Builder** - manual page for MiniOS dpkg Database Builder

## SYNOPSIS
`minios-update-dpkg [BUNDLES-MOUNT-POINTS-LOCATION] [OPTIONAL: CHANGES_LOCATION]`

## DESCRIPTION
Builds a common dpkg database from all bundles.

## OPTIONS
This script does not accept options, it takes in two positional parameters:
1. `BUNDLES-MOUNT-POINTS-LOCATION` - location of the bundle mount points.
2. `OPTIONAL: CHANGES_LOCATION` - location of changes (optional).

## Building dpkg Database
1. Run the script using sudo or as root user.
2. Specify the location of the bundle mount points as a mandatory argument.
3. Optionally, specify the location of changes as the second argument.

## EXAMPLES
- `minios-update-dpkg /run/initramfs/memory/bundles /run/initramfs/memory/changes`
