# cerner_2-5_2019

Cerner's coding competition in celebration of Programmers Day.

## Basic Rules

1. 32 lines of code or less (comments don't count)
2. Add "cerner_2^5_2019" as a comment to code submission.
3. Make sure the code works.
4. 1 submission a day between September 13 - October 14.

## Submissions

### Invoke-HunterConfirmation.ps1
I bought a Hunter Ceiling Fan with smart control features. The app is stuck in a loop on sign-in by confirming your email. I read online that other people with similar issues encountered similar issues. One person de-compiled the apk and found a way to submit a json token to get it to work. He used postman, but I chose to use PowerShell. It worked and I can get into the app now. If I could improve upon this in any way, I would add error handling but for a simple PUT to a rest endpoint, this did the trick.

Reference: https://davidmburke.com/2019/06/01/how-to-set-up-a-hunter-fan-wifi-control-by-decompiling-their-app/
