build:
	doxygen doxygen.conf
	rsync -a --delete --progress tmp/html/ s2pi-doc --exclude .git

clean:
	rm -rf tmp/

deploy:
	git -C s2pi-doc add .
	git -C s2pi-doc commit -a -m "auto commit" ; true
	git -C s2pi-doc push origin master
	git -C s2pi add .
	git -C s2pi commit -a -m "auto commit" ; true
	git -C s2pi push origin master
	git commit -a -m "autodeploy done"
	git push origin main

