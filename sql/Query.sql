-- Crear tabla de categorías
CREATE TABLE public.tb_categoria (
    id_cat SERIAL PRIMARY KEY,
    descripcion_cat TEXT NOT NULL
);

-- Crear tabla estado civil
CREATE TABLE public.tb_estadocivil (
    id_est SERIAL PRIMARY KEY,
    descripcion_est TEXT NOT NULL
);

-- Crear tabla perfiles
CREATE TABLE public.tb_perfil (
    id_per SERIAL PRIMARY KEY,
    descripcion_per TEXT NOT NULL
);

-- Crear tabla páginas
CREATE TABLE public.tb_pagina (
    id_pag SERIAL PRIMARY KEY,
    descripcion_pag TEXT NOT NULL,
    path_pag TEXT NOT NULL
);

-- Crear tabla productos con clave foránea hacia categorías
CREATE TABLE public.tb_producto (
    id_pr SERIAL PRIMARY KEY,
    id_cat INTEGER REFERENCES public.tb_categoria(id_cat) ON DELETE CASCADE,
    nombre_pr TEXT NOT NULL,
    cantidad_pr INTEGER NOT NULL,
    precio_pr DOUBLE PRECISION NOT NULL,
    foto_pr BYTEA
);

-- Crear tabla usuario con claves foráneas hacia estado civil y perfil
CREATE TABLE public.tb_usuario (
    id_us SERIAL PRIMARY KEY,
    id_per INTEGER REFERENCES public.tb_perfil(id_per) ON DELETE SET NULL,
    id_est INTEGER REFERENCES public.tb_estadocivil(id_est) ON DELETE SET NULL,
    nombre_us TEXT NOT NULL,
    cedula_us TEXT UNIQUE NOT NULL,
    correo_us TEXT UNIQUE NOT NULL,
    clave_us TEXT NOT NULL,
    bloqueo INTEGER DEFAULT 0
);

-- Crear tabla perfil-página para asignación de accesos
CREATE TABLE public.tb_perfilpagina (
    id_perpag SERIAL PRIMARY KEY,
    id_per INTEGER REFERENCES public.tb_perfil(id_per) ON DELETE CASCADE,
    id_pag INTEGER REFERENCES public.tb_pagina(id_pag) ON DELETE CASCADE
);

-- Insertar registros en tb_categoria con categorías reales de insumos de repostería
INSERT INTO tb_categoria (descripcion_cat) VALUES
('Harinas'),
('Azúcar y endulzantes'),
('Chocolate y cacao'),
('Frutas y esencias'),
('Decoraciones y utensilios');

-- Insertar registros en tb_producto con nombres reales de insumos de repostería
INSERT INTO tb_producto (id_cat, nombre_pr, cantidad_pr, precio_pr, foto_pr) VALUES
(1, 'Harina de trigo', 50, 3.99, NULL),
(1, 'Harina de almendra', 20, 12.99, NULL),
(1, 'Harina de avena', 25, 6.99, NULL),
(1, 'Harina de coco', 15, 9.99, NULL),
(1, 'Harina de maíz', 30, 4.99, NULL),

(2, 'Azúcar glass', 30, 4.99, NULL),
(2, 'Miel de agave', 15, 7.99, NULL),
(2, 'Stevia en polvo', 20, 5.99, NULL),
(2, 'Panela granulada', 25, 6.49, NULL),
(2, 'Sirope de maple', 12, 8.99, NULL),

(3, 'Cacao en polvo', 25, 5.99, NULL),
(3, 'Chocolate para fundir', 40, 8.99, NULL),
(3, 'Chispas de chocolate', 35, 7.49, NULL),
(3, 'Chocolate blanco', 20, 6.99, NULL),
(3, 'Cocoa amarga', 30, 5.49, NULL),

(4, 'Extracto de vainilla', 10, 6.99, NULL),
(4, 'Frutas deshidratadas', 12, 9.99, NULL),
(4, 'Ralladura de limón', 18, 4.99, NULL),
(4, 'Esencia de almendra', 22, 5.99, NULL),
(4, 'Puré de manzana', 15, 7.99, NULL),

(5, 'Fondant para decoración', 20, 14.99, NULL),
(5, 'Moldes para cupcakes', 30, 10.99, NULL),
(5, 'Colorantes alimentarios', 25, 6.99, NULL),
(5, 'Boquillas para manga pastelera', 18, 8.49, NULL),
(5, 'Perlas comestibles', 22, 7.99, NULL);

-- Insertar datos en tb_estadocivil
INSERT INTO tb_estadocivil (descripcion_est) VALUES
('Soltero'),
('Casado'),
('Divorciado'),
('Viudo');

-- Insertar datos en tb_perfil
INSERT INTO tb_perfil (descripcion_per) VALUES
('Administrador'),
('Cliente'),
('Vendedor');

