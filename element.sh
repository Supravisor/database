#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

  # provide an argument
  if [[ $1  == "" ]]
  then
    echo "Please provide an element as an argument."
    exit
  fi


  # input is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$1'")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
      exit
    else
      echo -e "The element with atomic number $ATOMIC_NUMBER is $($PSQL "SELECT name from elements WHERE atomic_number='$ATOMIC_NUMBER'") ($($PSQL "SELECT symbol from elements WHERE atomic_number='$ATOMIC_NUMBER'")). It's a $($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number='$ATOMIC_NUMBER'"), with a mass of $($PSQL "SELECT atomic_mass from properties WHERE atomic_number='$ATOMIC_NUMBER'") amu. $($PSQL "SELECT name from elements WHERE atomic_number='$ATOMIC_NUMBER'") has a melting point of $($PSQL "SELECT melting_point_celsius from properties WHERE atomic_number='$ATOMIC_NUMBER'") celsius and a boiling point of $($PSQL "SELECT boiling_point_celsius from properties WHERE atomic_number='$ATOMIC_NUMBER'") celsius."
      exit
    fi

  # input is a letter or word
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1' OR name='$1'")
    NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$1' OR name='$1'")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      echo "I could not find that element in the database."
      exit
    else
    echo -e "The element with atomic number $ATOMIC_NUMBER is $($PSQL "SELECT name from elements WHERE atomic_number='$ATOMIC_NUMBER'") ($($PSQL "SELECT symbol from elements WHERE symbol='$SYMBOL'")). It's a $($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number='$ATOMIC_NUMBER'"), with a mass of $($PSQL "SELECT atomic_mass from properties WHERE atomic_number='$ATOMIC_NUMBER'") amu. $($PSQL "SELECT name from elements WHERE atomic_number='$ATOMIC_NUMBER'") has a melting point of $($PSQL "SELECT melting_point_celsius from properties WHERE atomic_number='$ATOMIC_NUMBER'") celsius and a boiling point of $($PSQL "SELECT boiling_point_celsius from properties WHERE atomic_number='$ATOMIC_NUMBER'") celsius."
    exit
    fi
  fi
