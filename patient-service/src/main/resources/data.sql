-- Create the patient table (if not exists)
CREATE TABLE IF NOT EXISTS patient (
                                       id UUID PRIMARY KEY,
                                       name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    birth_date DATE NOT NULL,
    register_date DATE NOT NULL
    );

-- Insert 15 sample patients with manually generated UUIDs
INSERT INTO patient (id, name, email, address, birth_date, register_date) VALUES
                                                                              ('11111111-1111-1111-1111-111111111111', 'Alice Smith', 'alice.smith1@example.com', '123 Maple St, NY', '1985-06-15', '2024-01-10'),
                                                                              ('22222222-2222-2222-2222-222222222222', 'Bob Johnson', 'bob.johnson2@example.com', '456 Oak St, CA', '1990-09-22', '2024-02-12'),
                                                                              ('33333333-3333-3333-3333-333333333333', 'Charlie Brown', 'charlie.brown3@example.com', '789 Pine St, TX', '1978-11-30', '2024-03-01'),
                                                                              ('44444444-4444-4444-4444-444444444444', 'Diana Prince', 'diana.prince4@example.com', '101 Birch St, WA', '1992-04-10', '2024-04-05'),
                                                                              ('55555555-5555-5555-5555-555555555555', 'Ethan Hunt', 'ethan.hunt5@example.com', '202 Elm St, IL', '1988-12-01', '2024-04-08'),
                                                                              ('66666666-6666-6666-6666-666666666666', 'Fiona Gallagher', 'fiona.gallagher6@example.com', '303 Cedar St, FL', '1983-07-22', '2024-05-15'),
                                                                              ('77777777-7777-7777-7777-777777777777', 'George Costanza', 'george.costanza7@example.com', '404 Walnut St, NJ', '1975-05-30', '2024-06-01'),
                                                                              ('88888888-8888-8888-8888-888888888888', 'Hannah Montana', 'hannah.montana8@example.com', '505 Spruce St, OH', '1994-08-14', '2024-06-10'),
                                                                              ('99999999-9999-9999-9999-999999999999', 'Ivan Drago', 'ivan.drago9@example.com', '606 Ash St, GA', '1980-03-11', '2024-06-20'),
                                                                              ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Jane Eyre', 'jane.eyre10@example.com', '707 Chestnut St, MA', '1987-10-18', '2024-07-01'),
                                                                              ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Kevin McCallister', 'kevin.mccallister11@example.com', '808 Hickory St, MI', '1995-12-25', '2024-07-03'),
                                                                              ('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Lara Croft', 'lara.croft12@example.com', '909 Redwood St, CO', '1986-01-15', '2024-07-10'),
                                                                              ('aaaaaaa4-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Michael Scott', 'michael.scott13@example.com', '111 Ironwood St, PA', '1974-03-15', '2024-07-12'),
                                                                              ('aaaaaaa5-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Nancy Drew', 'nancy.drew14@example.com', '222 Palm St, AZ', '1991-09-09', '2024-07-15'),
                                                                              ('aaaaaaa6-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'Oscar Martinez', 'oscar.martinez15@example.com', '333 Cypress St, OR', '1989-02-18', '2024-07-18');
