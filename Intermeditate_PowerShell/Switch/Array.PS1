Set-StrictMode -Off
$myArray=@("test1",'test2',"test3")
#$myArray=@(Index0,Index1,Index2,....)
$myArray[0]

# $myArray.Add("test4")  Wrong! fixed sized

$myArray = $myArray+"Test4"  # One way to add item to an array

$myArray = $myArray+="test5" #2nd way to an item to an array




#How to remove items from an Array

$myArray = $myArray -ne "Test2" # Setting any instances of Test2 be removed from array.. limitations
$myArray
$myArray.Count

############################################
# Array List lot easier to use
#Creating an Array list
$myList1=[System.collections.ArrayList]@()
$myList1.Gettype()

$myList2=New-Object -TypeName System.Collections.ArrayList  #new way performance faster here

$myList2.GetType()  # new way

$myList2.IsFixedSize  # will come back False meaning now you can use .ADD to your array List

$myList2.Add("Test1")
$myList2.Add("Test2")
$myList2.Add("Test3")
[void]$myList2.Add("Test4")   # use void to turn off Index Output

$myList2.AddRange(@("Test6","test7","test8"))

$myList2[2]   # will output on index 2

$myList2.Remove("Test1")

$myList2.RemoveRange(0,2)


###########################################

$array=@()
Measure-Command -Expression {@(0..50000).ForEach({$array+=$_})}

$arrayList=New-Object -TypeName System.Collections.ArrayList 
Measure-Command -Expression {@(0..50000).ForEach({$arraylist.Add($_)})}  # key is .ADD makes it run faster for 50k item set

$arrayList=New-Object -TypeName System.Collections.ArrayList 
Measure-Command -Expression {@(0..50000).ForEach({$arraylist.Add($_)})}

