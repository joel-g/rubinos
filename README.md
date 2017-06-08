# rubinos
##### Stalk your friend's Domino's orders so you never miss out on a pizza party

### Command line usage

``` ~/ruby rubino.rb <mode> <delay> ```

modes:  
	```test``` - Run only on your test phone numbers  
	```once``` - Run through your contacts.csv once checking for pizza orders  
	```loop``` - Continually loop through your contacts with a 30 minute wait between checks  

delay:  
```1-999``` - delay (in seconds) between checking each of your friends. Reccomended: 60 to spare your bandwidth.  
```1-999``` - delay (in minutes) between starting your friends list over. (Only in ```loop``` mode)  