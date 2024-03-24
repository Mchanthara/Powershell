Get-Date
Get-Date -DisplayHint Time

# Get Universal Time

Get-Date -AsUTC -Format "yyyy-MM-dd HH:mm"

$Date=Get-Date
$Date.GetType()  # Datetime
$Date.ToUniversalTime()  #or 
(Get-Date).ToUniversalTime()

# Get date in custom formatting  UFormat and Format option
# dddd is day of the week
# K capitol is time zone difference
$Dates=Get-Date -Format "yyyy-MM-dd HH:mm:ss dddd K"
$Dates.GetType() # is string

# Variable Wrapper $()
# Use: perhaps setting a trigger for your script to run something on that day of the month or year
Get-Date -UFormat "%Y-%m-%d"
Get-Date -Year 2022 -Month 12 -Day 12 -Hour 12 -Minute 30

(Get-Date -Year 2022 -Month 12 -Day 12 -Hour 12 -Minute 30).DayOfYear

(Get-Date).DayOfYear


##### 
# Time Stamp for export files for logging options to your script

Get-Date -Format "yyyy-MM-ddTHH:mm:ss"

Get-Date -UnixTimeSeconds 1
# Wednesday, December 31, 1969 5:00:02 PM








