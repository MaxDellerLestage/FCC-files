#!/bin/bash



PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUM=$((1 + RANDOM % 1000))
echo -e "\nEnter your username:"
read USERNAME

GET_GUESS() {
  
  NUM=$1
  NUM_GUESSES=$2
  USERNAME=$3
  INPUT=$4

  if [[ $NUM_GUESSES == 0 ]]
  then
    USER=$($PSQL "select user_id from users where username='$USERNAME'")
    if [[ -z $USER ]]
    then
      echo "Welcome, $USERNAME! It looks like this is your first time here."
      INSERT_USER=$($PSQL "insert into users(username, games_played, best_game) values('$USERNAME', 0, 0)")
      USER=$($PSQL "select user_id from users where username='$USERNAME'")
      GAMES_PLAYED=$($PSQL "select games_played from users where user_id=$USER")
      BEST_GAME=$($PSQL "select best_game from users where user_id=$USER")
    else
      GAMES_PLAYED=$($PSQL "select games_played from users where user_id=$USER")
      BEST_GAME=$($PSQL "select best_game from users where user_id=$USER")
      echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    fi
    echo "Guess the secret number between 1 and 1000:"
    read INPUT
  fi

  
 

  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    ((NUM_GUESSES += 1))
    echo "That is not an integer, guess again:"
    read INPUT
    GET_GUESS $NUM $NUM_GUESSES $USERNAME $INPUT
  elif [[ $INPUT -eq $NUM ]]
  then
    ((NUM_GUESSES += 1))
    
    ((GAMES_PLAYED += 1))
    INSERT_GAMES=$($PSQL "update users set games_played=$GAMES_PLAYED where user_id=$USER")
    if [ $BEST_GAME -eq 0 ] || [ $NUM_GUESSES -lt $BEST_GAME ]
    then
      INSERT_GUESS=$($PSQL "update users set best_game=$NUM_GUESSES where user_id=$USER")
    fi
    echo "You guessed it in $NUM_GUESSES tries. The secret number was $NUM. Nice job!"
  elif [[ $INPUT -lt $NUM ]]
  then
    ((NUM_GUESSES += 1))
    echo "It's higher than that, guess again:"
    read INPUT
    GET_GUESS $NUM $NUM_GUESSES $USERNAME $INPUT
    
  elif [[ $INPUT -gt $NUM ]]
  then
    ((NUM_GUESSES += 1))
    echo "It's lower than that, guess again:"
    read INPUT
    GET_GUESS $NUM $NUM_GUESSES $USERNAME $INPUT
  fi
}

GET_GUESS $NUM 0 $USERNAME

