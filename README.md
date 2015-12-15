# Tournament_Project
This project keeps track of players and matches for a swiss style tournament. A tournament database with a player and match table is created. Players are entered into the player table and are matched according to their standings. Results of matches are entered into the match table.

# Files
- tournament.sql
This files contains sql statements that drops existing tables/views and creates new ones.
- tournament.py
This file contains fuctions used in swiss style tournament.
- tournament_test.py
This file contains test data to test run the tournament.

#Instructions
1. Install Vagrant https://www.vagrantup.com/ 
2. Install Virtual Box https://www.virtualbox.org/ 
3. Clone the fullstack-nanodegree-vm repository https://github.com/udacity/fullstack-nanodegree-vm 
4. In cmd run `vagrant up` then `vagrant ssh` commands
5. Change directory by running `cd /vagrant/tournament`
6. Run `psql` in the cmd
7. Create tournament database by typing and running `CREATE DATABASE tournament;`
8. Connect to tournament database by running `/c tournament;`
9. Create tables/views by typing and running `\i tournament.sql`
10. Run `\q` to exit psql mode
11. Run `python tournament_test.py` to run through tournament test.

