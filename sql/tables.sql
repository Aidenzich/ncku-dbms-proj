CREATE TABLE patients (
  patient_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  gender CHAR(1) NOT NULL,
  age INTEGER NOT NULL,
  contact_info TEXT
);

CREATE TABLE doctors (
  doctor_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  gender CHAR(1) NOT NULL,
  age INTEGER NOT NULL,
  contact_info TEXT
);

CREATE TABLE medical_records (
  record_id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients (patient_id),
  doctor_id INTEGER REFERENCES doctors (doctor_id),
  diagnosis TEXT NOT NULL,
  treatment_plan TEXT NOT NULL,
  date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prescriptions (
  prescription_id SERIAL PRIMARY KEY,
  patient_id INTEGER REFERENCES patients (patient_id),
  drug_id INTEGER REFERENCES drug_stocks (drug_id),
  dosage REAL NOT NULL,
  frequency TEXT NOT NULL,
  date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE drug_stocks (
  drug_id SERIAL PRIMARY KEY,
  drug_name TEXT NOT NULL,
  quantity INTEGER NOT NULL,
  price REAL NOT NULL,
  batch_number TEXT NOT NULL,
  expiration_date DATE NOT NULL
);

CREATE TABLE sales (
  sale_id SERIAL PRIMARY KEY,
  drug_id INTEGER REFERENCES drug_stocks (drug_id),
  quantity INTEGER NOT NULL,
  price REAL NOT NULL,
  total_amount REAL NOT NULL,
  date_created TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);