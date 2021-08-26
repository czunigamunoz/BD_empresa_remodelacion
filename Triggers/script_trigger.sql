/*
Implementa un trigger que al modificar la cantidad de un material de una reforma
si este aumenta en 10 unidades se le concedera un descuento del 3%
si aumenta en 50 unidades se le concedera un descuento del 5%
si aumneta en 100 o mas unidades se le concedera un descuento del 7%
sobre el precio unitario del material.
*/
DELIMITER $$
Create Trigger descMaterial
	Before Update
	ON Material
For Each ROW
	IF new.cantidad >= old.cantidad + 10 THEN
		SET new.precio_unitario = old.precio_unitario - old.precio_unitario * 0.03;
	ELSEIF new.cantidad >= old.cantidad + 50 THEN
		SET	 new.precio_unitario = old.precio_unitario - old.precio_unitario * 0.05;
	ELSEIF new.cantidad >= old.cantidad + 100 THEN
		SET new.precio_unitario = old.precio_unitario - old.precio_unitario * 0.07;
	END IF;
$$
DELIMITER ;


UPDATE Material SET Cantidad=40 WHERE Id_material=17;
UPDATE Material SET Cantidad=218 WHERE Id_Material=8;


/*
el salario maximo de un peon	1.400.000
			yeso	1.700.000
			electr	1.400.000
			herrer	1.670.000
			plome	1.300.000
			azule	1.300.000
			pintura	1.400.000
			carp	1.300.000
			concret	2.000.000
			maestro	1.900.000

Implementa un trigger que al insertar un albanil nuevo corrobora que el sueldo
ingresado no sobrepase los sueldos establecidos por la empresa para cada categoria,
de ser asi asigna el maximo para dicha categoria.
*/
DELIMITER $$
Create Trigger verificarSueldo
	Before Insert
	ON Albanil
For Each row
	IF new.categoria='maestro' AND new.salario > 1900000 THEN SET new.salario = 1900000;
	ELSEIF new.categoria='concreto' AND new.salario > 2000000 THEN SET new.salario = 2000000;
	ELSEIF new.categoria='peon' AND new.salario > 1400000 THEN SET new.salario = 1400000;
	ELSEIF new.categoria='yeso' AND new.salario > 1700000 THEN SET new.salario = 1700000;
	ELSEIF new.categoria='electricidad' AND new.salario > 1400000 THEN SET new.salario = 1400000;
	ELSEIF new.categoria='herreria' AND new.salario > 1670000 THEN SET new.salario = 1670000;
	ELSEIF new.categoria='plomeria' AND new.salario > 1300000 THEN SET new.salario = 1300000;
	ELSEIF new.categoria='azulejo' AND new.salario > 1300000 THEN SET new.salario = 1300000;
	ELSEIF new.categoria='pintura' AND new.salario > 1400000 THEN SET new.salario = 1400000;
	ELSEIF new.categoria='maestro' AND new.salario > 1300000 THEN SET new.salario = 1300000;
	END IF;
$$
DELIMITER ;


INSERT INTO Albanil (cuadrilla_int,doc_identidad,nombres,apellidos,fec_nacimiento,lugar_nacimiento,salario,categoria,fec_inicio_contrato,fec_fin_contrato) VALUES (15, '1386135', 'PRUEBA1', 'monje', '1981-09-08', 'timbio', 1114419, 'electricidad', '2001-03-01', NULL);

INSERT INTO Albanil(cuadrilla_int,doc_identidad,nombres,apellidos,fec_nacimiento,lugar_nacimiento,salario, categoria, fec_inicio_contrato, fec_fin_contrato) VALUES
(15, '1386135', 'PRUEBA2', 'monje', '1981-09-08', 'timbio', 1514419, 'electricidad', '2001-03-01', NULL);


