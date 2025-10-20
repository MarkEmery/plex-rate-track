# plex-rate-track
A simple Perl script to get the current track and rate 5 stars


Apple Shortcut

The iPhone running SSH via the Shortcut “Five star” has access to the Plex server thanks to WireGuard, other VPNs like Tailscale will work as well.



Getting the Server string

On a system with a full browser such as Firefox or Chrome, log into Plex, open the debug console with Ctrl-Shift-I and click the Network tab.
Change the rating of a song. You should see a URL with ‘rate?’ in it. Grab the part that looks like a hyphenated IP address and long hex string.

Server Script  five-star.pl
See the code.

Script Auth

In the Plex GUI, go to Settings > Network and add your subnet and 127.0.0.1 under ‘List of IP addresses and networks that are allowed without auth’
