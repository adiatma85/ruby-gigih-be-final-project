# README

Assalamualaikum Warahmatullahi Wabarakatuh

In this simple documentation, I like to explain the following:

- Depedencies that I need
- Development approachment that I use
- My Database Design
- How I work
  - Test
    - Model
    - Controller
    - Routing
  - Model
  - Controller
  - Views
- How the hell this thing running? 
- Some screenshots


## Depedencies that I need
I grouped some depedency, for ``:development`` and ``:test`` environment, I use the following:
- "rspec-rails"
- "factory_bot_rails"
- "faker"
- 'rails-controller-testing'

All of them needed for testing, especially for ``rspec`` framework
By the way, you can run the testing with ``rspec --fd`` like this:

![image](https://user-images.githubusercontent.com/57523711/164808455-29f5292f-dfcb-4722-b742-f359407ec665.png)

If there is no code breaks (I hope, please God, I did not have sleep for two days straight), you got this:
![image](https://user-images.githubusercontent.com/57523711/164809304-f74f27b2-fed2-4c74-b9a0-fc8a0fae5f02.png)

The other depedencies that I use are:
- 'bootstrap', '~> 4.5.2'
- 'jquery-rails'

Both of them used by views for easy to create simple admin panel UI.

Special thanks to ADMIN LTE. I use it for Admin Panel Template.

## Development Approach that I use
I use Test-Driven Development. As you can see from my commit history, I use grouped commit message with explanation as the following:
- Test --> ``test:...`` it means that I commit file for test/spec
- Generate --> ``generate:...`` it means that I commit file from rails generate
- Modify --> ``modify:...`` it means that I modifying some file, especialli in ``app/``
- Moving --> ``moving:...`` this will be lot in replit, because I originally work this at my local device, so I will move it one by one
- Bugfix/fix --> ``fix:...`` it means that after I found bug, I fix it with this commit

## My Database Design
![image](https://user-images.githubusercontent.com/57523711/164815784-c3753777-fef5-4c87-8afb-0e52eab8f9c3.png)


## How I Work
- Test (for the sake of God, I spent many hours to make valid test and pass it)
  - Model
    You can see my model spec at ``spec/models/..._spec.erb`` those tests validating some scenario in model
    Almost all of my test in model use to ``validate attribute``
  - Controller
    Special case for this one, this type of test got ther own gem (as you can see above).
    I use this to check some scenarion (even the weird one) in controller scope
  - Routing 
    Last, it's routing test where it can be generated from ``rails generate scaffold name_of_scaffold``

## How the hell this thing running?
In the nutshell:
  - ``rails s`` to run the server (if it run in your device, it should be at "localhost:3000")
    ![image](https://user-images.githubusercontent.com/57523711/164814415-84af761d-664b-4208-bb63-af2e642b1fc4.png)
  - After that, access ``/menus`` you should see something like this
    ![image](https://user-images.githubusercontent.com/57523711/164814514-2f5ffa2e-9992-483f-b60a-1368909376ff.png)
    
    As you can see in lef sidebar, you can click them to move to another table, for example if you click ``Category Tables``, you should see something like this
    ![image](https://user-images.githubusercontent.com/57523711/164814673-4036a529-068c-4e37-bfe8-941c18067114.png)

  I think it is pretty easy from there, you can change from table to another table, try the CRUD feature, and so on.
  
  Oh, I almost, but in the sidebar, you can ``Report Tables``. Report Tables is, in the nutshell is filtered tables.
  - Filtered by email (you can insert the email in the form)
  - Filtered by value (you can insert the minimal ``total`` value for Order)
  - Filtered by date (you can insert ``date_start`` and ``date_end``
  
  The catch is, as a Client or consumer of API, we like to our data is filtered according to us, so I make indivual filter (for now) to at least try to understanding how Ruby on Rails works.
  
## Some Screenhsots
- Filter by email
  ![image](https://user-images.githubusercontent.com/57523711/164815491-227d3588-ef0e-410d-8d94-fbe6f25ddccb.png)
  comparison with regular order table
  ![image](https://user-images.githubusercontent.com/57523711/164815670-ed68c09b-be99-44bd-b02b-032911f6727d.png)
