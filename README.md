## Basic Bank System with Cool UI

### Rive Dash Animation
![Dash rive](https://github.com/yeasin50/BasicBankSystem/blob/master/output/particlesBG_2.gif)
-  [dash_rive.dart](https://github.com/yeasin50/BasicBankSystem/blob/master/lib/screens/dash_rive.dart)  

### Coin Design
![Coin](https://github.com/yeasin50/BasicBankSystem/blob/master/output/coin.png)

- [coin.dart](https://github.com/yeasin50/BasicBankSystem/blob/master/lib/widgets/coin.dart)

- [with Animation](https://github.com/yeasin50/BasicBankSystem/blob/7f3c81856c058614770d3b8995d0eb6ee3b17b31/lib/screens/loading_screen.dart#L171-L183)  
  

- [Profile Pic Decoration](https://github.com/yeasin50/BasicBankSystem/blob/master/lib/widgets/neon_container.dart)


- [BackGround](https://github.com/yeasin50/BasicBankSystem/blob/master/lib/widgets/particles_bg.dart)
  
### adjust number of particles 
- [replace numberOfParticles ](https://github.com/yeasin50/BasicBankSystem/blob/39ec565366b4bac718aa13514e45a470cc3cd1ae/lib/widgets/particles_bg.dart#L37)
- OR
- [particle.dart](https://github.com/yeasin50/BasicBankSystem/blob/master/lib/models/particle.dart#L35)
-----
<font size=4.5> Task 2: Basic Banking App </font>  
&nbsp;  ◇ Create a simple mobile app which has the following specs. 

&nbsp;  ◇ Start with creating dummy data in mobile (sqlite) database for upto 10 users. User table will have basic fields such as
`name, email, current balance` etc. Transfers table will record
all transfers happened.  `need to work with it`

```
◇ Flow:
*  Home Screen > 
-  View all Customers> 
-  Select and View one Customer> 
-  Transfer Money>  
-  Select customer to transfer to > 
*  View all Customers.  
```
&nbsp; ◇ No Login Page. No Customer Creation. Only transfer of money
between multiple customers .

---- 
### later while sdk fix
<font size=4.5>Task 5: Social Media Integration </font>

&nbsp;  ◇ Create a mobile app, where user can login through at least
two social media from such as `Facebook and Google.`  
&nbsp;   ◇ After login, display all the details on the second page.
```
- Name, 
- profile photo,
- email
- more....
```
----- 


----
let's think about water drop effect for UI or partivles flow
having trouble because all packages doesnt support null safelty 

so we can run using this 

```
$ dart --no-sound-null-safety run   
$ flutter run --no-sound-null-safety
```

Rive2 doesnt have many things like flare/rive. we need make reverse method. also contrains doesnt support on rive2 -_-


Colors 
`#4364A1​ facebook  `
`#DF513B​ google  `



## Getting Started
while flutter v2 support web on stable channel, we will use stable channel, for window,linux+.. use beta and read doc

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
