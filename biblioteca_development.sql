PGDMP         %                u            biblioteca_development    9.6.2    9.6.2 U    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16529    biblioteca_development    DATABASE     �   CREATE DATABASE biblioteca_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
 &   DROP DATABASE biblioteca_development;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16598    admins    TABLE     �  CREATE TABLE admins (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.admins;
       public         postgres    false    3            �            1259    16596    admins_id_seq    SEQUENCE     o   CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.admins_id_seq;
       public       postgres    false    196    3            �           0    0    admins_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE admins_id_seq OWNED BY admins.id;
            public       postgres    false    195            �            1259    16539    ar_internal_metadata    TABLE     �   CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
 (   DROP TABLE public.ar_internal_metadata;
       public         postgres    false    3            �            1259    16560    authors    TABLE     m  CREATE TABLE authors (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    "desc" text
);
    DROP TABLE public.authors;
       public         postgres    false    3            �            1259    16558    authors_id_seq    SEQUENCE     p   CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.authors_id_seq;
       public       postgres    false    3    190            �           0    0    authors_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE authors_id_seq OWNED BY authors.id;
            public       postgres    false    189            �            1259    16614    books    TABLE     �  CREATE TABLE books (
    id integer NOT NULL,
    title character varying,
    description text,
    author_id integer,
    theme_id integer,
    editorial_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);
    DROP TABLE public.books;
       public         postgres    false    3            �            1259    16612    books_id_seq    SEQUENCE     n   CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.books_id_seq;
       public       postgres    false    198    3            �           0    0    books_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE books_id_seq OWNED BY books.id;
            public       postgres    false    197            �            1259    16643    copies    TABLE     �   CREATE TABLE copies (
    id integer NOT NULL,
    year date,
    location character varying,
    book_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.copies;
       public         postgres    false    3            �            1259    16641    copies_id_seq    SEQUENCE     o   CREATE SEQUENCE copies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.copies_id_seq;
       public       postgres    false    3    200            �           0    0    copies_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE copies_id_seq OWNED BY copies.id;
            public       postgres    false    199            �            1259    16571 
   editorials    TABLE     �   CREATE TABLE editorials (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.editorials;
       public         postgres    false    3            �            1259    16569    editorials_id_seq    SEQUENCE     s   CREATE SEQUENCE editorials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.editorials_id_seq;
       public       postgres    false    192    3            �           0    0    editorials_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE editorials_id_seq OWNED BY editorials.id;
            public       postgres    false    191            �            1259    16660    loans    TABLE       CREATE TABLE loans (
    id integer NOT NULL,
    delivery_date date,
    return_date date,
    active integer DEFAULT 0,
    copy_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.loans;
       public         postgres    false    3            �            1259    16658    loans_id_seq    SEQUENCE     n   CREATE SEQUENCE loans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.loans_id_seq;
       public       postgres    false    202    3            �           0    0    loans_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE loans_id_seq OWNED BY loans.id;
            public       postgres    false    201            �            1259    16531    schema_migrations    TABLE     K   CREATE TABLE schema_migrations (
    version character varying NOT NULL
);
 %   DROP TABLE public.schema_migrations;
       public         postgres    false    3            �            1259    16549    themes    TABLE     �   CREATE TABLE themes (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
    DROP TABLE public.themes;
       public         postgres    false    3            �            1259    16547    themes_id_seq    SEQUENCE     o   CREATE SEQUENCE themes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.themes_id_seq;
       public       postgres    false    188    3            �           0    0    themes_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE themes_id_seq OWNED BY themes.id;
            public       postgres    false    187            �            1259    16582    users    TABLE     �  CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    address character varying,
    phone character varying,
    identification character varying,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    16580    users_id_seq    SEQUENCE     n   CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    3    194            �           0    0    users_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE users_id_seq OWNED BY users.id;
            public       postgres    false    193                       2604    16601 	   admins id    DEFAULT     X   ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);
 8   ALTER TABLE public.admins ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    196    196                       2604    16563 
   authors id    DEFAULT     Z   ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);
 9   ALTER TABLE public.authors ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    190    189    190                       2604    16617    books id    DEFAULT     V   ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);
 7   ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    197    198                       2604    16646 	   copies id    DEFAULT     X   ALTER TABLE ONLY copies ALTER COLUMN id SET DEFAULT nextval('copies_id_seq'::regclass);
 8   ALTER TABLE public.copies ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    200    200                       2604    16574    editorials id    DEFAULT     `   ALTER TABLE ONLY editorials ALTER COLUMN id SET DEFAULT nextval('editorials_id_seq'::regclass);
 <   ALTER TABLE public.editorials ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    192    191    192                       2604    16663    loans id    DEFAULT     V   ALTER TABLE ONLY loans ALTER COLUMN id SET DEFAULT nextval('loans_id_seq'::regclass);
 7   ALTER TABLE public.loans ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    202    202                       2604    16552 	   themes id    DEFAULT     X   ALTER TABLE ONLY themes ALTER COLUMN id SET DEFAULT nextval('themes_id_seq'::regclass);
 8   ALTER TABLE public.themes ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    188    188                       2604    16585    users id    DEFAULT     V   ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    194    193    194            �          0    16598    admins 
   TABLE DATA               �   COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
    public       postgres    false    196   �a       �           0    0    admins_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('admins_id_seq', 1, true);
            public       postgres    false    195            �          0    16539    ar_internal_metadata 
   TABLE DATA               K   COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
    public       postgres    false    186   ab       �          0    16560    authors 
   TABLE DATA               �   COPY authors (id, name, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, "desc") FROM stdin;
    public       postgres    false    190   �b       �           0    0    authors_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('authors_id_seq', 12, true);
            public       postgres    false    189            �          0    16614    books 
   TABLE DATA               �   COPY books (id, title, description, author_id, theme_id, editorial_id, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
    public       postgres    false    198   Ut       �           0    0    books_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('books_id_seq', 11, true);
            public       postgres    false    197            �          0    16643    copies 
   TABLE DATA               N   COPY copies (id, year, location, book_id, created_at, updated_at) FROM stdin;
    public       postgres    false    200   �       �           0    0    copies_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('copies_id_seq', 3, true);
            public       postgres    false    199            �          0    16571 
   editorials 
   TABLE DATA               ?   COPY editorials (id, name, created_at, updated_at) FROM stdin;
    public       postgres    false    192   �       �           0    0    editorials_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('editorials_id_seq', 4, true);
            public       postgres    false    191            �          0    16660    loans 
   TABLE DATA               j   COPY loans (id, delivery_date, return_date, active, copy_id, user_id, created_at, updated_at) FROM stdin;
    public       postgres    false    202   �       �           0    0    loans_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('loans_id_seq', 9, true);
            public       postgres    false    201            �          0    16531    schema_migrations 
   TABLE DATA               -   COPY schema_migrations (version) FROM stdin;
    public       postgres    false    185   h�       �          0    16549    themes 
   TABLE DATA               ;   COPY themes (id, name, created_at, updated_at) FROM stdin;
    public       postgres    false    188   ̈       �           0    0    themes_id_seq    SEQUENCE SET     4   SELECT pg_catalog.setval('themes_id_seq', 8, true);
            public       postgres    false    187            �          0    16582    users 
   TABLE DATA               ]  COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, address, phone, identification, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
    public       postgres    false    194   ��       �           0    0    users_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('users_id_seq', 1, true);
            public       postgres    false    193            *           2606    16609    admins admins_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public         postgres    false    196    196                       2606    16546 .   ar_internal_metadata ar_internal_metadata_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);
 X   ALTER TABLE ONLY public.ar_internal_metadata DROP CONSTRAINT ar_internal_metadata_pkey;
       public         postgres    false    186    186            "           2606    16568    authors authors_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.authors DROP CONSTRAINT authors_pkey;
       public         postgres    false    190    190            .           2606    16622    books books_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public         postgres    false    198    198            3           2606    16651    copies copies_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY copies
    ADD CONSTRAINT copies_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.copies DROP CONSTRAINT copies_pkey;
       public         postgres    false    200    200            $           2606    16579    editorials editorials_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY editorials
    ADD CONSTRAINT editorials_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.editorials DROP CONSTRAINT editorials_pkey;
       public         postgres    false    192    192            8           2606    16665    loans loans_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.loans DROP CONSTRAINT loans_pkey;
       public         postgres    false    202    202                       2606    16538 (   schema_migrations schema_migrations_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);
 R   ALTER TABLE ONLY public.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
       public         postgres    false    185    185                        2606    16557    themes themes_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY themes
    ADD CONSTRAINT themes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.themes DROP CONSTRAINT themes_pkey;
       public         postgres    false    188    188            (           2606    16593    users users_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    194    194            +           1259    16610    index_admins_on_email    INDEX     I   CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);
 )   DROP INDEX public.index_admins_on_email;
       public         postgres    false    196            ,           1259    16611 $   index_admins_on_reset_password_token    INDEX     g   CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);
 8   DROP INDEX public.index_admins_on_reset_password_token;
       public         postgres    false    196            /           1259    16638    index_books_on_author_id    INDEX     H   CREATE INDEX index_books_on_author_id ON books USING btree (author_id);
 ,   DROP INDEX public.index_books_on_author_id;
       public         postgres    false    198            0           1259    16640    index_books_on_editorial_id    INDEX     N   CREATE INDEX index_books_on_editorial_id ON books USING btree (editorial_id);
 /   DROP INDEX public.index_books_on_editorial_id;
       public         postgres    false    198            1           1259    16639    index_books_on_theme_id    INDEX     F   CREATE INDEX index_books_on_theme_id ON books USING btree (theme_id);
 +   DROP INDEX public.index_books_on_theme_id;
       public         postgres    false    198            4           1259    16657    index_copies_on_book_id    INDEX     F   CREATE INDEX index_copies_on_book_id ON copies USING btree (book_id);
 +   DROP INDEX public.index_copies_on_book_id;
       public         postgres    false    200            5           1259    16676    index_loans_on_copy_id    INDEX     D   CREATE INDEX index_loans_on_copy_id ON loans USING btree (copy_id);
 *   DROP INDEX public.index_loans_on_copy_id;
       public         postgres    false    202            6           1259    16677    index_loans_on_user_id    INDEX     D   CREATE INDEX index_loans_on_user_id ON loans USING btree (user_id);
 *   DROP INDEX public.index_loans_on_user_id;
       public         postgres    false    202            %           1259    16594    index_users_on_email    INDEX     G   CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);
 (   DROP INDEX public.index_users_on_email;
       public         postgres    false    194            &           1259    16595 #   index_users_on_reset_password_token    INDEX     e   CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);
 7   DROP INDEX public.index_users_on_reset_password_token;
       public         postgres    false    194            9           2606    16623    books fk_rails_53d51ce16a    FK CONSTRAINT     n   ALTER TABLE ONLY books
    ADD CONSTRAINT fk_rails_53d51ce16a FOREIGN KEY (author_id) REFERENCES authors(id);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_rails_53d51ce16a;
       public       postgres    false    2082    190    198            <           2606    16652    copies fk_rails_6d66d5af8b    FK CONSTRAINT     k   ALTER TABLE ONLY copies
    ADD CONSTRAINT fk_rails_6d66d5af8b FOREIGN KEY (book_id) REFERENCES books(id);
 D   ALTER TABLE ONLY public.copies DROP CONSTRAINT fk_rails_6d66d5af8b;
       public       postgres    false    2094    198    200            ;           2606    16633    books fk_rails_93a1114170    FK CONSTRAINT     t   ALTER TABLE ONLY books
    ADD CONSTRAINT fk_rails_93a1114170 FOREIGN KEY (editorial_id) REFERENCES editorials(id);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_rails_93a1114170;
       public       postgres    false    2084    198    192            >           2606    16671    loans fk_rails_c15c911198    FK CONSTRAINT     j   ALTER TABLE ONLY loans
    ADD CONSTRAINT fk_rails_c15c911198 FOREIGN KEY (user_id) REFERENCES users(id);
 C   ALTER TABLE ONLY public.loans DROP CONSTRAINT fk_rails_c15c911198;
       public       postgres    false    194    202    2088            =           2606    16666    loans fk_rails_e9a992e476    FK CONSTRAINT     k   ALTER TABLE ONLY loans
    ADD CONSTRAINT fk_rails_e9a992e476 FOREIGN KEY (copy_id) REFERENCES copies(id);
 C   ALTER TABLE ONLY public.loans DROP CONSTRAINT fk_rails_e9a992e476;
       public       postgres    false    202    2099    200            :           2606    16628    books fk_rails_f59d5c0742    FK CONSTRAINT     l   ALTER TABLE ONLY books
    ADD CONSTRAINT fk_rails_f59d5c0742 FOREIGN KEY (theme_id) REFERENCES themes(id);
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT fk_rails_f59d5c0742;
       public       postgres    false    2080    198    188            �   �   x�m��
�@E�3O�­�7~㨳ji���nT�D�,�y�("�sW�r8���E?�u�t��i�x�ù�*��1.dڭ�M��f��v8��q[��a�MFo�CϢ�ؐ<��x��\� �
|&�c$�
�J�P�D)�����',�W�?�9��>Z�3�      �   =   x�K�+�,���M�+�LI-K��/ ���u��H��������X�������W� �d:      �      x��ZM��Vv]w��o���"Y�=��Ԓlw�K� ��WU�&��G���$�*�$�Kf� �0cM �x��2��_�_�s�#Y���@��&��}���s�+�豜�H��4������R�y=w����^_x�S�?���ۛ����+����G�?���t�\g�(�s��u��G�ި?��������'=�oD�T��W"T"��Nm�H&NΌd�����D�[M܉7�Qʐ��\�z�#��I�����Ž�H�/s�TQ��!��}��Y�D�
�&*��T/U��J��㼌tj?����Ȕ�tH�I��i$S���=aTM���}��J"->�SŢ^D�2�(�t�6_��y�~�	����=�1"J�@EG�������9��$�K���>9$���4�{�R!��9���XA�8
�Σ�z��N�]ɨ̨{�"ZJ��r��e�`�B��=I��̵��vU-���d�BW�P		hD!cQ�_�$Jy���(�B�ȸ��i�8�g���p&{���*p�H�j�`I��6�z���K�O�2�I�8�3���+zy�Cw���MJ����J������X����0�;x���鬌�!5$*ц�W��>z���(���P�>���4$�0̜�E�g�)ƠB��@C�H%�Νc���+a���F?�o�������3����V��A��v��.�񦻐�,�هw��y���zg<�|��J�J�ˆX��}���Z��0�X�.:�\*�Hv�dL�E�t�Y�z�+�2jȹ΋6z�+.���w�\a�x�ؙi�&{(3��;�
s�ȩ`�P�)���A+��j� ��s&��xIK)c�J&����O����mT�`�����J<��N��pq��U�QL  ���:p�jM
�h��b \�
����h"?�ֲH�o�2��B\�7s@�&r��z�6m=;�U�,I�������1��cXd��
p�������0h�=%g!P,4ᔡ_+��1����4��n��1�je��c�3>da���1(��� �:�z�&�jU%Y�9�?�װ����Ջ`�*-��ei��J;�4thҬ*����u,̩*��|g�x�W4&�����2�'Z.���H>��u2Er��X|Ԥ����>�������T�+��?z�CX�!�J-��N]��Ǔ��ivĳ7Ӆ��0�02���}X�U<0��p���2�^����-��	�e��N��?����ϛ��}+6�����?l������ϛ��?�����w������w���7��)�om��G���yM���?��x��_�K��`".��$�w�ݧ2W
�ͧH]pƜ��cQg<v�u[� �$��@|Y�p䜚��v,�^d1���(k�zN�(q,�8��"�յ�A�h�Q|��P1<C�YD8"�jgz�N
K��<�ó^D/�;���o�9m�T_�*�gUm�:w	���(�� �#й����*n�`�N�/߷��Ô�-�KV��t���u��	s�4	�CG�x�p�>��%��3S�!��q𗟜���W2.�W������?�\g����>��y�<��
��.s-���߹D�q��|�-�8�
�&�Dq���e>-g3�t��G��6��65�*u'���+�g���C?�YԪ#�=�>�x��4ʹZL�Vr���K@;#=��ʺq�J�����ݤ�@XQ9��L��s�"����<ϦN�Q��a�A�������F��ln��c�pR$\�fޢ�9�`��N�U�U�n���x���l��}.�ciJ�q,�Ff2d����ܸ�RqR�8�(%�e$��2BR�e��Qr}��4��rmi��0�VV�6�����9rJ!1��=t�G���L�PÛ��08���h�B� 7�_�J�݂��Ѿ�{�`�ȴ�G�x�}��<fgFE���� �Kd�Z�vV�7B{����-������;zds��#���04{Hũ�w��`��%B�ߖ��U�`��+q�[�J*��W:F�(�ܐ���I"c�{F^��5(Q�����2Ջv�i-���\�_g��� ��i���t�)zYQ��7� UH���NJ	��� �T�P���)�K �cRCA%o����?4�F8��v��[e;]�E�
m�4�lſ.�6�Վs�q��G�Ap-Ӆ�w3Dǟ�Iܷ�ʮa�p'�Ɂ�=���X��x�Q��R<�73(��e~g'cGdqb���U�&\�Qn�����M����~2�/�ƭ�h��i�:[���M+}UeTu�}X�f&��d!�E��LW����
9�<��<�'N���=���
�Pe�=�O���~�u��Q�2���3���s��{�����*^R���X��߳��&���y�nFK�[��{�x���Cg��&Ý���}�2���],��n��{l�) ��e�4N�~�bec�������BZ7����d�j��:b찑C��N+)���x����4�:�d���榱8�4E<Q�!�/JX�_��u`h�d��Op���[YV�򧦔�r,S�|���+DX�5�D.wO�jb��t@e�걈�9]�ȲV9�?�5S9Տ1�xd�ur�/�	Fy�b��_���R���y����\�D̸�`y�B�/ȬߔԔ#�B^�peN���4�Vl5�l���H|!�����������Y��;VW;��j�a{����w��p0�w���≩0Ayp	��LG�<��R�&����ۤ�M��t
1��F�x�h��ѭ̼w���jO!ͥ��!7�dH�a]�ހJ��WuB	\�-�k�mU�Q��\��&;�#b�Q��*��
0Dt�iL����ʛ=�)r��
=
	�O�?����~���Ë�@d?��.
��jbV�j�vpcY�|�$�:l�[�B���F4r5H��E�s<9zZ�l�I����Nҧ49�M����Wف�MP��1����~��y�<�[��+�%s�@Q
��ܻ2`T����`���n�9��
����)�v��)��5�gV.��T�X���v�K$�%$yݘ�w.>����Z߈��҄5��V�ϊ�G��⃴�(F��3�\s�Ka���\ns�0-�'{e��JE�lR��h�lb;~�m��؏��)Hω��ى�Z>)�?l����{��m$\F�2+��@w���x��)\�S^I,����;l���;TZ�u��k�nH)���j�n'X#w�}�8*�������r��<���W���)����8@#�:r��-���Y��%-���{��C�R%��	��������Y�ԡ�|Fg_��#����l�05��"�Qߖ�Gj��ŗ(�ȭ��`Atr%>�P��Q��r���ѹI�c�t�Ο��~<N��3���`���Z`��0�]op��0��Lz��y��6�l�'_��
Ԥ��҆��:ү�8�;��g�e�a�\�$�v�L�z�[���{�ۻtM�D@�\���o~�e{�\��u!p"ruދS%/j��;�4�
4�f�u�)�^]��9�_J#��6�n�~;�{�P]�)%��ey�k^]=�cfچ��f�V�����7|	Y%��B��|��{4�9�Lw�G�`������g|Ap�n��:7�$;!`��&M����蒵�O��aNخJ�y����$L�>��Z!��J�Zq5[�Tq�~ΗT7 �I�e�V�0*߮ .�n%��<�Y����
]�.�u�R��ƃsv�.P����y8���`�T\�}�8pO#g���D�~����)ԝ�����5M:#p������gWP��d��� t�K��x8��p�'Qݩ����=��07:a��A%k��tM���2c�ږ�Imz�U��5���l��фZ����N�}�L�_W�i�8���td��awuw뾚�Ծ�b1Z]&���A#{���PKhӶ��p�3��"��B5�R27���M��͜Ũ�-��p���~��-�XO�OV�{9Zh�������wZ��@��^�R}�C(a����t����x��䛅�c� �  �;R�� ĥ�~�G6�KS}��[����N}���Js����o~�cw�/���y���7?���������gnM��u�^o��E5k������E\��d\����6��/%X�'WS����4�Eŉ�k?�v�>(��T��^�W��Ei5�a���X��5Ѽ����	��l?[D��?���I����bS�]5#/̩�}�w�4�nD6!]��n���7ɍ��)1^�"j�oM�
�/��Ի@X�9o��\��97_e,�tM&*יm�P.�׊�|�WP�Kk/t]�p�M�en(���ù�Z9�����q����
���|�+ڜ�io�`���F���_�"�+��DJ��b�E �Y�@���q`���6��S�.g��u��v����ꚱv      �      x��ZM��F�=�E�O�6� �{N�,ɖd���g7�Q�$Z ���b��?�/�Q1�Än���O���{Y�M��[$�����|��Uǝ�ܔ�j�O�Tf�[[�Lg�W������8ՔZ���
��Vym+��®f�.�z�gU�gOu�n?k�r���{c�j�K��e�|]�Un�+;���"�M���
K��I�'�.��$Ӳ��ᅕ6��h���~�2wk��W��S,�6�ߚ�颫��~Ƅ++3�`':��~t
SfM�g��Q��~�'c0)\QD�ƨT׺�����V�.k�Z3M�h0F����`2^Pp��_Ե-�qV=�oU��ܖ��_��O�%���e�^k,�0ސ�e�{�W����)������L�;�cq��w�ǽ�Z�#��۽����U��|Y���/Y���KO
��)3�=Y���|VITM�+��.I��v�^�72��o�nU�����.����{��Q'�$�~'���^��7T���7���O{�{��˸ٟDɠ����x2L��i��&��z��Wp��ݬ͢G�������t8������"Zu���T��I��n�����*���qpm�� <�Y�yfJg��Bg�*��+=����Z7��Y�j]�H�n͝�4�\�Ci����p�3gζT�|h|6�Z"������&��Y]���mZƉG��귒����L�cam���L���)ΩVM�ę���s��b2jX/#�{�t߆�]�s���Qm?��C�Jx����X��;;��u�ui� �妲%�g^4�L�J��/b��a��#Sڙ��m�{y0��?�2��بg�*M�����������@p��V��cUB�#ݔ���YZ��������L��3`ϦKK��!̬t����|�Wf��l���ġ����`5������S�0̣�Gp��ώ�J$pC��s���9�=�?$�f"�y�BH���`��x0���H��ߟ�&�89N��t:�M�D������kfF� �F���!�?�@<@T�:�f8�/����.�a3w�DL|yl]mss�������X�2�� X���2��k2ɇ���֨A�9�5D7V���H��Ȱ���1U��X�;�ǆ�����/9r��ʇ�>���/L���YV����/��d�>`̕l�v�����G�Y|Z�J�,�ӓ���(y��O��v�_�2GDs�x!/�ڤ=89�����3�ےe�,�Dǉ�dÃ�-N.�k���̑k�����Ý���6�C�ȼ���r�P��q�a_��� ��=5,�u�d�M�T�d-Ex�8L�|ŪL��6�6��͚jaɦ0�GFTGd@�|�
�o�-T[�+�4厓�˲ �Lyۘ�Ɖ!l��U[�C�}8�m�S��+��_7���n�x�jExoi0W���� ����Ŏ���R�S�X��;X a	�K=#� AU��Vy`2����$ �����5-ɔ6!l�n��S�"��nL��-�`�R;�#|$��A4J����[��&�ao4���k����F�\�^��@'�z&ć���������0#�H���GBAL�;�r-(����;�i�庍Vw�ku��Hm���h����
5����0;����%��a�N���d9�`ɠ�*tKz5K;��
�����PW@˟g��/@3�XM���r��ꃹ�q�0Ȝ�Z��k�iY,A�YN� Fq�rƳI_�����ƻ;ѳ�I}�y')��R��a�D=+�cl�O"dp�A<��q����2N���r��_q3�M��IyK����ȹGQ<'��ٰ���K����늿܆_�It�ѻ�Q?�◙������-�����=�q5"p�����&��XZ�f���!�,�E>��Q�9��`�oBf��¦*1�u�����_!��\�,*J��W-ij+b�|sͲA�Ř�d����<mr�dw�fY?#��z��N�h8ϙ������'�~���}���'�����(\�#ݲ߃M%{`�C��m���uВ<m:���]K<ޮIO+6�椬#c�B���Z�*8P:˷��v�>ߑJiC��4_�a��L��l����x:흃��1�q=FWM��zb���bs�����H�^,[�^�����MF't�ӣ��G�4>u^co�~QJu�I�^��1DߚH�R��6V�($�}����k`_�9�Ю�<�T��ƏE����af�Z�h�L��p�s�<��u�x��9Cs����h�B|�&��l�?�����b@��1��'dIbQ(���B=�ŝ� T^�����Iw�Gۤ����I_|��g!l�*�x��p�$_����o?�_N-Е��;��CĔ;�;�Zu�Ua����D�,���&��{����B�]���#�c��P%��?a󍙛��4�s���p��&^΁C����k=+lף��Y��P�;�vJ޿K4IB�<~ˌe�y���y#�,ؾ�G�HVcZ��aHW�^�΂cĔ�?i��?��߹��5�����Zj/wאB���Ly� '���Pޘ���%ZB�x O�	���)��B �NaK�hG.� �K��o�ix���x~��M6�l�VW�H�����B"#d���X����8%����$���&J��~	���.�uѵ(���$M�9H�H�o�9.�����D�Q��TG��ǈ��"�T���w�280���Aop6������-��De6��j���!����{�;���q�O�n��V��/t�%���;a'�̻UI�騫R/X�FW��|:ฝ~�+��F}o*̲@�
��#��������D�-+��K���#���{ K��:�;'�w}�S*��G���*�*-6l���bg��Lf�3�̅a'Shё=e�"�Rq�����t	���'�NE!T�@�KE�"�"�q0+��㒄+���7�/�	��*Z*�f%���	��=���^�]��F��}S�]H��2�\43���=��$�����L&�J�z-�;�=AV��n

IH�R�����,�	Pj �8R0S89���߻�Hu�[P3��󜓥�F !�"2]�{� �z�|$xJ1F�?9�L�^?N��٤���xE�Yn���_�w@�ѷ����S8�I�
vS ����&�a��^	�Z�Y��o��Ї���!�~]�5�S�������'���~����C-}>��T_�q�C���~V��|�W��C1$Ar���O):�4���xU���(
Rv�H����M�P 4�,>ey*<W�ڠ�3��>R�.�z� \^!��z�^0/
l��ǟ�]uM������e��z�@��F�,��ߓ�D��;�����n1ۼ0��EZie<W��&���������H�z=PZ�B�o%�Ԛ��g�K�2��Zn�$��pX���Y���s$p�i�B��;M�B6	 R����� �]׶�My��a��0��%%���,x�7��V�)y|��
��b2��Ag�9�^��a/��I>�e4����T`�F'�vr9�FI?O�g��U���ƧDP��L�R�H��{���������Ǒz�E+jNw^m�öL�����AW���7�V�~A��e�^=:ъϻ��JEM���xH�2��"|V�����^Jӹ@<��Eb%�F��7�>�Y�KG+K-�	:��^�7z���k�6w%�V�ljvY����`
�^��.��Q��ܹ�@��Wc�o������ ���[���`�R�Q|̽б?�d�[|�8�h��g����a=`���ŉ��>0ëy�{��XӔy?�����|�E����q�H�^��T�u����k��C�:����7�l���w'�RS�5��I;-)[sk�nc�+t��D���کb��QhPj%�\�dR=�iTv�u�񝔸9܄�=I��PЏ)��׻L�(�@�o=�-���T��?�=0C%�p2���_��XP%�W�΅�=B��B�W����~�����(����Da�f��= ��wQ�<[���rn{�n�N��{��ՏF! �  ��(0��7|�E�����/�4�]���a�a	,���{z %6���Cv&���/�Bx��.��E4���е=��;���&��H5
������\���Y���I���#�f+���4ߖ��W�Q�+� =��<PӘ���֖�� GR�n�B���MC|�E��t��c
N���W�ݝ���5+!F�����,b3�쏢Q<�O�����`:��	�����^/�'�YSm~�
�ў�ݷb�B�[�a8���w`}�6�^4����{�ok�^�1?a�Ӟt,�U��3A}ݐ�r�[�h�%��D|����(�����-:x�!j0�W�L8�%EZ[FQ6KkΆ�����[�o�8d�v��0�0���K{UO�cE��М�d�;��lB�$H$*$+�W{���;�V��:�kZO�,E��W0y[�v�T��#i��ɿ)�
x�AK�X|	YZ��"��6�E٢e�$Md���R2N�O�l�Hl�(!�v�L�%�p;.6x(�KM�h���{�K��k�U1����ް�i�}����d�R����M+�B���z�,�Db�w��犽N/7t�D���3�L�h0RmDaLn:>�B4��hǃ�ߙ���M��I��n����~��������      �   m   x�}̻�0�᚜"�8���]g��?�����w���� ��� ?8��C��´fULKlz���2Ի�ވ}c
�R�7`ԏ{b�P��_����	)�      �   w   x�}�=
�@F�Sx��;I���l	���l�qI���=��V������%:��Ӊy4%�[�: T�����K�(t���Z�F݅,g�F����<�����ԓK�����J���6h      �   R   x�}��� ��d�. �K)����Q^�/�%K���Qac+��p�[\`���6a�$��V�z��I���zқ���$O�v��      �   T   x�U�� ADѻ`�Zc�\6�8vo8���Bh�`�n~�M�-ZNԢ�����`��8]a�&	�pBY��O��AW����|5&-�      �   �   x�}�AN�0@�u|�^`";N�6�� ,�TU�"A3j�q V�C�	Y�/�6���zNk-�!���a@��Ef뜈P����4?��R������f�D�vB��;lN�^Җ��[Qo��z���>��%Bq�!�[�ʑ�qb�c�+��ے�8��He�𿀚�2���c����y�������!m[�~7�����4j����'�is�      �     x�m�Mj�0���)��֪F�Ѫ��-	4���
�vU\pn�eϑ�U�v(��c��� ?���o}�M��!�������̓�a��n���B�	wB7��y3mvˈ�V�|7�>����A����P%a%�ø+��PW5D��&�(�1�"������D����k�Ѳ����=_��.�=�l�.�<�e O�24��\*�豚�퇲v��E��U)8(Np;z���M;:�A��j���P�����p�e�#XB     