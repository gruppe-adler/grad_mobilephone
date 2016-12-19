# grad-telephone

## concept for mobile phone system for TFAR

### main idea
use disabled rifleman radio which is enabled and set to unique frequency for transmission

### interaction
* mobile phone interface is used for number input
* numbers can be put in manually or saved into a list
* dialing takes some seconds with audio feedback
* transmission starts as soon as other guy picks up, dial tone is played in the meantime
* transmission is cancelled if target doesnt pick up in time (10s)
* transmission is open until closing input (probably UI)
* if target is already in a transmission, no connection can be established and OCCUPIED-sound signal is played
