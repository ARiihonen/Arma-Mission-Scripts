params ["_helo"];

//pop up a confirmation dialogue: this will end mission for everyone in the helicopter, and anyone left on the island will be left to their own luck

//variables for everyone in the helicopter: finished 'side', everyone in the team not in the helo: left behind

//make helicopter fly away, set helicopter var: not available, put everyone in helicopter into the spectator and bump them into their own group (spectator only includes groups inside the area that don't have 'away' variable true)
