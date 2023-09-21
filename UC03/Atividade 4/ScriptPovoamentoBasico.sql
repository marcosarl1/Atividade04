-- Povoamento de especialidades
INSERT INTO especialidades(nome)
VALUES
    ("Pediatra"),
    ("Clínica geral"),
    ("Gastroenterologia"),
    ("Dermatologia"),
    ("Oncologia"),
    ("Radiologia"),
    ("Oftalmologia");

-- Povoamento de convenios
INSERT INTO convenios(nome, cnpj, tempo_de_carencia)
VALUES
    ("Unimed", "02812468000106", 30),
    ("CASSI", "33719485001956", 60),
    ("Hapvida", "63554067000198", 90),
    ("Smile Saude", "37135365000800", 120);

-- Povoamento de tipoquartos
INSERT INTO tipoquartos(descricao, valor_diaria)
VALUES
    ("Apartamento", 200),
    ("Quarto duplo", 150),
    ("Enfermaria", 100);
