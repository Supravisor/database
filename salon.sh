
#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {

    # selection menu

    SELECTION_MENU() {

      if [[ $1 ]]
      then
        # Invalid selection message
        echo -e $1
      else
        # Welcome message
        echo -e "Welcome to My Salon, how can I help you?\n"
      fi

      i=1
        while [[ $i -le $($PSQL "SELECT COUNT(service_id) FROM services") ]]
        do
          echo -e "$($PSQL "SELECT service_id FROM services WHERE service_id='$i'")) $($PSQL "SELECT name FROM services WHERE service_id='$i'")"
          (( i+=1 ))
        done

      # select service
      read SERVICE_ID_SELECTED

      if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]
      then
        # send to selection menu
        SELECTION_MENU "I could not find that service. What would you like today?"
      else
        SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
      fi
    }

  SELECTION_MENU

    CUSTOMER_MENU() {
      # ask for phone number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # if not an existing customer

      if [[ -z $CUSTOMER_NAME ]]
      then
        # setup new customer account
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      fi

      # retrive customer_id

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

    }

  CUSTOMER_MENU

    APPOINTMENT_MENU() {

      # set appointment time
      echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?"
      read SERVICE_TIME

      INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")

      # appointment confirmation message
      echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

    }

  APPOINTMENT_MENU

}

MAIN_MENU
