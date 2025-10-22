# plex-rate-track

PlexAmp's Siri integration allows users to pick songs or artists to play, play, stop or skip the current track with spoken instructions.
It's ideal for hands-free operation while driving for reasons that shouldn't need explaining.
One thing it can't do, is allow users to rate the tracks. This is where a simple script and the Plex API comes in.
When run, the Perl script uses the API to find the track being played by the configured user and rates it 5 stars.
It's assumed that WireGuard, Tailscale or another VPN is being used, allowing direct SSH access from the iPhone to the server running Plex.
It is also assumed that Perl and curl are installed on the server. The author is using Linux, but other platforms should be possible with minor tweaks.

**Apple Shortcut**

Set up a shortcut as per the screenshot below and name it 'Five Star'. When needed, saying 'Hey Siri, Fire Star' will run it. A spoken acknowledgement will be returned.

<img width="320" alt="IMG_2797" src="https://github.com/user-attachments/assets/c1051650-a560-4ebd-badb-66e864cd7980" />
<img width="320" height="1389" alt="IMG_2512" src="https://github.com/user-attachments/assets/1112a48c-0cdf-4f57-a0fa-d238fbd2f744" />

**Getting the Server string**

On a system with a full browser such as Firefox or Chrome, log into Plex, open the debug console with Ctrl-Shift-I and select the Network tab.
Next, change the rating of a song. In the list of URLs visited, you should see a URL with ‘rate?’ in it.
Grab the part that looks like a hyphenated IP address and long hex string.

**Server Script five-star.pl**

Download the five-star.pl from this repo and update the values for $server and $client, ensuring you keep the .plex.direct:port part of the URL, and make port the .
Note that Plex uses a rating system allowing half stars, but internally uses integers, so 1 stars is 2, 5 stars is 10.
If the user wants to rate tracks with other values, similar Apple Shortcuts and scripts are needed, one set per rating level.

**Script Auth**

In the Plex GUI, go to Settings > Network and add 127.0.0.1 under ‘List of IP addresses and networks that are allowed without auth’. If you have issues, add your local LAN subnet to the list.

**Debugging**

If Siri responds with "Done" or "That's done", check that the shortcut doesn't have any elements such as 'Shell Script Result' or 'Text' in red. If it does, correct them until they're blue.
