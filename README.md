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