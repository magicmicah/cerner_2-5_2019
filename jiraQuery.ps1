# Script Name: jiraQuery.ps1
# Tag: cerner_2^5_2019

[string] $username = "username"
[string] $password = "password" 
$startAt = 0
$maxResults = 10
$jiraUrl = "https://hostnameforjira/rest/api/2"
$jiraQuery = "search?jql=" ## Put whatever JQL query you would like in here.
$jiraPagination = "startAt=$startAt&maxResults=$maxResults"
$basicAuth = "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($Username):$Password"))
$headers = @{
    "Authorization" = $basicAuth
    "Content-Type"="application/json"
}
$resp = Invoke-RestMethod -Uri "$jiraUrl/$jiraQuery&$jiraPagination" -Method GET -Header $headers
$total = $resp.total
while ($startAt -le $total){
    ## Since we are modifying $startAt, we need to assign $jiraPagination each time in the while loop.
    $jiraPagination = "startAt=$startAt&maxResults=$maxResults"
    $resp = Invoke-RestMethod -Uri "$jiraUrl/$jiraQuery&$jiraPagination" -Method GET -Header $headers
    $issues = $resp.issues
    foreach($issue in $issues){
        $jiraKey = $issue.key
        $jiraSummary = $issue.fields.summary
        $jiraAssignee = $issue.fields.assignee.displayName
        ## Write output of the jira key, summary and assignee. 
        Write-Output "$jiraKey - $jiraSummary - $jiraAssignee"
    }
    ## Increment $startAt and do it over again.
    $startAt = $startAt + 10
}