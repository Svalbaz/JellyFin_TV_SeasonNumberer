# JellyFin_TV_SeasonNumbering

# SvalbazNet: TV_SeasonNumberer.ps1

## Target
TV

## Description
This script looks recursively at all folders in `$rootTV` for folders named "Season X" (where X is a single digit) and renames them to "Season 0X" (i.e., "Season 1" becomes "Season 01"). This helps ensure compatibility with JellyFin's scraping engine, which expects a "Season XX" format.

## Purpose
After a problematic initial setup with JellyFin, this script was created to fix season folder naming conventions to ensure proper scraping of TV shows. JellyFin handles "Season XX" (with two digits) more efficiently than "Season X."

## Safe Mode
This script runs in "SAFE MODE" by default. It will display the intended renaming actions (`Write-Host`) without renaming the actual folders. To apply the changes, remove the `-WhatIf` parameter.

## Usage
Run the script in your TV library folder to preview the renaming results. To rename the folders, remove the `-WhatIf` flag.
