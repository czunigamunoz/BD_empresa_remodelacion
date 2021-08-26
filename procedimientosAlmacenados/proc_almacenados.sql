-- Función para calcular las cesantias de un trabajador
/*
Función: fnCesantias
Autor: Carlos Zuniga
Fecha creación: 2020-11-13
Version: 1.0
Parametros: Salario y dias laborados
*/
Delimiter $$
Create Function fnCesantias(
    SalMensual decimal(9,2),
	dias_laborados int)
    Returns decimal(15,2)
	Deterministic
Begin
    Declare cesantias decimal(15,2);
	Set cesantias = (SalMensual*dias_laborados)/360;
	Return cesantias;
End $$
Delimiter ;

-- Función para calcular los intereses de cesantias de un trabajador (12% del total de las cesantias)
/*
Función: fnIntCesantias
Autor: Carlos Zuniga
Fecha creación: 2020-11-13
Version: 1.0
Parametros: Cesantias y dias laborados
*/
Delimiter $$
Create Function fnIntCesantias(
    cesantias decimal(15,2),
	dias_laborados int)
	Returns decimal(15,2)
	Deterministic
Begin
    Declare int_censantias decimal(15,2);
	Set int_censantias = (cesantias*dias_laborados*0.12)/360;
	Return int_censantias;
End $$
Delimiter ;

-- Función para calcular las vacaciones de un trabajador
/*
Función: fnVacaciones
Autor: Carlos Zuniga
Fecha creación: 2020-11-13
Version: 1.0
Parametros: Salario y dias laborados
*/
Delimiter $$
Create Function fnVacaciones(
    SalMensual decimal(9,2),
	dias_laborados int)
	Returns decimal(15,2)
	Deterministic
Begin
    Declare vacaciones decimal(15,2);
	Set vacaciones = (SalMensual*dias_laborados)/720;
	Return vacaciones;
End $$
Delimiter ;

-- Función para calcular la prima de servicios de un trabajador
-- Recibe salario
/*
Función: fnPriServicios
Autor: Carlos Zuniga
Fecha creación: 2020-11-13
Version: 1.0
Parametros: Salario
*/
Delimiter $$
Create Function fnPriServicios(
    SalMensual decimal(9,2))
	Returns decimal(15,2)
	Deterministic
Begin
    Declare primaServicios decimal(15,2);
	Set primaServicios = (SalMensual*180)/360;
	Return primaServicios;
End $$
Delimiter ;

--  Función para calcular el subsidio de transporte (7% del salario)
/*
Función: fnSubTransp
Autor: Carlos Zuniga
Fecha creación: 2020-11-13
Version: 1.0
Parametros: Salario
*/
Delimiter $$
Create Function fnSubTransp(
    SalMensual decimal(9,2))
	Returns decimal(9,2)
	Deterministic
Begin
	Declare SubTrans decimal(9,2);
	Set SubTrans = SalMensual * 0.07;
	Return SubTrans;
End $$
Delimiter ;

-- Procedimiento almacenado que a partir del salario mensual y dias trabajados 
-- calcula la liquidacion de contrato de un trabajador
/*
Procedimiento Almacenado: liquidacionContrato 
Autor: Carlos Zuniga
Fecha creación: 2020-11-13
Version: 1.0
Parametros: Identificador del Albanil a liquidar contrato
*/
Delimiter $$
Create Procedure liquidacionContrato(
    in p_id_albanil int)
Begin
    Declare SalMensual decimal(9,2);
	Declare p_salario decimal(9,2);
	Declare dias_transcurridos int;
	Declare domingos_transcurridos int;
	Declare dias_laborados int;
	
    Select salario into p_salario
	From albanil
	Where id_albanil=p_id_albanil;
	
	Select timestampdiff(DAY,fec_inicio_contrato,CURDATE()) into dias_transcurridos
	From albanil
	Where id_albanil=p_id_albanil;
	
	Select timestampdiff(WEEK,fec_inicio_contrato,CURDATE()) into domingos_transcurridos
	From albanil
	Where id_albanil=p_id_albanil;
	
	Set dias_laborados = dias_transcurridos - domingos_transcurridos;
	Set SalMensual = p_salario + fnSubTransp(p_salario);
	
	Update albanil
	Set fec_fin_contrato = CURDATE(),
	cesantias = fnCesantias(SalMensual,dias_laborados),
	int_cesantias = fnIntCesantias(cesantias,dias_laborados),
	vacaciones = fnVacaciones(SalMensual,dias_laborados),
	prima_servicios = fnPriServicios(SalMensual)
	Where id_albanil=p_id_albanil;
	
	select * from albanil where id_albanil=p_id_albanil;	
End $$
Delimiter ;

-- Procedimiento almacenado que actualiza el precio unitario de un material
/*
Procedimiento Almacenado: cambioPrecUnitario
Autor: Carlos Zuniga
Fecha creación: 2020-11-13
Version: 1.0
Parametros: Identificador del material y el nuevo precio unitario a asignar
*/
Delimiter $$
Create Procedure cambioPrecUnitario(
    in p_material int,
	in p_precio_unitario decimal(9,2))
Begin	
	Update material
	Set precio_unitario=p_precio_unitario
	Where id_material=p_material;
	
	Select id_material, nombre, precio_unitario
	From material
	Where id_material=p_material;
End $$
Delimiter ;
	
	
	
	
	
	
	


