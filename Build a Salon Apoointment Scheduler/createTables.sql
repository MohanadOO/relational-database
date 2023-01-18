CREATE TABLE customers(
  customer_id SERIAL PRIMARY KEY NOT NULL,
  phone VARCHAR(15) NOT NULL UNIQUE,
  name VARCHAR(60) NOT NULL
);


CREATE TABLE services(
  service_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(60) NOT NULL
);


CREATE TABLE appointments(
  appointment_id SERIAL PRIMARY KEY NOT NULL,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  service_id INT,
  FOREIGN KEY (service_id) REFERENCES services(service_id),
  time VARCHAR(20)
);
