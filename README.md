# AlboTrading-MobileApp
## SETUP INSTRUCTIONS
### For Backend: 
From working directory, run the following commands 

```
cd into plant_app_server
npm install  
```
Then replace the IP in plant_app_server/controller/PostController.js and plant_app_server/controller/UserController.js with your IP.
Replace the username and password for mysql in plant_app_server/models/index.js with yours

Make sure there is an empty schema "cmpe137" created in your mysql database

Finally, to start the server run 

```
node index.js
```

### For Mobile:
Replace the IP in libs/models/DataProvider.dart with your IP.

From working directory, run flutter app from android studio

## PROTOTYPE
[UI Design_AlboTrade Mobile App.pdf](https://github.com/Vinguyen-32/AlboTrading-MobileApp/files/8578550/UI.Design_AlboTrade.Mobile.App.pdf)
## TODO TASKS
## Vi : All
### 0. Setup Database
- [x] Design data schema
- [x] Connect to database
### 1. Register/Signup Page
- [x] Register/Sign up UI design
- [x] Register/Sign up Backend
### 2. Home Page
- [x] Implement DataProvider for Popular Nearby
- [x] Implement DataProvider for New Feeds
- [ ] Implement Search filter
### 3. Bidding Details Page
- [x] Passing data to bidding remaining time
- [x] Get data for the most up-to-date price, local pickup status, and shipping status
- [x] Implement 'Place Bid' function and send 'Bid Amount' data to database
- [ ] Implement 'Add to Wishlist' function 
### 4. Trading Details Page
- [x] Get data for Traded Plants section and render Traded Plants cards.
- [x] Get data for Public Meetup status
- [x] Implement 'Upload Your Plant' function and send 'Plant pictures' data to database
- [ ] Implement 'Add to Wishlist' function 
### 5. User Details Page
- [x] Get data for User Profile (profile pics, followers, following, rating stars, ...)
- [x] Get data for New Post
- [x] Implement 'Create New Post' function 
- [ ] Implement 'Edit Profile' function 
- [x] Get data for and implement the Galery section
