#Menu para fuçar no SO
#!/bin/bash
#Autor: Ariane Cirilo de Oliveira.

contararquivo()
	{
	echo "Digite o caminho que deseja contar"
	read caminho
	resp=$(ls -l $caminho | wc -l)
	resposta=$(($resp - 1))
	echo " O caminho desejado tem: " $resposta "arquivos"
	sleep 3
}

deixarexecutavel()
{
	echo "Digite o arquivo que deseja tornar executável"
        read arquivo
	chmod +x $arquivo
	ls -l
	sleep 3
}

copiar()
{
	read -p "Pasta origem " pastaOrigem
        ls -l $pastaOrigem
	read -p "Entre com a pasta destivo " pastaDestino
	if [ -e $pastaOrigem/arquivo ]
		then
	cp $pastaOrigem/$arquivo $pastaDestino
		else
		echo "Arquivo não existe"

	ls -l $pastaDestino
	fi

	sleep 3

}

tirarpermissao()
{
	echo "Digite o arquivo que deseja retirar a permissão de execução"
        read arquivo
	chmod -x $arquivo
	ls -l $arquivo
	sleep 3
}

trocarNomeArquivo()
{
	echo "Digite o arquivo que desja trocar o nome"
	read nomearquivo
	echo "Digite o novo nome do arquivo"
	read novonome
	mv $nomearquivo $novoarquivo
	sleep 3
}

criarUsuario()
{
	echo "Qual nome do Usuario?"
	read usuario
	sudo adduser $usuario
	ls -l /home

	if [ $? - eq 0 ]
		then
		echo "usuario  criado"
	else
		echo "usuario já existe"
		criarUsuario
	fi
	sleep 3

}

listaArquivodaPasta()

{
	echo "qual pasta você deseja lista? "
	read pasta
	ls -l $pasta
	sleep 3
}


criarGrupo()

{
        echo "qual nome do grupo? "
        read grupo
	 	sudo groupadd $grupo
		if ["( cat /etc/grpup |grep -i $grupo |wc -l)" = "1"];
		then
		echo "grupo criado"
		sleep 3
		fi
}

apagarGrupo()

{
	echo "qual grupo quer apagar?"
	read $nomegrupo
	sudo groupdel $nomegrupo

	if  [ "(cat /etc/group |grep -i $nomegrupo |wc -l" = "0"];
	then
	echo "grupo excluido"
	sleep 3
	fi
}

mostrarIP()
{
	clear
	ip=$(ifcofig |grep "inet" |head -1|awk '{print $2}')
}

excluirUsuario()

{
	echo "Qual usuario deseja excluir"
	read usuario
	sudo adddel $usuario
	ls -l /home

	if [ $? - eq 0 ]
		then
		echo "usuario  excluido"´
	else
		echo "usuario não existe"
	fi
	sleep 3
}

excluirDiretorio()
{
	echo "qual diretorio deseja excluir?"
	read diretorio
	sudo mcdir $diretorio

	if [$? - eq 0]
	then
	echo "diretorio excluido"
	else
	echo "Diretorio não existe"
	fi
}


x=0
while [ $x -eq 0 ]
do

	echo " ________________________________________"
	echo "|          O que deseja fazer?          |"
	echo "|                                       |"
	echo "|1 -  Contar arquivo                    |"
	echo "|2 -  Tornar um arquivo exeutavel       |"
	echo "|3 -  Copiar um arquivo                 |"
	echo "|4 -  Tirar permissão de um arquivo     |"
	echo "|5 -  Trocar nome do arquivo            |"
	echo "|6 -  Criar Usuario                     |"
	echo "|7 -  Listar os arquivos de uma pasta   |"
	echo "|8 -  Criar Grupo                       |"
	echo "|9 -  apagar grupo                      |"
	echo "|10 - Ver o numero de IP                |"
	echo "|11 - Excluir usuario                   |"
	echo "|12 - Excluir diretorio                 |"
	echo "|                                       |"
	echo "|                                       |"
	echo "|0 - Sair                               |"
	echo "|                                       |"
	echo "| --> Entre com a opção desejada        |"
	echo "________________________________________|"
	read ops

if [ $ops -eq 1 ]; then
	clear
	echo "Você escolheu Contar os arquivos:"
	contararquivo;
fi

if [ $ops -eq 2 ]; then
	clear
	echo "Você escolheu tornar um arquivo executável:"
	deixarexecutavel
fi

if [ $ops -eq 3 ]; then
        clear
        echo "Você escolheu Copiar um arquivo:"
        copiar
fi

if [ $ops -eq 4 ] ;then
        clear
	echo "Você escolheu tirar permissão de um arquivo"
fi

if [ $ops -eq 5 ]; then
        clear
	echo "Você escolheu trocar o nome do arquivo"
	trocarNomeArquivo
fi

if [ $ops -eq 6 ]; then
        clear
	echo "Você escolheu criar um novo usuario"
	criarUsuario
fi

if [ $ops -eq 7 ]; then
	clear
	echo "você escolheu listar os arquivos de uma pasta"
	listaArquivodaPasta
fi

if [ $ops -eq 8 ]; then
	clear
	echo "você escolheu criar grupo"
	criarGrupo
fi

if [$ops -eq 9]; then
	clear
	echo" Você escolheu escluir Grupo"
	apagarGrupo
fi

if [$ops -eq 10]; then
	clear 
	echo "O numero do IP é"
	mostrarIP
fi

if [$ops -eq 11]; then
	clear
	Echo "Você escolheu excluir um usuario"
	excluirUsuario
fi	

if [$ops -eq 12]; then
	clear
	echo "Você escolheu excluir um diretorio"
	excluirDiretorio
fi

if [ $ops -eq 0 ]; then
	exit
fi

done

