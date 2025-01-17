PGDMP                         y         	   Marketfar    13.3    13.3 D               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    180721 	   Marketfar    DATABASE     m   CREATE DATABASE "Marketfar" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_El Salvador.1252';
    DROP DATABASE "Marketfar";
                postgres    false            �            1259    180722 
   categorias    TABLE     �   CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(50) NOT NULL,
    descripcion_categoria character varying(250),
    imagen_categoria character varying(50) NOT NULL
);
    DROP TABLE public.categorias;
       public         heap    postgres    false            �            1259    180725    categorias_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.categorias_id_categoria_seq;
       public          postgres    false    200                       0    0    categorias_id_categoria_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;
          public          postgres    false    201            �            1259    180727    clientes    TABLE       CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombres_cliente character varying(50) NOT NULL,
    apellidos_cliente character varying(50) NOT NULL,
    dui_cliente character varying(10) NOT NULL,
    correo_cliente character varying(100) NOT NULL,
    telefono_cliente character varying(9) NOT NULL,
    nacimiento_cliente date NOT NULL,
    direccion_cliente character varying(200) NOT NULL,
    clave_cliente character varying(100) NOT NULL,
    estado_cliente boolean DEFAULT true NOT NULL
);
    DROP TABLE public.clientes;
       public         heap    postgres    false            �            1259    180734    clientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clientes_id_cliente_seq;
       public          postgres    false    202                       0    0    clientes_id_cliente_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;
          public          postgres    false    203            �            1259    180736    detalle_pedido    TABLE     �   CREATE TABLE public.detalle_pedido (
    id_detalle integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad_producto smallint NOT NULL,
    precio_producto numeric(5,2) NOT NULL,
    id_pedido integer NOT NULL
);
 "   DROP TABLE public.detalle_pedido;
       public         heap    postgres    false            �            1259    180739    detalle_pedidos_id_detalle_seq    SEQUENCE     �   CREATE SEQUENCE public.detalle_pedidos_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.detalle_pedidos_id_detalle_seq;
       public          postgres    false    204                       0    0    detalle_pedidos_id_detalle_seq    SEQUENCE OWNED BY     `   ALTER SEQUENCE public.detalle_pedidos_id_detalle_seq OWNED BY public.detalle_pedido.id_detalle;
          public          postgres    false    205            �            1259    180741    pedidos    TABLE     �   CREATE TABLE public.pedidos (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    estado_pedido smallint DEFAULT 0 NOT NULL,
    fecha_pedido date
);
    DROP TABLE public.pedidos;
       public         heap    postgres    false            �            1259    180745    pedidos_id_pedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedidos_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.pedidos_id_pedido_seq;
       public          postgres    false    206                       0    0    pedidos_id_pedido_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.pedidos_id_pedido_seq OWNED BY public.pedidos.id_pedido;
          public          postgres    false    207            �            1259    180747 	   productos    TABLE     {  CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying(50) NOT NULL,
    descripcion_producto character varying(250) NOT NULL,
    precio_producto numeric(5,2) NOT NULL,
    imagen_producto character varying(50) NOT NULL,
    id_categoria integer NOT NULL,
    estado_producto boolean NOT NULL,
    id_usuario integer NOT NULL
);
    DROP TABLE public.productos;
       public         heap    postgres    false            �            1259    180750    productos_id_producto_seq    SEQUENCE     �   CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.productos_id_producto_seq;
       public          postgres    false    208                       0    0    productos_id_producto_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;
          public          postgres    false    209            �            1259    180752    tipo_usuario    TABLE     x   CREATE TABLE public.tipo_usuario (
    id_tipo_usuario integer NOT NULL,
    tipo_usuario character varying NOT NULL
);
     DROP TABLE public.tipo_usuario;
       public         heap    postgres    false            �            1259    180758    usuarios    TABLE     b  CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombres_usuario character varying(50) NOT NULL,
    apellidos_usuario character varying(50) NOT NULL,
    correo_usuario character varying(100) NOT NULL,
    alias_usuario character varying(50) NOT NULL,
    clave_usuario character varying(100) NOT NULL,
    id_tipo_usuario integer
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    180761    usuarios_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.usuarios_id_usuario_seq;
       public          postgres    false    211                       0    0    usuarios_id_usuario_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;
          public          postgres    false    212            �            1259    180763    valoraciones    TABLE     �   CREATE TABLE public.valoraciones (
    id_valoracion integer NOT NULL,
    estrellas integer NOT NULL,
    comentario character varying NOT NULL,
    id_producto integer NOT NULL
);
     DROP TABLE public.valoraciones;
       public         heap    postgres    false            �            1259    180769    valoraciones_id_valoracion_seq    SEQUENCE     �   ALTER TABLE public.valoraciones ALTER COLUMN id_valoracion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.valoraciones_id_valoracion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    213            M           2604    180771    categorias id_categoria    DEFAULT     �   ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);
 F   ALTER TABLE public.categorias ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    201    200            O           2604    180772    clientes id_cliente    DEFAULT     z   ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);
 B   ALTER TABLE public.clientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    203    202            P           2604    180773    detalle_pedido id_detalle    DEFAULT     �   ALTER TABLE ONLY public.detalle_pedido ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalle_pedidos_id_detalle_seq'::regclass);
 H   ALTER TABLE public.detalle_pedido ALTER COLUMN id_detalle DROP DEFAULT;
       public          postgres    false    205    204            R           2604    180774    pedidos id_pedido    DEFAULT     v   ALTER TABLE ONLY public.pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedidos_id_pedido_seq'::regclass);
 @   ALTER TABLE public.pedidos ALTER COLUMN id_pedido DROP DEFAULT;
       public          postgres    false    207    206            S           2604    180775    productos id_producto    DEFAULT     ~   ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);
 D   ALTER TABLE public.productos ALTER COLUMN id_producto DROP DEFAULT;
       public          postgres    false    209    208            T           2604    180776    usuarios id_usuario    DEFAULT     z   ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);
 B   ALTER TABLE public.usuarios ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    212    211            �          0    180722 
   categorias 
   TABLE DATA           m   COPY public.categorias (id_categoria, nombre_categoria, descripcion_categoria, imagen_categoria) FROM stdin;
    public          postgres    false    200   �U       �          0    180727    clientes 
   TABLE DATA           �   COPY public.clientes (id_cliente, nombres_cliente, apellidos_cliente, dui_cliente, correo_cliente, telefono_cliente, nacimiento_cliente, direccion_cliente, clave_cliente, estado_cliente) FROM stdin;
    public          postgres    false    202   QV       �          0    180736    detalle_pedido 
   TABLE DATA           p   COPY public.detalle_pedido (id_detalle, id_producto, cantidad_producto, precio_producto, id_pedido) FROM stdin;
    public          postgres    false    204   _W                 0    180741    pedidos 
   TABLE DATA           U   COPY public.pedidos (id_pedido, id_cliente, estado_pedido, fecha_pedido) FROM stdin;
    public          postgres    false    206   �W                 0    180747 	   productos 
   TABLE DATA           �   COPY public.productos (id_producto, nombre_producto, descripcion_producto, precio_producto, imagen_producto, id_categoria, estado_producto, id_usuario) FROM stdin;
    public          postgres    false    208   �W                 0    180752    tipo_usuario 
   TABLE DATA           E   COPY public.tipo_usuario (id_tipo_usuario, tipo_usuario) FROM stdin;
    public          postgres    false    210   oX                 0    180758    usuarios 
   TABLE DATA           �   COPY public.usuarios (id_usuario, nombres_usuario, apellidos_usuario, correo_usuario, alias_usuario, clave_usuario, id_tipo_usuario) FROM stdin;
    public          postgres    false    211   �X                 0    180763    valoraciones 
   TABLE DATA           Y   COPY public.valoraciones (id_valoracion, estrellas, comentario, id_producto) FROM stdin;
    public          postgres    false    213   �Y                  0    0    categorias_id_categoria_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 2, true);
          public          postgres    false    201                       0    0    clientes_id_cliente_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 2, true);
          public          postgres    false    203                       0    0    detalle_pedidos_id_detalle_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.detalle_pedidos_id_detalle_seq', 17, true);
          public          postgres    false    205                       0    0    pedidos_id_pedido_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 16, true);
          public          postgres    false    207                       0    0    productos_id_producto_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.productos_id_producto_seq', 4, true);
          public          postgres    false    209                       0    0    usuarios_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 9, true);
          public          postgres    false    212                       0    0    valoraciones_id_valoracion_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.valoraciones_id_valoracion_seq', 26, true);
          public          postgres    false    214            V           2606    180778 *   categorias categorias_nombre_categoria_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_categoria_key UNIQUE (nombre_categoria);
 T   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_nombre_categoria_key;
       public            postgres    false    200            X           2606    180780    categorias categorias_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);
 D   ALTER TABLE ONLY public.categorias DROP CONSTRAINT categorias_pkey;
       public            postgres    false    200            [           2606    180782 $   clientes clientes_correo_cliente_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_correo_cliente_key UNIQUE (correo_cliente);
 N   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_correo_cliente_key;
       public            postgres    false    202            ]           2606    180784 !   clientes clientes_dui_cliente_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_dui_cliente_key UNIQUE (dui_cliente);
 K   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_dui_cliente_key;
       public            postgres    false    202            _           2606    180786    clientes clientes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    202            a           2606    180788 "   detalle_pedido detalle_pedido_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_pkey PRIMARY KEY (id_detalle);
 L   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_pkey;
       public            postgres    false    204            c           2606    180790    pedidos pedidos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);
 >   ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_pkey;
       public            postgres    false    206            e           2606    180792 '   productos productos_nombre_producto_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_nombre_producto_key UNIQUE (nombre_producto);
 Q   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_nombre_producto_key;
       public            postgres    false    208            g           2606    180794    productos productos_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);
 B   ALTER TABLE ONLY public.productos DROP CONSTRAINT productos_pkey;
       public            postgres    false    208            i           2606    180796    tipo_usuario tipo_usuario_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipo_usuario
    ADD CONSTRAINT tipo_usuario_pkey PRIMARY KEY (id_tipo_usuario);
 H   ALTER TABLE ONLY public.tipo_usuario DROP CONSTRAINT tipo_usuario_pkey;
       public            postgres    false    210            k           2606    180798 #   usuarios usuarios_alias_usuario_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_alias_usuario_key UNIQUE (alias_usuario);
 M   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_alias_usuario_key;
       public            postgres    false    211            m           2606    180800 $   usuarios usuarios_correo_usuario_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_correo_usuario_key UNIQUE (correo_usuario);
 N   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_correo_usuario_key;
       public            postgres    false    211            o           2606    180802    usuarios usuarios_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    211            q           2606    180804    valoraciones valoraciones_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT valoraciones_pkey PRIMARY KEY (id_valoracion);
 H   ALTER TABLE ONLY public.valoraciones DROP CONSTRAINT valoraciones_pkey;
       public            postgres    false    213            Y           1259    180805    nombre_index    INDEX     V   CREATE UNIQUE INDEX nombre_index ON public.categorias USING btree (nombre_categoria);
     DROP INDEX public.nombre_index;
       public            postgres    false    200            r           2606    180806 ,   detalle_pedido detalle_pedido_id_pedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido) NOT VALID;
 V   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_id_pedido_fkey;
       public          postgres    false    2915    206    204            s           2606    180811 .   detalle_pedido detalle_pedido_id_producto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detalle_pedido
    ADD CONSTRAINT detalle_pedido_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);
 X   ALTER TABLE ONLY public.detalle_pedido DROP CONSTRAINT detalle_pedido_id_producto_fkey;
       public          postgres    false    2919    204    208            x           2606    180816    valoraciones fkproducto    FK CONSTRAINT     �   ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT fkproducto FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) NOT VALID;
 A   ALTER TABLE ONLY public.valoraciones DROP CONSTRAINT fkproducto;
       public          postgres    false    213    208    2919            u           2606    180821    productos id_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT id_categoria FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria) NOT VALID;
 @   ALTER TABLE ONLY public.productos DROP CONSTRAINT id_categoria;
       public          postgres    false    208    2904    200            v           2606    180826    productos id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY public.productos
    ADD CONSTRAINT id_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) NOT VALID;
 >   ALTER TABLE ONLY public.productos DROP CONSTRAINT id_usuario;
       public          postgres    false    211    2927    208            t           2606    180831    pedidos pedidos_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);
 I   ALTER TABLE ONLY public.pedidos DROP CONSTRAINT pedidos_id_cliente_fkey;
       public          postgres    false    2911    206    202            w           2606    180836    usuarios tipofk    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT tipofk FOREIGN KEY (id_tipo_usuario) REFERENCES public.tipo_usuario(id_tipo_usuario) NOT VALID;
 9   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT tipofk;
       public          postgres    false    211    2921    210            �   T   x�3�tLJ,*�/I-�t���LITH�H,
%r��X$%&�������sq�d�d�V%r��@Uɖ��F�&IU1z\\\ 
�      �   �   x�Uλn�0 @��|��m0����(mJ"h�T]8`�,���A�2t�Ý��DOOA����l�X�MRp�V��їv��`�b.�\haLAȂȅ���4b�.��Rl���q�ϼ^Or702�-�ywl���4Q<��~�
����ӯTߵC�$/��X)π��L��ض�y�`胺���"��U��aHqի�?�ͩ�c^(s�}8�̪��-?wհ��]�oJ��������3\���i�XY      �   ?   x�M��  C�3�X\���1^~6u�c�kiu9���X��j����.���� ��f         -   x�34�C#C]s]#.CcS �E��G����� �k�         t   x�M�A
�0���� $?������oIK@%جzzKZAf1�!ܴ����m�z�?}�u�́=O�l}/�h�&����k:y�R�<⮋nx�W-yS�SO�i"�����c��](            x�3�tJ,�L��2���/����� >�'         �   x�U�Kn�@ ���p
�f uW�J��&�4�L�V0�c�r#�=�kmb����
ش�Ί.��v�+0H�eI'���#�lɉ*���}U�(��V���^DEM/���3~�x��2����k�h�Ml6��ھ���2�0����G/����,�6\T���Ϟ��V�5�#'I�5G����N=���+�W�<�e-i��#)ݻ���sO?6�o���ykt�r{���pX��;�5��$�/�;g�         8   x�32�4�,�/��4�22�}s�lSN΢��|Nc.#3N3��� ���qqq O��     