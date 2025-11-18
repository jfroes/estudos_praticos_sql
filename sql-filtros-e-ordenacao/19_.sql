-- 19. Use LIKE com coringas.

SELECT * FROM clients WHERE LOWER(name) LIKE LOWER('Carlos%');

SELECT * FROM clients WHERE LOWER(name) LIKE LOWER('%Silva%');

SELECT * FROM clients WHERE LOWER(name) LIKE LOWER('Felip_%');