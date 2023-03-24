#!/bin/bash

if [ $(id -u) -ne 0 ]; then 
  echo \"O usuário atual não é o root\"

  exit
fi

echo "Criando a estrutura de diretórios."

mkdir /publico
mkdir /adminstrativo
mkdir /venda
mkdir /secretaria

sleep 2

echo "Criando grupos dos usuários."

groupadd grp_administrativo
groupadd grp_venda
groupadd grp_secretaria

sleep 2

echo "Criando os usuários."

useradd carlos -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_administrativo && chage -d 0 carlos
useradd maria -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_administrativo && chage -d 0 maria
useradd joao -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_administrativo && chage -d 0 joao

useradd debora -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_venda && chage -d 0 debora
useradd sebastiana -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_venda && chage -d 0 sebastiana
useradd roberto -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_venda && chage -d 0 roberto

useradd josefina -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_secretaria && chage -d 0 josefina
useradd amanda -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_secretaria && chage -d 0 amanda
useradd rogerio -m -s /bin/bash -p $(openssl passwd -6 mudar123) -G grp_secretaria && chage -d 0 rogerio

sleep 2

echo "Atribuindo permissões aos diretórios dos usuário."

chown root:grp_administrativo /adminstrativo
chown root:grp_venda /venda
chown root:grp_secretaria /secretaria

chmod 770 /adminstrativo
chmod 770 /venda
chmod 770 /secretaria
chmod 777 /publico

sleep 2

echo "Estrutura de diretório, grupo, usuário e permissões criado com sucesso!"
echo "Fim"

sleep 2