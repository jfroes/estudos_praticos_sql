-- 10. Filtre clientes com nome contendo “Silva”.

SELECT * FROM clients WHERE LOWER(name) LIKE LOWER('%Silva%');
