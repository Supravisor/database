
#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# random number generator
#SECRET_NUMBER=$(( RANDOM% 1000 + 1 ))
SECRET_NUMBER=5

  WELCOME() {
    
  echo Enter your username:
  read USERNAME

  # search for user in the database
  PLAYER_NAME=$($PSQL "SELECT username FROM guesses WHERE username='$USERNAME'")

  # welcome player
  if [[ -z $PLAYER_NAME ]]
  then
    # insert new player into the database
    INSERT_PLAYER=$($PSQL "INSERT INTO guesses(username, games_played, best_game) VALUES('$USERNAME', 0, 0)")
    echo Welcome, $USERNAME! It looks like this is your first time here.
  else
    # welcome existing player
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM guesses WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_game FROM guesses WHERE username='$USERNAME'")
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
  fi
  }

WELCOME

NUMBER_OF_TRIES=1
echo Guess the secret number between 1 and 1000:

  GUESSING_GAME() {
  read GUESS

  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS == $SECRET_NUMBER ]]
    then
      # store game information
        BEST_GAME_RESULT=$($PSQL "SELECT best_game FROM guesses WHERE username='$USERNAME'")
        GAMES_PLAYED=$($PSQL "SELECT games_played FROM guesses WHERE username='$USERNAME'")
        if [[ $BEST_GAME_RESULT == 0 ]]
        then
          UPDATE_BEST_GAME=$($PSQL "UPDATE guesses SET best_game='$NUMBER_OF_TRIES' WHERE username='$USERNAME'")
          UPDATE_NEW_GAME=$($PSQL "UPDATE guesses SET games_played=1 WHERE username='$USERNAME'")
        else
          (( GAMES_PLAYED++ ))
          NEW_GAME_RESULT=$($PSQL "UPDATE guesses SET games_played='$GAMES_PLAYED' WHERE username='$USERNAME'")
          if [[ $NUMBER_OF_TRIES < $BEST_GAME_RESULT ]]
          then
            UPDATE_BEST_GAME=$($PSQL "UPDATE guesses SET best_game='$NUMBER_OF_TRIES' WHERE username='$USERNAME'")
          fi
        fi
      echo You guessed it in $NUMBER_OF_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!
    elif [[ $GUESS > $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      (( NUMBER_OF_TRIES++ ))
      GUESSING_GAME
    elif [[ $GUESS < $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      (( NUMBER_OF_TRIES++ ))
      GUESSING_GAME
    fi
  else
    echo That is not an integer, guess again:
    GUESSING_GAME
  fi

  }

GUESSING_GAME
