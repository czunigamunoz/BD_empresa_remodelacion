/*
Crea una vista donde muestra las cateogiras de las cuadrillas internas
exceptuando la categoria maestro, se muestra el salario promedio de dichas 
categortias al igual que la edad promedio
*/
create view actividad_sal_prom_edad(Actividad,Salario_Promedio, Edad) as
select cuadrilla_int.actividad,
round(avg(albanil.salario),0) as 'Salario Promedio',
timestampdiff(Year,albanil.fec_nacimiento,CURDATE()) as 'Edad'
from albanil inner join cuadrilla_int
on albanil.cuadrilla_int = cuadrilla_int.id_cuadrilla_int
where timestampdiff(Year,albanil.fec_nacimiento,CURDATE()) > 35
and cuadrilla_int.id_cuadrilla_int in
			(select cuadrilla_int
			from 
			   (select cuadrilla_int
			    cuadrilla_int_reforma
			    where cuadrilla_int.actividad not in('maestro'))C)
group by cuadrilla_int.actividad
order by timestampdiff(Year,albanil.fec_nacimiento,CURDATE()) desc;

select * from actividad_sal_prom_edad;

/*
Crea una vista donde lista los lugares de reforma para lo cual muestra
el id como la direccion de misma, además el cliente al cual pertenece
esa remodelacion, junto con el material mas costoso que se ha soplicitado
para dicha reforma
*/
create view reforma_max_cant_max_pre_mat(Id_Reforma,Direccion,Cliente,Material_Mas_Costoso) as
select lugar_reforma.id_reforma, 
lugar_reforma.direccion,
concat(cliente.nombres,' ',cliente.apellidos) as 'Cliente',
round(max(material.cantidad*material.precio_unitario),0) as 'Material mas costoso'
from lugar_reforma inner join cliente
on lugar_reforma.cliente = cliente.id_cliente
inner join material_reforma
on lugar_reforma.id_reforma = material_reforma.reforma
inner join material
on material_reforma.material = material.id_material
where lugar_reforma.id_reforma = any
		(select material_reforma.reforma
		from material_reforma inner join material
		on material_reforma.material = material.id_material
		group by reforma
		having sum(material.cantidad) > avg(material.cantidad))
group by lugar_reforma.id_reforma
order by id_reforma;

select * from reforma_max_cant_max_pre_mat;

/*
Crea una vista donde lista los clientes con su respectivo número de teléfono
en orden alfabético
*/
create view directorio_cliente(Cliente,Telefono) as
select distinct concat(cliente.nombres,' ',cliente.apellidos),
tel_cliente.telefono
from cliente inner join tel_cliente
on cliente.id_cliente = tel_cliente.cliente
order by cliente.nombres;

select * from directorio_cliente;

