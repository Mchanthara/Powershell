
$myHashTable=@{
                Key1 = 100
                Key2 = 200
                Mike = "Chanthara"
                Linda = "Irvine"
                Stephen = "Santa Ana"
                Key3 = $true
              }

$myHashTable.GetType()

$myHashTable.Keys
$myHashTable["Mike"]
$myHashTable.key1
$myHashTable.key2

$myHashTable.ContainsKey("key2")  # check for contains key in Hashtable

$myHashTable.ContainsKey("Dave")

$myHashTable.ContainsValue($true)  # contains Value in Hashtable

$myHashTable.Add('key4','Testing my add function')  # how to add value into a hash table
$myHashTable["Key5"]="Add via Square brackets"      # another way to add value to the hash table
$myHashTable.key6="Add via Dot notation"            # Added via dot notation

$myHashTable.Linda="Phoenix"                        # change the value in a Hashtable

$myHashTable.Remove('Linda')                        # remove value in the Hashtable

#################################
### Beginning Custom Objects ####
## 2 ways to create custom objects 

$Employee1 = New-Object -TypeName pscustomobject

Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'EmployeeID' -Value 'N906494'         #Adding a Member is adding property to my CustomObject $Employee1
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'FirstName' -Value 'Mike'             #Adding a Member is adding property to my CustomObject $Employee1
Add-Member -InputObject $Employee1 -MemberType NoteProperty -Name 'Title' -Value "System Administrator" #Adding a Member is adding property to my CustomObject $Employee1

Get-Member -InputObject $Employee1            # Get you all the information ... Name,MemberType,Definition

#############################
## 2nd Way to Create a CustomObject
##############################

$Employee2=[PSCustomObject]@{                         # you can use {Employeeid;FirstName;Title;..with semicolon}
  EmployeeID = '1003'
  FirstName = "Mike"
  Title = "CEO"
      }
            
Get-Member -InputObject $Employee2            # Get you all the information ... Name,MemberType,Definition