-- Insertar registros en tb_pagina
INSERT INTO public.tb_pagina (descripcion_pag, path_pag) VALUES
('Carrito de Compras', 'http://localhost:8080/patinetas/carrito.jsp'),
('Administrar Usuarios', 'http://localhost:8080/patinetas/usuarios.jsp'),
('Administrar Productos', 'http://localhost:8080/patinetas/productos.jsp'),
('Bitácora', 'http://localhost:8080/patinetas/bitacora.jsp'),
('Cambio Clave', 'http://localhost:8080/patinetas/cambioClave.jsp'),
('Cerrar Sesión', 'http://localhost:8080/patinetas/cerrarsesion.jsp');

-- Insertar registros en tb_perfilpagina
/* Perfil Administrador */
INSERT INTO public.tb_perfilpagina (id_per, id_pag) VALUES
(1, 2), -- Administrar Usuarios
(1, 4), -- Bitácora
(1, 5), -- Cambio Clave
(1, 6); -- Cerrar Sesión

/* Perfil Cliente */
INSERT INTO public.tb_perfilpagina (id_per, id_pag) VALUES
(2, 1), -- Carrito de Compras
(2, 5), -- Cambio Clave
(2, 6); -- Cerrar Sesión

/* Perfil Empleado */
INSERT INTO public.tb_perfilpagina (id_per, id_pag) VALUES
(3, 3), -- Administrar Productos
(3, 5), -- Cambio Clave
(3, 6); -- Cerrar Sesión

-- Insertar datos en tb_usuario
INSERT INTO tb_usuario (id_per, id_est, nombre_us, cedula_us, correo_us, clave_us) VALUES
(1, 1, 'Admin', '123456789', 'admin@admin.com', 'holaxdxd'),
(2, 1, 'Cliente', '123456789', 'cliente@cliente.com', 'holaxdxd'),
(3, 1, 'Vendedor', '123456789', 'vendedor@vendedor.com', 'holaxdxd');



create table "auditoria".TB_AUDITORIA (
   ID_AUD               SERIAL               not null,
   TABLA_AUD            TEXT                 null,
   OPERACION_AUD        TEXT                 null,
   VALORANTERIOR_AUD    TEXT                 null,
   VALORNUEVO_AUD       TEXT                 null,
   FECHA_AUD            DATE                 null,
   USUARIO_AUD          TEXT                 null,
   ESQUEMA_AUD          TEXT                 null,
   ACTIVAR_AUD          BOOL                 null,
   TRIGGER_AUD          BOOL                 null,
   constraint PK_TB_AUDITORIA primary key (ID_AUD)
);

/*==============================================================*/
/* Index: TB_AUDITORIA_PK                                       */
/*==============================================================*/
create unique index TB_AUDITORIA_PK on "auditoria".TB_AUDITORIA (
ID_AUD
);

INSERT INTO "auditoria".tb_auditoria (tabla_aud, esquema_aud, trigger_aud)
 select pgtb.tablename, pgtb.schemaname, pgtb.hastriggers  from pg_tables pgtb  where pgtb.schemaname like 'public'


CREATE OR REPLACE FUNCTION fn_log_audit()
  RETURNS trigger AS
$BODY$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'D', OLD, NULL, now(), USER);
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'U', OLD, NEW, now(), USER);
    RETURN NEW;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO "auditoria".tb_auditoria ("tabla_aud", "operacion_aud", "valoranterior_aud", "valornuevo_aud", "fecha_aud", "usuario_aud")
           VALUES (TG_TABLE_NAME, 'I', NULL, NEW, now(), USER);
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION fn_log_audit()
  OWNER TO postgres;


CREATE TRIGGER tb_producto_tg_audit AFTER INSERT OR UPDATE OR DELETE  ON tb_producto  FOR EACH ROW  EXECUTE PROCEDURE fn_log_audit();
CREATE TRIGGER tb_usuario_tg_audit AFTER INSERT OR UPDATE OR DELETE  ON tb_usuario  FOR EACH ROW  EXECUTE PROCEDURE fn_log_audit();
CREATE TRIGGER tb_categoria_tg_audit AFTER INSERT OR UPDATE OR DELETE  ON tb_categoria  FOR EACH ROW  EXECUTE PROCEDURE fn_log_audit();
CREATE TRIGGER tb_estadocivil_tg_audit AFTER INSERT OR UPDATE OR DELETE  ON tb_estadocivil  FOR EACH ROW  EXECUTE PROCEDURE fn_log_audit();
CREATE TRIGGER tb_pagina_tg_audit AFTER INSERT OR UPDATE OR DELETE  ON tb_pagina  FOR EACH ROW  EXECUTE PROCEDURE fn_log_audit();
CREATE TRIGGER tb_perfil_tg_audit AFTER INSERT OR UPDATE OR DELETE  ON tb_perfil  FOR EACH ROW  EXECUTE PROCEDURE fn_log_audit();
CREATE TRIGGER tb_perfilpagina_tg_audit AFTER INSERT OR UPDATE OR DELETE  ON tb_perfilpagina  FOR EACH ROW  EXECUTE PROCEDURE fn_log_audit();