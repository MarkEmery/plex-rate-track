# plex-rate-track

PlexAmp's Siri integration allows drivers to pick songs or artists with spoken Siri instructions, play, stop or skip tracks.
It's ideal for hands-free operation while driving. One thing it can't do, is allow users to rate the tracks. This is where this simple script comes in.
When run, the Perl script finds the track being played by the configured user and rates it 5 stars. Note that Plex uses a rating system allowing half stars, but internally uses integers, so 1 stars is 2, 5 stars is 10.
It's assumed that WireGuard, Tailscale or another VPN is being used, allowing direct SSH access from the iPhone to server.

**Apple Shortcut**

Set up a shortcut as per the screenshot below and name it 'Five Star'. When needed, a 'Hey Siri, Fire Star' will run it.

<img width="320" alt="IMG_2797" src="https://github.com/user-attachments/assets/c1051650-a560-4ebd-badb-66e864cd7980" />
<img width="320" height="1389" alt="IMG_2512" src="https://github.com/user-attachments/assets/1112a48c-0cdf-4f57-a0fa-d238fbd2f744" />

**Getting the Server string**

On a system with a full browser such as Firefox or Chrome, log into Plex, open the debug console with Ctrl-Shift-I and click the Network tab.
Next, change the rating of a song. In the list of URLs visited, you should see a URL with ‘rate?’ in it.
Grab the part that looks like a hyphenated IP address and long hex string.

**Server Script five-star.pl**

Download the five-star.pl from this repo and update the values for $server and $client, ensuring you keep the .plex.direct:port part of the URL.

**Script Auth**

In the Plex GUI, go to Settings > Network and add your subnet and 127.0.0.1 under ‘List of IP addresses and networks that are allowed without auth’

**Debugging**

If Siri responds with "Done" or "That's done", check that the shortcut doesn't have any elements such as 'Shell Script Result' or 'Text' in red. If you do, reset them so they're blue.

