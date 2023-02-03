select v.matricula as Matricula,v.dt_compra as Fecha_compra,v.km as Km,
m.nombre as Modelo, 
a.nombre as Marca, 
g.nombre as Grupo,
c.nombre as Color, 
s.nombre as Seguro, 
v.poliza as Poliza
from practica_Enric.veiculo v 
left join practica_Enric.modelo m 
	on v.idModelo  = m.idModelo
left join practica_Enric.marca a 
	on m.idMarca = a.idMarca
left join practica_Enric.grupoempresa g  
	on a.idGrupoemp  = g.idGrupoemp
inner join practica_Enric.color c 
	on v.idcolor = c.idcolor 
inner join practica_Enric.seguro s  
	on v.idseguro  = s.idseguro
	
where v.dt_baja>NOW()
; 

