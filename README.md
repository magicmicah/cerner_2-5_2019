# cerner_2-5_2019

Cerner's coding competition in celebration of Programmers Day.

## Basic Rules

1. 32 lines of code or less (comments don't count)
2. Add "cerner_2^5_2019" as a comment to code submission.
3. Make sure the code works.
4. 1 submission a day between September 13 - October 14.

## Submissions

### 1. Invoke-HunterConfirmation.ps1
I bought a Hunter Ceiling Fan with smart control features. The app was stuck in a loop on sign-in when confirming your email. I read online that other people with encountered similar issues. One person de-compiled the apk and found a way to submit a token to get it to work. He used Postman for his example, but I chose to use PowerShell. It worked and I can get into the app now. If I could improve upon this in any way, I would add error handling but for a simple PUT to a rest endpoint, this did the trick.

Reference: https://davidmburke.com/2019/06/01/how-to-set-up-a-hunter-fan-wifi-control-by-decompiling-their-app/

### 2. Start-LoadTest.ps1
Occasionally, I need to hit a URL for testing of load into APM tools like AppDynamics. It helps to generate some load against that endpoint, so I will use a simple powershell function that repeatedly hits that endpoint. Can be executed like so:

Start-LoadTest -url "http://google.com" -iterations 5

It can also be silenced with a -silent flag:

Start-LoadTest -url "http://google.com" -iterations 5 -silent


### 3. Find-Property
I had a need to search through several property files to audit a setting. Find-Property is built so that it will return content of all the files within a directory and return those results back.

Find-Property -directory C:\temp\files -property property.name

### 4. Get-Productive

I was thinking about what is the spirit of engineering productivity and that often comes down to focus. The pomodoro technique is a time management system that encourages you to work with the time you have. Get-Productive asks you "How many minutes do you want to be productive?" and then with the right input it goes into the background and you can "get productive". For a little fun, I added an array of motivational/productive quotes that will print every five minutes and remind you how many minutes have gone by so far. When the timer completes, a pop up window comes up wishing your time was well spent. 

### 5. cerner.c

Sometimes to be more productive, you need to step back and have a little fun. I follow a subreddit called ProgrammerHumor. It's fun to be able to see what other programmers see on a daily basis while keeping their sense of humor. One post in particular had me chuckling and I thought this would be a good contribution for obsfucated code. 

https://www.reddit.com/r/ProgrammerHumor/comments/d7up1h/a_friend_started_programming_in_c_and_sent_me/

That's how cerner.c was born. It's functional, executes, does nothing except remind you that just because you can, doesn't mean you should. 

### 6. jiraQuery.ps1

This is a hack I put together to query jira based on any JQL you give it. It uses pagination to gather the total results returned and then uses a while loop to ensure all items are returned. Basic output of this script will Write-Output of the jira key, summary and assignee. There are thousands of more fields that could be uses to gather data and I intend to do that. It is not a function, so a username/password has to be inserted into the script, as well as the jira server and JQL query. Not ideal but for getting the basic logic done for what I intend to do with it, I'm pretty happy. 

### 7. Add-UserToLocalGroup

When managing users, you sometimes need to add them to a local group on servers you own. This function is meant to be iterative over a group of servers but can be used with one server. Invoke it like so:

Add-UserToLocalGroup -server SERVER -user USERNAME -domain DOMAIN -group GROUP

Special note: You need to be an administrator over the servers you are adding them to. :)

### 8. Invoke-Download
It's been a busy month and I have not made as many submissions as I would like. Noticing this, I went back into my list of scripts and found this gem. Invoke-Download is useful for when you need some catch exceptions and verification around downloading files. For example, below will download a remote file to local C:\temp directory:

Invoke-Download -Uri "http://ipv4.download.thinkbroadband.com/1MB.zip" -OutFile C:\temp\file.zip

By default there is no output, maybe I need one but it's not necessary. When I add a -Verify flag, I am returned a SHA256 hash of the downloaded file:

Invoke-Download -Uri "http://ipv4.download.thinkbroadband.com/1MB.zip" -OutFile C:\temp\file.zip -Verify SHA256
9F88DCF33BB76FF0A410B5A44EE962A1E99FA45B3AC849E28F68D935A4E7B618

This is extremely useful if I need to verify against a known hash. I can use all the available verifications that Get-FileHash supports to get a different hash. 

### 9. Restart-Device

On occasion, my Cerner device will have issues with changing the brightness. While the UI shows the slider changing with the brightness, the brightness level stays the same. Researching the issue, I did not find a fix from Dell, however a workaround that I could script with PowerShell. I decided to make it functional for any device so anything could be restarted with it like so:

Restart-Device -deviceName "Intel(R) UHD Graphics 630"

What this will do is use Disable-PnpDevice and Enable-PnpDevice to essentially restart the device given from input. I surely could use some better error handling with this, but it works until I can find the right fix for the brightness keys. 
