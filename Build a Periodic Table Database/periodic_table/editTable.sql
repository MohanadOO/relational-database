-- Rename Column Names
ALTER TABLE properties RENAME COLUMN weight TO atomic_mass; 
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius ;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;

-- Set melting point and boiling point Columns to not accept null values
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;

-- Add Unique constraint to symbol and name in the Elements table
ALTER TABLE elements ADD CONSTRAINT symbol_unique UNIQUE(symbol);
ALTER TABLE elements ADD CONSTRAINT name_unique UNIQUE(name);

-- Set name and symbol Columns to not accept null values
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;

-- Add Foreign key for the atomic number in properties to reference an element
ALTER TABLE properties ADD FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number);

-- Create a table for elements types
CREATE TABLE types(
  type_id SERIAL PRIMARY KEY NOT NULL,
  type VARCHAR(10) NOT NULL
  );
-- Add Eleemtns to types table
INSERT INTO types(type) VALUES ('nonmetal'), ('metal'), ('metalloid');


-- Add new column in properties so each element have a type referenced in the types table.
ALTER TABLE properties ADD COLUMN type_id INT;

-- Add type_id for each row with the correct type
UPDATE properties SET type_id=1 WHERE type='nonmetal';
UPDATE properties SET type_id=2 WHERE type='metal';
UPDATE properties SET type_id=3 WHERE type='metalloid';

-- Delete Type column after updating each row with the correct type_id referenced in the types table
ALTER TABLE properties DROP COLUMN type;

-- Capitalize the first letter of all the symbols in elements table
UPDATE elements SET symbol=INITCAP(symbol);

-- Reference the types table using type_id
ALTER TABLE properties ADD FOREIGN KEY(type_id) REFERENCES types(type_id);

-- Set type_id to be not null so any new values are required to have a type
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;

-- Add new element and it's properties
INSERT INTO elements(atomic_number, symbol, name) 
VALUES (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');
INSERT INTO properties(atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id)
VALUES (9, 'nonmetal', 18.998, -220, -188.1, 1), (10, 'nonmetal', 20.18, -248.6, -246.1, 1);

-- Alter atomic_mass type to be Decimal
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE DECIMAL;

-- Update properties atomic_mass values to remove all the trailing zeros  
UPDATE properties SET atomic_mass=1.008 WHERE atomic_number=1;
UPDATE properties SET atomic_mass=4.0026 WHERE atomic_number=2;
UPDATE properties SET atomic_mass=6.94 WHERE atomic_number=3;
UPDATE properties SET atomic_mass=9.0122 WHERE atomic_number=4;
UPDATE properties SET atomic_mass=10.81 WHERE atomic_number=5;
UPDATE properties SET atomic_mass=12.011 WHERE atomic_number=6;
UPDATE properties SET atomic_mass=14.007 WHERE atomic_number=7;
UPDATE properties SET atomic_mass=15.999 WHERE atomic_number=8;
UPDATE properties SET atomic_mass=18.998 WHERE atomic_number=9;
UPDATE properties SET atomic_mass=20.18 WHERE atomic_number=10;

-- Delete non existant elemetns
DELETE FROM properties WHERE atomic_number=1000
DELETE FROM elements WHERE atomic_number=1000

