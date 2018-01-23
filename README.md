# project-gmail
Repo for THP's gmail ex

## Before we get started ...

**What these programs does ?**


 1. "scrapping.rb"
  
   This program is getting all the email addresses available on :
   
   [L'annuaire des maires du Val d'Oise](https://annuaire-des-mairies.com/val-d-oise.html)

   [L'annuaire des mairies de Seine st Denis](http://annuaire-des-mairies.com/seine-saint-denis.html)

   Then it sends them to a google doc/sheet [over there](https://docs.google.com/spreadsheets/d/1M1vJ2XhdkrV2JvmHb5RauwYmHlHWv1k-AbdXTFx7Ti8/edit#gid=0) .... it is 225 emails (40 for the 93 and 185 for the 95)

 2. "send_email.rb"

   This program reads the list of emails contained in the second column of a google doc/sheet and uses the gmail gem to send a mail to them 

   In order to use it you need to enter your email address and your corresponding password when asked (don't worry if you don't see your password typed it's because I'm using a password field)


**!!! WARNING !!! PLEASE USE YOUR OWN ```config.json``` INSTEAD OF THE ONE GIVEN (WICH IS EMPTY BTW) !!!**

## If it doesn't work ... for some reason

**Please don't be a screwdriver ... give me a call**



you can contact me on slack @mati I always have time to check with you where the problem can be :-)


