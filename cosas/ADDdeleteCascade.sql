ALTER TABLE tablonActividades
ADD CONSTRAINT FK_tablonActividades_actividades
FOREIGN KEY (idActividad) REFERENCES actividades(idActividad) ON DELETE CASCADE;

ALTER TABLE tablonActividades
ADD CONSTRAINT FK_tablonActividades_empleados
FOREIGN KEY (idInstructor) REFERENCES empleados(idEmpleado) ON DELETE CASCADE;

-- Agregar ON DELETE CASCADE a la tabla `reservas`
ALTER TABLE reservas
ADD CONSTRAINT FK_reservas_clientes
FOREIGN KEY (idCliente) REFERENCES clientes(idCliente) ON DELETE CASCADE;

ALTER TABLE reservas
ADD CONSTRAINT FK_reservas_tablonActividades
FOREIGN KEY (idActividadTablon) REFERENCES tablonActividades(id) ON DELETE CASCADE;

-- Agregar ON DELETE CASCADE a la tabla `avisos`
ALTER TABLE avisos
ADD CONSTRAINT FK_avisos_empleados
FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado) ON DELETE CASCADE;

-- Agregar ON DELETE CASCADE a la tabla `instructoresAct`
ALTER TABLE instructoresAct
ADD CONSTRAINT FK_instructoresAct_actividades
FOREIGN KEY (idActividad) REFERENCES actividades(idActividad) ON DELETE CASCADE;

ALTER TABLE instructoresAct
ADD CONSTRAINT FK_instructoresAct_empleados
FOREIGN KEY (idEmpleado) REFERENCES empleados(idEmpleado) ON DELETE CASCADE;