
#!/bin/bash

#Author: Ainhoa Morales

#MENU

if [ $# -lt 1 ]
  then
    echo ""
    echo -e "\e[93m    scanme.sh [opciones] \e[0m"
    echo ""
    echo -e "\e[36m Opciones: \e[0m"
    echo -e "  \e[4m                 \e[0m \e[4m                                            \e[0m "
    echo -e " |\e[96m\e[4m Opción          \e[0m\e[0m|\e[96m\e[4m Descripción                                \e[0m\e[0m|"
    echo -e " |\e[96m --help     | -h\e[0m | \e[96mAyuda\e[0m                                      |"
    echo -e " |\e[96m --copia    | -c\e[0m | \e[96mRealiza una copia de seguridad\e[0m             |"
    echo -e " |\e[96m --restaura | -r\e[0m | \e[96mRestaurar una copia de seguridad\e[0m           |"
    echo -e " |\e[96m --scan     | -s\e[0m | \e[96mRealiza un escaneo de seguridad\e[0m            |"
    echo -e " |\e[96m --killPID  | -k\e[0m | \e[96mVer procesos y matarlos\e[0m                    |"
    echo -e " |\e[96m --ports    | -p\e[0m | \e[96mAbrir, cerrar o escanear puertos\e[0m           |"
    echo -e " |\e[96m --sudocve  |-cve\e[0m| \e[96mElimina la vulnerabilidad CVE-2021-3156\e[0m    |"
    echo -e " |\e[4m                 \e[0m|\e[4m                                            \e[0m|"
    echo ""
    echo ""

# help

elif [ "$1" = "--help" ] || [ "$1" = "-h" ]
  then
    echo ""
    echo ""
    echo -e "\e[34m ----COPIA DE SEGURIDAD----\e[0m"
    echo ""
    echo -e "\e[92m./scanme.sh --copia\e[0m"
    echo -e "\e[92m./scanme.sh -c\e[0m"
    echo ""
    echo -e "\e[97mNos hará una copia de seguridad del fichero o directorio que le indiquemos.\e[0m"
    echo -e "\e[97mNos la guardará en el mismo directorio en el que nos encontremos y tendrá el nombre que le digamos más la fecha en el día que se realizó.\e[0m"
    echo ""
    echo ""
    echo -e "\e[34m ----RESTAURAR COPIA DE SEGURIDAD----\e[0m"
    echo ""
    echo -e "\e[92m./scanme.sh --restaura\e[0m"
    echo -e "\e[92m./scanme.sh -r\e[0m"
    echo ""
    echo -e "\e[97mRestaurará una copia de seguriad que se le proporcione. Es muy importante saber que directorio o fichero queremos estar restaurando, ya que cuando nos pida el lugar donde restaurar, tendremos que saber la ruta absoluta del fichero o directorio para situarnos en un lugar superior a él.\e[0m"
    echo -e "\e[97mSi no sabemos donde se encuentra el fichero podemos abrir otra terminal (Ctrl+Shift+t) y allí usar el comando realpath "[fichero o directorio]" y nos dará la ruta absoluta de lo que busquemos.\e[0m"
    echo ""
    echo -e "\e[97mEjemplo: realpath "hola.txt"\e[0m"
    echo -e "\e[97mLa salida será: /directorio1/directorio2/hola.txt\e[0m"
    echo ""
    echo ""
    echo -e "\e[34m ----ESCANEO DE SEGURIDAD----\e[0m"
    echo ""
    echo -e "\e[92m./scanme.sh --scan\e[0m"
    echo -e "\e[92m./scanme.sh -s\e[0m"
    echo ""
    echo -e "\e[97mNos realizará un escaneo de seguridad de nuestro equipo.\e[0m"
    echo ""
    echo -e "\e[97m~Mostrará los datos básicos del host.\e[0m"
    echo -e "\e[97m~Nos escaneará los puertos (tcp) abiertos y realizará un análisis de vulnerabilidades con la herramienta nmap.\e[0m"
    echo -e "\e[97m~Examinará y mostrará los comandos que podemos usar bajo root\e[0m"
    echo -e "\e[97m~Nos presentará los ficheros que son vulnerables: ficheros con todos los permisos, ficheros con permisos SUID y SGID.\e[0m"
    echo -e "\e[97m~Procesos que se encuentran bajo root\e[0m"
    echo -e "\e[97m~Nos comprobará si la herramienta sudo contiene el CVE-2021-3156. Para saber más visitar:\e[95m https://www.incibe-cert.es/alerta-temprana/vulnerabilidades/cve-2021-3156 \e[0m\e[0m"
    echo ""
    echo ""
    echo -e "\e[34m ----VER Y MATAR PROCESOS----\e[0m"
    echo ""
    echo -e "\e[92m./scanme.sh --killPID\e[0m"
    echo -e "\e[92m./scanme.sh -k\e[0m"
    echo ""
    echo -e "\e[97mSe nos mostrará un menú en el que podremos elegir:\e[0m"
    echo -e "\e[97m~Ver los procesos\e[0m"
    echo -e "\e[97m~Eliminar un proceso del que ya se sabe el PID. Se preguntará por el PID y se eliminará el proceso\e[0m"
    echo -e "\e[97m~Vemos proceso por proceso de un usuario que le insertemos, y nos preguntará si queremos eliminarlo.\e[0m"
    echo -e "\e[97m~Igual que el anterior, pero con todos los procesos\e[0m"
    echo ""
    echo ""
    echo -e "\e[34m ----ABRIR, CERRAR O ESCANEAR PUERTOS----\e[0m"
    echo ""
    echo -e "\e[92m./scanme.sh --ports\e[0m"
    echo -e "\e[92m./scanme.sh -p\e[0m"
    echo ""
    echo -e "\e[97mSe nos mostrará un menú en el que podremos elegir:\e[0m"
    echo -e "\e[97m~Ver los puertos del host\e[0m"
    echo -e "\e[97m~Ver los puertos de una IP seleccionada\e[0m"
    echo -e "\e[97m~Cerrar un puerto que se le indica\e[0m"
    echo -e "\e[97m~Abrir un puerto que se le indica\e[0m"
    echo ""
    echo ""
    echo -e "\e[34m ----ELIMINAR CVE-2021-3156----\e[0m"
    echo ""
    echo -e "\e[92m./scanme.sh --sudocve\e[0m"
    echo -e "\e[92m./scanme.sh --cve\e[0m"
    echo ""
    echo -e "\e[97mElimina la vulnerabilidad CVE-2021-3156 y para ello simplemente se realiza una actualización de la herramienta sudo.\e[0m"
    echo ""
    echo ""



# Copia de seguridad

elif [ "$1" = "--copia" ] || [ "$1" = "-c" ]
  then

    echo ""
    read -p "Nombre de la copia de seguridad: " NAME
    echo ""

    read -p "Dame el directorio o el fichero al que le quieres realizar la copia de seguridad: " DF
    echo ""

    if [ -d "$DF" ] || [ -f "$DF" ]
      then
        tar -czf $NAME-$(date +%Y-%m-%d).tar.gz $DF     #Se realiza la copia de seguridad
        echo -e "\e[37m[\e[0m\e[0;34mOK\e[0m\e[37m]\e[0m \e[37mCopia de seguridad realizada corectamente\e[0m"
        echo ""
        echo -e "\e[37mEl archivo se ha guardado en: \e[0m"
        echo -e "\e[37m$(realpath "$NAME-$(date +%Y-%m-%d).tar.gz")\e[0m"      #Muestro la ruta absoluta de la copia de seguridad
    else
      echo -e "\e[37m[\e[0m\e[31mX\e[0m\e[37m]\e[0m \e[37mERROR: No existe ese archivo o directorio\e[0m"
    fi

#Restaura

elif [ "$1" = "--restaura" ] || [ "$1" = "-r" ]
  then

    echo ""
    read -p "Dame la ubicación de la copia de seguridad: " COPIA
    echo ""

    read -p "Indica el directorio donde se encuentre el archivo o directorio a restaurar(Ruta absoluta): " UBICACION
    echo ""

    if [ -f "$COPIA" ] || [ -d "$UBICACION" ] || [ -f "$UBICACION" ]
      then
        cd $UBICACION
        tar -xzf $COPIA 
        echo -e "\e[37m[\e[0m\e[0;34mOK\e[0m\e[37m]\e[0m \e[37mCopia de seguridad se ha extraido correctamente\e[0m"
    else
      echo -e "\e[37m[\e[0m\e[31mX\e[0m\e[37m]\e[0m \e[37mERROR: No existe ese archivo o directorio\e[0m"
    fi

#Escaneo

elif [ "$1" = "--scan" ] || [ "$1" = "-s" ]
  then
    scanner() {
    echo ""
    echo ""
    echo -e "\e[1m \e[1;35m         _______________________________________________________________\e[0m \e[0m"
    echo -e "\e[1m \e[1;35m        |      ___   ___   ___    _   _  _   _  ___   ___               |\e[0m \e[0m"
    echo -e "\e[1m \e[1;35m        |     |__   |     |___|  | \ |  | \ |  |___  |  _|    /\ /\     |\e[0m \e[0m"
    echo -e "\e[1m \e[1;35m        |     ___|  |___  |   |  |  \|  |  \|  |___  |  \       .       |\e[0m \e[0m"
    echo -e "\e[1m  \e[1;35m       |_______________________________________________________________|\e[0m \e[0m"
    echo ""
    echo ""
    echo -e "\e[1m \e[96m ----DATOS BÁSICOS---- \e[0m \e[0m"
    echo ""
    echo -e "$(cat /etc/*release)"
    echo -e"INFORMACIÓN SOBRE EL KERNEL: $(uname -a)"
    echo -e "USUARIO: $(whoami)"
    echo -e "FECHA: $(date)"
    echo  "IP: " 
    echo -e "$(ip addr)"
    echo ""
    echo -e "\e[1m \e[96m ----ESCANEO DE PUERTOS Y VULNERABILIDADES---- \e[0m \e[0m"
    echo ""
    echo -e "\e[95m[X] Escaneo de puertos\e[0m"
    echo ""
    sudo apt-get install -y nmap > /dev/null 2>&1 #envio la salida a /dev/null para que no se muestre en pantalla
    sudo ss -tulwnp | grep LISTEN
    echo ""
    echo ""
    echo -e "\e[95m[X] Escaneo de vulnerabilidades\e[0m"
    echo ""
    sudo nmap --script vuln localhost
    echo ""
    echo -e "\e[1m \e[96m ----COMANDOS QUE PUEDES EJECUTAR SIENDO ROOT---- \e[0m \e[0m"
    echo ""
    sudo -l
    echo ""
    echo -e "\e[1m \e[96m ----ARCHIVOS Y DIRECTORIOS VULNERABLES---- \e[0m \e[0m"
    echo ""
    echo -e "\e[95m[X] Ficheros que tienen todos los permisos\e[0m"
    echo ""
    sudo find / -type f -perm 777 2> /dev/null #listo los ficheros que tienen todos los permisos
    echo ""
    echo -e "\e[95m[X] Ficheros con permisos SUID\e[0m"
    echo ""
    sudo find / -type f -perm 4000 2> /dev/null #listo los ficheros con permisos SUID
    echo ""
    echo -e "\e[95m[X] Ficheros con permisos SGID\e[0m"
    echo ""
    sudo find / -type f -perm 4700 2> /dev/null #listo los ficheros con permisos SGID
    echo ""
    echo -e "\e[1m \e[96m ----PROCESOS BAJO ROOT---- \e[0m \e[0m"
    echo ""
    ps -u root
    echo ""
    echo -e "\e[1m \e[96m ----CVE-2021-3156---- \e[0m \e[0m"
    echo ""
    echo -e "Tu versión actual de sudo es: $(sudo -V | head -n1 | awk '{print $3}')"
    echo "$(sudoedit -s '\' `perl -e 'print "A" x 65536'` 2> error_a546454.txt)" 2>/dev/null
    if [ "$(cat error_a546454.txt|cut -d " " -f1)" = "usage:" ]
      then 
        echo ""
        echo -e "[\e[94mOK\e[0m] Tu PC está a salvo"
      else
        echo ""
        echo -e "[\e[91mX\e[0m] Tu PC no está a salvo"
    fi
    rm error_a546454.txt
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
    echo ""
  }
    scanner
    countd="t"
    while [ "$countd" != "s" -a "$countd" != "n" -a "$countd" != "" ]
    do
      read -p "¿Quieres crear un reporte con toda la información recogida? (s/N) " countd
    done
    
    if [ -z "$countd" ]
      then
        echo ""
    elif [ "$countd" = "s" ]
      then
        echo ""
        echo -e "\e[5mRealizando...\e[0m"
        scanner > reporte-$(date +%d-%m-%Y).txt
        echo ""
        echo -e "\e[94m[OK]\e[0m Tu reporte se ha realizado correctamente"
     else
      echo""
    fi

#Matar procesos

elif [ "$1" = "--killPID" ] || [ "$1" = "-k" ]
  then
  
    countdd=7
    while [ $countdd != 1 -a $countdd != 2 -a $countdd != 3 -a $countdd != 4 ]
      do
        echo "Ver los procesos --> 1"
        echo "Matar un proceso del que ya se sabe el PID --> 2"
        echo "Ir proceso por proceso para el usuario que se seleccione --> 3"
        echo "Ir proceso por proceso (todos) --> 4"
        echo ""
        read -p "Inserta tu respuesta : " countdd
        echo ""
      done

    case $countdd in
      1)
        ps -aux;
        echo "";
        echo "";
        
        countk="t";
        while [ "$countk" != "s" -a "$countk" != "n" ]
          do
            echo ""
            read -p "¿Quieres hacer algo más? (s/n) " countk
          done;
          
        if [ "$countk" = "s" ]
          then
            echo ""
            echo ""
             ./scanme.sh --killPID
            echo ""
        fi;;

      2)
        countcount="s";
        while [ "$countcount" = "s" ]
        do 
          echo ""
          read -p "Dame el PID: " procesoPID;
          echo ""
          sudo kill -9 $procesoPID;
          echo -e "\e[94m[OK]\e[0m Tu proceso se ha matado correctamente"
          echo ""
          read -p "¿Quieres matar otro proceso? (s/n) " countcount
        done;
        
        countr="t";
        while [ "$countr" != "s" -a "$countr" != "n" ]
          do
            echo ""
            read -p "¿Quieres hacer algo más? (s/n) " countr
          done;
          
        if [ "$countr" = "s" ]
          then
            echo ""
            echo ""
            sh scanme.sh --killPID
            echo ""
        fi;;

      3)
        echo ""
        read -p "¿De qué usuario quieres ver los procesos? " userprocesos;
        echo "";
        for i in `ps -u $userprocesos| sed 's/|/ /' | awk '{print $1}'|sed '1d'`
          do
            A="n"
            ps -fp $i
            echo ""
            read -p "¿Quieres eliminar este proceso? (s/N) " A
            if [ -z "$A" ]
              then
                echo ""
            elif [ $A = "s" ]
              then
                sudo kill -9 $i
                echo -e "\e[94m[OK]\e[0m Tu proceso se ha matado correctamente"
            fi
                echo ""
          done;;

        4)
          for h in `ps -aux| sed 's/|/ /' | awk '{print $2}'|sed '1d'`
            do
              N="n"
              ps -fp $h
              echo ""
              read -p "¿Quieres eliminar este proceso? (s/N)" N
              if [ -z "$N" ]
                then
                  echo ""
              else [ $N = "s" ]
                  sudo kill -9 $h
                  echo -e "\e[94m[OK]\e[0m Tu proceso se ha matado correctamente"
              fi
              echo ""
            done;;
        *)
    esac

