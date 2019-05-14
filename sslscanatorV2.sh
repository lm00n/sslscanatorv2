#!/bin/bash
#Usar formato IP:PUERTO
#En la v2 se puede exportar el archivo a windows (no hay problemas con nombres) y con los puertos (quita limitacion de 443)
for i in `cat $1`;do
	sslscan --no-color --no-failed --no-heartbleed --no-compression --no-renegotiation --no-fallback $i > ${i/:/_}
done

echo "------SSLv2------" >> ${1}-report
grep -il "SSLv2" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
echo "------SSLv3------" >> ${1}-report
grep -il "SSLv3" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
echo "------TLSv1.0------" >> ${1}-report
grep -il "TLSv1.0" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
echo "------SWEET32------" >> ${1}-report
grep -il "CBC3" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
echo "------RC4------" >> ${1}-report
grep -il "RC4" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
echo "------POODLE------" >> ${1}-report
grep -il "SSLv3" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
echo "------Short key length of cipher suites enabled (Less that 128 bits)------" >> ${1}-report
grep -il -e " 56 bits" -e " 40 bits" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
echo "------Short key lenght of DHE cipher suites (Less than 2048 bits)------" >> ${1}-report
grep -il "RSA Key Strength:    1024" --exclude={sslscanator.sh,${1}-report} * >> ${1}-report
echo " " >> ${1}-report
echo " " >> ${1}-report
