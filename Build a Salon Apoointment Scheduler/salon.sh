#!/bin/bash

PSQL="psql -X --username=postgres --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
   echo -e "\n$1"
  fi

  # get services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
 
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please input a number"
  else 

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # if service is not found
  if [[ -z $SERVICE_NAME ]]
  then
  # return to main
  MAIN_MENU "Service Not Availble."
  else

  #Check Phone Number 
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # search if customer exist
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # if customer don't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_USER_INFO=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  #Check Time Entered by user
  echo -e "\nWhat time would you like your $(echo $SERVICE_NAME, $CUSTOMER_NAME? | sed -E 's/^ +| +$//g')"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  if [[ $INSERT_APPOINTMENT_RESULT != "INSERT 0 1" ]]
  then
  MAIN_MENU "Could not schedule appointment, please try again"
  else
    echo -e "\nI have put you down for a $(echo $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME | sed -E 's/^ +| +$//g')."
  fi
  fi
  fi
}


MAIN_MENU "Welcome to My Salon, how can I help you?"