# Abrir, cerrar y escanear puertos

elif [ "$1" = "--ports" ] || [ "$1" = "-p" ]
  then
    countdd=7
    while [ $countdd != 1 -a $countdd != 2 -a $countdd != 3 -a $countdd != 4 ]
      do
        echo "Ver los puertos abiertos (localhost)--> 1"
        echo "Ver los puertos abiertos de una IP (con nmap)--> 2"
        echo "Cerrar puertos --> 3"
        echo "Abrir puertos --> 4"
        echo ""
        read -p "Inserta tu respuesta : " countdd
        echo ""
      done

      case $countdd in
      1)
        sudo ss -tulwnp | grep LISTEN;
        echo "";
        echo "";
        
        countk="t";
        while [ "$countk" != "s" -a "$countk" != "n" ]
          do
            echo ""
            read -p "¿Quieres hacer algo más? (s/n) " countk
          done;
          
        if [ "$countk" = "s" ]
          then
            echo ""
            echo ""
            sh scanme.sh --ports
            echo ""
        fi;;

      2)
        echo ""
        read -p "Dame la IP: " IPMachine;
        sudo apt-get install -y nmap > /dev/null 2>&1;  #envio la salida a /dev/null para que no se muestre en pantalla
        sudo nmap -sC -sV -sS $IPMachine;   # escaneo los puertos
        
        countr="t";
        while [ "$countr" != "s" -a "$countr" != "n" ]
          do
            echo ""
            read -p "¿Quieres hacer algo más? (s/n) " countr
          done;
        
        if [ "$countr" = "s" ]
          then
            echo ""
            echo ""
            sh scanme.sh --ports
            echo ""
        fi;;

      3)
        countpuertos="s";
        while [ "$countpuertos" = "s" ]
          do
            echo ""
            read -p "¿Quieres cerrar un puerto? (s/n) " countpuertos
            if [ "$countpuertos" = "s" ]
              then
              echo ""
              echo ""
              read -p "Dame el puerto que quieres cerrar: " PUERTITO
              echo ""
              sudo ufw deny $PUERTITO
              echo -e "\e[94m[OK]\e[0m Se ha cerrado el puerto"
            fi
          done;

        countr="t";
        while [ "$countr" != "s" -a "$countr" != "n" ]
          do
            echo ""
            read -p "¿Quieres hacer algo más? (s/n) " countr
          done;
        
        if [ "$countr" = "s" ]
          then
            echo ""
            echo ""
            sh scanme.sh --ports
            echo ""
        fi;;
      
      4)
        countpuertos="s";
        while [ "$countpuertos" = "s" ]
          do
            echo ""
            read -p "¿Quieres abrir un puerto? (s/n) " countpuertos
            if [ "$countpuertos" = "s" ]
              then
              echo ""
              echo ""
              read -p "Dame el puerto que quieres abrir: " PUERTITO
              echo ""
              sudo ufw allow $PUERTITO
              echo -e "\e[94m[OK]\e[0m Se ha abierto el puerto"
            fi
          done;

        countr="t";
        while [ "$countr" != "s" -a "$countr" != "n" ]
          do
            echo ""
            read -p "¿Quieres hacer algo más? (s/n) " countr
          done;
        
        if [ "$countr" = "s" ]
          then
            echo ""
            echo ""
            sh scanme.sh --ports
            echo ""
        fi;;

      *)

    esac

# Quitar CVE-2021-3156

elif [ "$1" = "--sudocve" ] || [ "$1" = "-cve" ]
  then
    #Simplemente para quitar el CVE-2021-3156 hay que actualizar sudo:
    sudo apt-get install -y sudo > /dev/null 2>&1 #envio la salida a /dev/null para que no se muestre en pantalla
    echo -e "\e[94m[OK]\e[0m Se ha parcheado la vulnerabilidad, ¡ya estás a salvo!"

#ERROR

else
    echo 
    echo -e "\e[31m ERROR: argumento erróneo\e[0m"
fi

