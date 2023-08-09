CREATE TABLE imagem (
	img_cd_id uuid NOT NULL,
	img_tx_nome varchar(255) NULL,
	img_tx_tipo varchar(255) NULL,
	img_tx_dados bytea NULL,
	CONSTRAINT imagem_pkey PRIMARY KEY (img_cd_id)
);
CREATE TABLE roles (
	id serial4 NOT NULL,
	"name" varchar(20) NULL,
	CONSTRAINT roles_name_check CHECK (((name)::text = 'ROLE_USER'::text)),
	CONSTRAINT roles_pkey PRIMARY KEY (id)
);
CREATE TABLE skill (
	skill_cd_id bigserial NOT NULL,
	fk_imagem_id uuid NULL,
	skill_tx_descricao varchar(255) NULL,
	skill_tx_nome varchar(255) NULL,
	CONSTRAINT skill_fk_imagem_id_key UNIQUE (fk_imagem_id),
	CONSTRAINT skill_pkey PRIMARY KEY (skill_cd_id)
);
ALTER TABLE public.skill ADD CONSTRAINT fkkeh88f1l73v9wmivnr3rhi70b FOREIGN KEY (fk_imagem_id) REFERENCES imagem(img_cd_id);

CREATE TABLE skill_usuario (
	skillusu_nm_level int4 NULL,
	skill_cd_id int8 NOT NULL,
	usuario_cd_id int8 NOT NULL,
	CONSTRAINT skill_usuario_pkey PRIMARY KEY (skill_cd_id, usuario_cd_id)
);
ALTER TABLE public.skill_usuario ADD CONSTRAINT fk5qn1ec3cyr8m4sc625ydwdaj9 FOREIGN KEY (usuario_cd_id) REFERENCES usuario(usuario_cd_id);
ALTER TABLE public.skill_usuario ADD CONSTRAINT fke0x8fwo9i4xs69em4v5vle00v FOREIGN KEY (skill_cd_id) REFERENCES skill(skill_cd_id);

CREATE TABLE user_roles (
	role_id int4 NOT NULL,
	user_id int8 NOT NULL,
	CONSTRAINT user_roles_pkey PRIMARY KEY (role_id, user_id)
);
ALTER TABLE public.user_roles ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES roles(id);
ALTER TABLE public.user_roles ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES users(id);
CREATE TABLE users (
	fk_usuario_cd_id int8 NULL,
	id bigserial NOT NULL,
	email varchar(50) NULL,
	"password" varchar(120) NULL,
	CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email),
	CONSTRAINT users_fk_usuario_cd_id_key UNIQUE (fk_usuario_cd_id),
	CONSTRAINT users_pkey PRIMARY KEY (id)
);
ALTER TABLE public.users ADD CONSTRAINT fk7b464h5mjq5a4yt008wlxh03m FOREIGN KEY (fk_usuario_cd_id) REFERENCES usuario(usuario_cd_id);
CREATE TABLE usuario (
	usuario_cd_id bigserial NOT NULL,
	usu_tx_nome varchar(255) NULL,
	CONSTRAINT usuario_pkey PRIMARY KEY (usuario_cd_id)
);