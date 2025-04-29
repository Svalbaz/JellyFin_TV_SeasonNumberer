<#
SvalbazNet: TV_SeasonNumberer.ps1

Target:		TV
Use: 		Script looks recursively at all folders in $rootTV for any "Season X" where X is a single digit and pads it with leading zero i.e. "Season 1" becomes "Season 01" to help JellyFin scraping
Reason: 	After a botched start with JellyFin I had to sort the numbering in the Folder Names for TV Show Seasons as scraping in JellyFin is optimised for "Season XX" as opposed to "Season X"

# SAFE MODE: This Script is saved in "SAFE MODE", so by default it will only Write-Host the result,
it will not actually Rename-Item until you remove the -WhatIf
#>

# ----- VARIABLES ----- #
# Path to your TV directory
$rootTV = 		"\\192.168.1.184\TV\TV"

# ----- SCRIPT ----- #
# Get all season folders recursively
Get-ChildItem -Path $rootTV -Directory -Recurse | ForEach-Object {
    # Check if folder name matches "Season X" where X is a single digit
    if ($_ .Name -match '^Season ([1-9])$') {
        $seasonNumber = $Matches[1].PadLeft(2, '0')  # Pad with leading zero
        $newName = "Season $seasonNumber"

        # Build the new path
        $newPath = Join-Path -Path $_.Parent.FullName -ChildPath $newName

        # Rename the folder
        Write-Host "Renaming '$($_.FullName)' to '$newPath'"
        Rename-Item -Path $_.FullName -NewName $newName -WhatIf # SAFE MODE: REMOVE -WhatIf to Rename-Item
    }
