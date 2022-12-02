NEDA="USD"
PUERTO="3000"

SYNC_FILE="sync.txt"
if [!-e $SYNC_FILE]  #verifica si existe
then
	        touch $SYNC_FILE #sino lo crea
fi

SYNC_DATE_INITIAL=$(stat -c %y $SYNC_FILE)

while true
do
	        sleep 1
	        SYNC_DATE=$(stat -c %y $SYNC_FILE)
	        if [$SYNC_DATE_INITIAL -ne $SYNC_LINES]
	        then
	                SYNC_DATE_INITIAL=$SYNC_DATE
	                COMPRA=$(curl -x get 127.0.0.1:$PUERTO/$MONEDA 2>/dev/null|jq.compra)
	                VENTA=$(curl -x get 127.0.0.1:$PUERTO/$MONEDA 2>/dev/null|jq.venta)
	                echo $(date +%F_%R),$compra,$venta
	        fi
		
done

