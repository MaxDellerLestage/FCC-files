#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nWhutchu wan?"

MAIN_MENU() {

if [[ $1 ]]
then
  echo -e "\n$1"
fi

SERVICES_AVAILABLE=$($PSQL "select service_id, name from services")

echo "$SERVICES_AVAILABLE" | while read SERVICE_ID BAR  NAME
do
  echo "$SERVICE_ID) $NAME"
done
read SERVICE_ID_SELECTED

case $SERVICE_ID_SELECTED in
  1) BOOKING ;;
  2) BOOKING ;;
  3) BOOKING ;;
  *) MAIN_MENU "Try again tho";;
esac

}

BOOKING() {
  echo -e "\nwhatcha phone?"
  read CUSTOMER_PHONE
  CUST_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")

  if [[ -z $CUST_ID ]]
  then
    echo -e "\nAin't gotchu"
    read CUSTOMER_NAME
    INSERT_CUST_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUST_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
  fi
  echo -e "\nTime you wan?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "insert into appointments(time, customer_id, service_id) values('$SERVICE_TIME', '$CUST_ID', $SERVICE_ID_SELECTED)")
  SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  echo "I have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $CUSTOMER_NAME."
  
}

MAIN_MENU