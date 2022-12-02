

#docker-compose

sudo systemctl start tp-edp.timer





install_and_start(){
        install
        start_tp

	        }

while getopts ixustm:name
do
	        case $name in
        	i) install;;
       		x) install_and_start;;
       		u) uninstall;;
        	s) start_tp;;
		t) stop_tp;;
		m) export MONEDA=$optarg:
		*) printf "Usage: %s [-i|-x|-u|-s|-t|-m]\n\n\t -i:install \n\t -x: install and star" $0 exit 2;;
		esac
done
shift $(($optind-1))

#install_and_start
#uninstall

																					~              
