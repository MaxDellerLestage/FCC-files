#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


GET_ELEMENT() {
  INPUT=$1

  if [[ $INPUT =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUM=$INPUT
    SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ATOMIC_NUM")
    NAME=$($PSQL "select name from elements where atomic_number=$ATOMIC_NUM")
    
  fi
  if [[ $INPUT =~ ^([A-Z])([a-z]?)$ ]]
  then
    SYMBOL=$INPUT 
    ATOMIC_NUM=$($PSQL "select atomic_number from elements where symbol='$SYMBOL'")
    NAME=$($PSQL "select name from elements where symbol='$SYMBOL'")
  fi
  if [[ $INPUT =~ ^([A-Z])([a-z]{3,})$ ]]
  then
    NAME=$INPUT
    ATOMIC_NUM=$($PSQL "select atomic_number from elements where name='$NAME'")
    SYMBOL=$($PSQL "select symbol from elements where name='$NAME'")
  fi
  if [[ -z $ATOMIC_NUM || -z $SYMBOL || -z $NAME ]]
  then
    echo I could not find that element in the database.
  else
    GET_PROPS $ATOMIC_NUM $SYMBOL $NAME
  fi
}

GET_PROPS() {
  ATOMIC_NUM=$1
  SYMBOL=$2
  NAME=$3

  TYPE=$($PSQL "select types.type from types inner join properties using(type_id) where atomic_number=$ATOMIC_NUM")
  ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUM")
  MP=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUM")
  BP=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUM")

  echo "The element with atomic number $(echo $ATOMIC_NUM | sed -E 's/^ *| *$//g') is $(echo $NAME | sed -E 's/^ *| *$//g') ($(echo $SYMBOL | sed -E 's/^ *| *$//g')). It's a $(echo $TYPE | sed -E 's/^ *| *$//g'), with a mass of $(echo $ATOMIC_MASS |sed -E 's/^ *| *$//g') amu. $(echo $NAME | sed -E 's/^ *| *$//g') has a melting point of $(echo $MP | sed -E 's/^ *| *$//g') celsius and a boiling point of $(echo $BP | sed -E 's/^ *| *$//g') celsius."
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  GET_ELEMENT $1
fi