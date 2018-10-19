SELECT TOP 10 Nomer_zakaza, * 
FROM Zakaz ORDER BY Nomer_zakaza DESC
=====================
DELETE FROM Zakaz;
DELETE FROM Shablon_zakaza;
DELETE FROM Vhody_poljz;
DELETE FROM Persona WHERE 
Elektronnyi_adres='Индивидуальный клиент';
DELETE FROM Sootvetstvie_parametrov_zakaza;
======================