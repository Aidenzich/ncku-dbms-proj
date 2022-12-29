INSERT INTO patients (name, gender, age, contact_info)
VALUES
  ('John Smith', 'M', 35, 'john.smith@example.com'),
  ('Jane Doe', 'F', 28, 'jane.doe@example.com'),
  ('Michael Johnson', 'M', 42, 'michael.johnson@example.com'),
  ('Sophia Williams', 'F', 31, 'sophia.williams@example.com'),
  ('David Brown', 'M', 29, 'david.brown@example.com'),
  ('Emily Davis', 'F', 26, 'emily.davis@example.com'),
  ('William Thompson', 'M', 32, 'william.thompson@example.com'),
  ('Elizabeth Johnson', 'F', 24, 'elizabeth.johnson@example.com'),
  ('James Rodriguez', 'M', 37, 'james.rodriguez@example.com'),
  ('Laura Anderson', 'F', 30, 'laura.anderson@example.com');

INSERT INTO doctors (name, gender, age, contact_info)
VALUES
  ('Dr. David Taylor', 'M', 45, 'david.taylor@example.com'),
  ('Dr. Sarah Jackson', 'F', 38, 'sarah.jackson@example.com'),
  ('Dr. Michael Rodriguez', 'M', 41, 'michael.rodriguez@example.com'),
  ('Dr. Jessica Williams', 'F', 35, 'jessica.williams@example.com'),
  ('Dr. John Davis', 'M', 34, 'john.davis@example.com'),
  ('Dr. Elizabeth Johnson', 'F', 28, 'elizabeth.johnson@example.com'),
  ('Dr. William Smith', 'M', 42, 'william.smith@example.com'),
  ('Dr. Sophia Thompson', 'F', 30, 'sophia.thompson@example.com'),
  ('Dr. Michael Brown', 'M', 37, 'michael.brown@example.com'),
  ('Dr. Jane Anderson', 'F', 29, 'jane.anderson@example.com');

INSERT INTO medical_records (patient_id, doctor_id, diagnosis, treatment_plan)
VALUES
  (1, 1, 'Flu', 'Take flu medication and rest'),
  (2, 2, 'Sore throat', 'Take pain medication and drink warm liquids'),
  (3, 3, 'Headache', 'Take headache medication and avoid stress'),
  (4, 4, 'Allergies', 'Take allergy medication and avoid allergens'),
  (5, 5, 'Stomachache', 'Take antacids and avoid spicy food'),
  (6, 6, 'Cold', 'Take cold medication and rest'),
  (7, 7, 'Back pain', 'Take pain medication and rest'),
  (8, 8, 'Cold', 'Take cold medication and rest'),
  (9, 9, 'Cold', 'Take cold medication and rest'),
  (10, 10, 'Cold', 'Take cold medication and rest');


INSERT INTO prescriptions (patient_id, drug_name, dosage, frequency)
VALUES
  (1, 1, 2, 'twice daily'),
  (2, 2, 1, 'as needed'),
  (3, 3, 1, 'twice daily'),
  (4, 4, 1, 'twice daily'),
  (5, 5, 2, 'twice daily'),
  (6, 6, 1, 'twice daily'),
  (7, 7, 1, 'as needed'),
  (8, 8, 1, 'twice daily'),
  (9, 9, 1, 'twice daily'),
  (10, 10, 2, 'twice daily');

INSERT INTO drug_stocks (drug_name, quantity, price, batch_number, expiration_date)
VALUES
  ('Flu medication', 100, 10.99, 'F1', '2022-12-01'),
  ('Pain medication', 200, 5.99, 'P1', '2022-11-01'),
  ('Headache medication', 300, 8.99, 'H1', '2022-10-01'),
  ('Allergy medication', 400, 15.99, 'A1', '2022-09-01'),
  ('Antacids', 500, 4.99, 'T1', '2022-08-01'),
  ('Cold medication', 600, 12.99, 'C1', '2022-07-01'),
  ('Stomachache medication', 700, 7.99, 'S1', '2022-06-01'),
  ('Anxiety medication', 800, 20.99, 'N1', '2022-05-01'),
  ('Sleeping pills', 900, 9.99, 'L1', '2022-04-01'),
  ('Antihistamines', 1000, 14.99, 'H1', '2022-03-01');

INSERT INTO sales (drug_id, quantity, price, total_amount)
VALUES
  (1, 10, 10.99, 109.9),
  (2, 20, 5.99, 119.8),
  (3, 30, 8.99, 269.7),
  (4, 40, 15.99, 639.6),
  (5, 50, 4.99, 249.5),
  (6, 60, 12.99, 777.4),
  (7, 70, 7.99, 559.3),
  (8, 80, 20.99, 1679.2),
  (9, 90, 9.99, 899.1),
  (10, 100, 14.99, 1499);