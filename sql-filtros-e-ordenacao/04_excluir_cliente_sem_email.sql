-- 4. Exclua clientes sem email cadastrado.

DELETE FROM clients WHERE email IS NULL;

