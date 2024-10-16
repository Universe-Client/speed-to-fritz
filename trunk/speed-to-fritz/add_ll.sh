#-#Seems to modify the Firmware.conf in some way.
#!/bin/bash
if ! [ -f "./link.lst" ]; then
	cat ./Config.in > ./link.lst
	sed -i -e '1,/--- General settings for Speed-to-fritz ---/ s/.*//' -e '/---     Config or Menu    ---/,$ s/.*//g' -e 's/#.*//' -e '/^$/d' "./link.lst"
	sed -i -e 's/^.*default//' -e 's/^.*config *//' -e 's/^ *//' -e '/string/d' -e '/mainmenu/d' -e '/comment/d' -e 's|^"|="|' "./link.lst"
	sed -i -e '/^$/ d' "./link.lst" #remove blanc lines
	sed -i -e '$!N;s/\n//' "./link.lst" 	# join two lines
fi
if ! grep -q  '@AVM' ./Firmware.conf && ! grep -q  -e 'http://'  ./Firmware.conf ;then
	mv "./Firmware.conf" "./Firmware.conf.1"
	echo "#!/bin/sh" > "./Firmware.conf"
	cat ./link.lst >> ./Firmware.conf
	cat ./Firmware.conf.1 >> ./Firmware.conf
	rm ./Firmware.conf.1
fi
list=$(grep  'config [A-Z]' "./Config.in" |  sed -e 's/^ *//' -e 's/#.*//' -e 's/ //' -e '/\t.*/d' -e 's/config/# /' -e '/^$/d' -e 's/ $//' )
for i in $list; do
	! grep -q "$i" "./Firmware.conf" && echo "# $i is not set" >> ./Firmware.conf
done

