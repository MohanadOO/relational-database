#!/bin/bash

PSQL="psql -X --username=postgres --dbname=number_guess --tuples-only --no-align -c"

# Generate Random Number For the Game
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))

# Read user information
echo Enter your username:
read USERNAME

#Search if user exist
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
    # If user don't exist add them to the database and start game
    ADD_NEW_PLAYER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
    echo "Welcome, $USERNAME! It looks like this is your first time here." "$USERNAME"
else 
    # Show existed user information and start game
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start Game!
echo "Guess the secret number between 1 and 1000: "
read USER_GUESS
TOTAL_GUESS=1

# Infinite loop until game finish
while true; do
     # Check if the user input is a number or not
     if [[ $USER_GUESS =~ ^[0-9]+$ ]]
      then
        if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
        then
            # If user guess was higher then the random number 👇
            echo "It's lower than that, guess again:"
            read USER_GUESS
            # Increase user total gueses
            TOTAL_GUESS=$((TOTAL_GUESS+1))
        elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
        then
            # If user guess was lower then the random number 👇
            echo "It's higher than that, guess again:"
            read USER_GUESS
            # Increase user total gueses
            TOTAL_GUESS=$((TOTAL_GUESS+1))
        else   
            # If the guessed number was correct than break the loop!
            echo "You guessed it in $TOTAL_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
            break
        fi
      else 
      echo "That is not an integer, guess again: "
      read USER_GUESS
      fi
done
    # if it's the first user game.
    if [[ -z $GAMES_PLAYED ]]
    then
        GAMES_PLAYED=0
        GAMES_PLAYED=$(( $GAMES_PLAYED+1 ))
        UPDATE_USER_GAMES_PLAEYD=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$TOTAL_GUESS WHERE username='$USERNAME'")
    else 
    GAMES_PLAYED=$(( $GAMES_PLAYED+1 ))

    if  [[ $BEST_GAME -lt $TOTAL_GUESS ]]
    then
        UPDATE_USER_BEST_GAME=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$TOTAL_GUESS WHERE user_id=$USER_ID")
    else 
       UPDATE_USER_GAMES_PLAEYD=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$TOTAL_GUESS WHERE user_id=$USER_ID")
    fi
    fi