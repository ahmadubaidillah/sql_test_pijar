PGDMP     6                    {            db_test_pijar    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16918    db_test_pijar    DATABASE     �   CREATE DATABASE db_test_pijar WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE db_test_pijar;
                postgres    false            �            1259    16948    account    TABLE     �   CREATE TABLE public.account (
    acc_number character(13) NOT NULL,
    acc_owner integer,
    acc_date_created date NOT NULL,
    acc_balance numeric(10,0) NOT NULL
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    16920    customer    TABLE     ?  CREATE TABLE public.customer (
    cust_id integer NOT NULL,
    cust_firstname character varying(30) NOT NULL,
    cust_lastname character varying(30),
    cust_birthdate date,
    cust_gender character(1),
    cust_address character varying(50),
    cust_city character varying(20),
    cust_postcode character(5)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16919    customer_cust_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_cust_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.customer_cust_id_seq;
       public          postgres    false    215                       0    0    customer_cust_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.customer_cust_id_seq OWNED BY public.customer.cust_id;
          public          postgres    false    214            �            1259    16959    transaction    TABLE     �   CREATE TABLE public.transaction (
    trs_id integer NOT NULL,
    trs_from_account character(13),
    trs_amount numeric(10,0) NOT NULL,
    trs_date date NOT NULL,
    trs_type character(2) NOT NULL
);
    DROP TABLE public.transaction;
       public         heap    postgres    false            �            1259    16971    transaction_transfer    TABLE     �   CREATE TABLE public.transaction_transfer (
    trs_id integer NOT NULL,
    trs_status character(1) NOT NULL,
    trs_to_account character(13)
);
 (   DROP TABLE public.transaction_transfer;
       public         heap    postgres    false            �            1259    16970    transaction_transfer_trs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_transfer_trs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.transaction_transfer_trs_id_seq;
       public          postgres    false    220                       0    0    transaction_transfer_trs_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.transaction_transfer_trs_id_seq OWNED BY public.transaction_transfer.trs_id;
          public          postgres    false    219            �            1259    16958    transaction_trs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_trs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.transaction_trs_id_seq;
       public          postgres    false    218                       0    0    transaction_trs_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.transaction_trs_id_seq OWNED BY public.transaction.trs_id;
          public          postgres    false    217            s           2604    16923    customer cust_id    DEFAULT     t   ALTER TABLE ONLY public.customer ALTER COLUMN cust_id SET DEFAULT nextval('public.customer_cust_id_seq'::regclass);
 ?   ALTER TABLE public.customer ALTER COLUMN cust_id DROP DEFAULT;
       public          postgres    false    214    215    215            t           2604    16962    transaction trs_id    DEFAULT     x   ALTER TABLE ONLY public.transaction ALTER COLUMN trs_id SET DEFAULT nextval('public.transaction_trs_id_seq'::regclass);
 A   ALTER TABLE public.transaction ALTER COLUMN trs_id DROP DEFAULT;
       public          postgres    false    218    217    218            u           2604    16974    transaction_transfer trs_id    DEFAULT     �   ALTER TABLE ONLY public.transaction_transfer ALTER COLUMN trs_id SET DEFAULT nextval('public.transaction_transfer_trs_id_seq'::regclass);
 J   ALTER TABLE public.transaction_transfer ALTER COLUMN trs_id DROP DEFAULT;
       public          postgres    false    220    219    220                      0    16948    account 
   TABLE DATA           W   COPY public.account (acc_number, acc_owner, acc_date_created, acc_balance) FROM stdin;
    public          postgres    false    216   K%                 0    16920    customer 
   TABLE DATA           �   COPY public.customer (cust_id, cust_firstname, cust_lastname, cust_birthdate, cust_gender, cust_address, cust_city, cust_postcode) FROM stdin;
    public          postgres    false    215   �%                 0    16959    transaction 
   TABLE DATA           _   COPY public.transaction (trs_id, trs_from_account, trs_amount, trs_date, trs_type) FROM stdin;
    public          postgres    false    218   �%                 0    16971    transaction_transfer 
   TABLE DATA           R   COPY public.transaction_transfer (trs_id, trs_status, trs_to_account) FROM stdin;
    public          postgres    false    220   1&                  0    0    customer_cust_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.customer_cust_id_seq', 2, true);
          public          postgres    false    214                        0    0    transaction_transfer_trs_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.transaction_transfer_trs_id_seq', 1, true);
          public          postgres    false    219            !           0    0    transaction_trs_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.transaction_trs_id_seq', 3, true);
          public          postgres    false    217            y           2606    16952    account account_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (acc_number);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    216            w           2606    16925    customer customer_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cust_id);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    215            {           2606    16964    transaction transaction_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (trs_id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public            postgres    false    218            }           2606    16976 .   transaction_transfer transaction_transfer_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.transaction_transfer
    ADD CONSTRAINT transaction_transfer_pkey PRIMARY KEY (trs_id);
 X   ALTER TABLE ONLY public.transaction_transfer DROP CONSTRAINT transaction_transfer_pkey;
       public            postgres    false    220            ~           2606    16953    account account_acc_owner_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_acc_owner_fkey FOREIGN KEY (acc_owner) REFERENCES public.customer(cust_id);
 H   ALTER TABLE ONLY public.account DROP CONSTRAINT account_acc_owner_fkey;
       public          postgres    false    3191    215    216            �           2606    16977 =   transaction_transfer transaction_transfer_trs_to_account_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction_transfer
    ADD CONSTRAINT transaction_transfer_trs_to_account_fkey FOREIGN KEY (trs_to_account) REFERENCES public.account(acc_number);
 g   ALTER TABLE ONLY public.transaction_transfer DROP CONSTRAINT transaction_transfer_trs_to_account_fkey;
       public          postgres    false    216    3193    220                       2606    16965 -   transaction transaction_trs_from_account_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_trs_from_account_fkey FOREIGN KEY (trs_from_account) REFERENCES public.account(acc_number);
 W   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_trs_from_account_fkey;
       public          postgres    false    216    218    3193               ,   x�3T@���FFƺ���f��\F(�F�� �=... ^�
#         N   x�3��������L�HL��4��4�50�54�4�442V�M��S.�t�,�	��rq�$�e�p&�&g'��%F��� ��         <   x�3�4T@���FFƺ����.N\Fh*L�Xp:q�)0B63č+F��� C�            x�3�4�4R@\1z\\\ #o�     