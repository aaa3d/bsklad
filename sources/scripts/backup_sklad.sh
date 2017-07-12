#/bin/sh

mount -t cifs -o codepage=cp866,iocharset=koi8-r,username=backup,password="Olimpiya143917b" //192.168.0.2/Arhive$ /mnt/server


dbServer=192.168.0.1
dbBaseAlias=bsklad2009
dbLogAlias=bsklad2009.log
GBAK=/opt/firebird/bin/gbak
GFIX=/opt/firebird/bin/gfix
archivePath=/archive/sklad
netArchivePath=/mnt/server/sklad

echo "Начало архивации баз арм склад" `date`>> $archivePath/archive_log.log

#архивация
$GBAK -user beginner -pass mayby -G $dbServer:$dbBaseAlias $archivePath/$dbBaseAlias.gbk >> $archivePath/archive_log.log
$GBAK -user beginner -pass mayby -G $dbServer:$dbLogAlias $archivePath/$dbLogAlias.gbk >> $archivePath/archive_log.log
#чистка мусора
$GFIX -sweep -user beginner -pass mayby $dbServer:$dbBaseAlias


rar a -ag_yyyy_mm_dd__hh_nn_ss $archivePath/$dbBaseAlias.rar $archivePath/$dbBaseAlias.gbk $archivePath/$dbLogAlias.gbk >> $archivePath/archive_log.log 
mv $archivePath/*.rar $netArchivePath/

umount /mnt/server

echo 'Архивация баз арм склад завершена' `date` >>/sklad/sklad_2005/arc_log.log

