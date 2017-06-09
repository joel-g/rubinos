# rubinos
##### Stalk your friends' Domino's orders so you never miss out on a pizza party

### Command line usage

``` ~/ruby rubino.rb <mode> <each_delay> <loop_delay>```

mode:  
	```test``` - Run only on your test phone numbers  
	```once``` - Run through your contacts.csv once checking for pizza orders  
	```loop``` - Continually loop through your contacts with a 30 minute wait between checks  

each_delay:  
```1-999``` - Delay (in seconds) between checking each of your friends. Default if not entered: 60 to spare your bandwidth.

loop_delay
```1-999``` - Delay (in minutes) between starting your friends list over. Only in ```loop``` mode. Default if not entered: 45 minutes.  



NOTE: You must supply a friends.csv file formated: ``` name, 10-digit-phone ``` 
