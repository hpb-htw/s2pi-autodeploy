build:
	doxygen doxygen.conf
	rsync -a --delete tmp/html/ s2pi-doc --exclude .git

test:
	make -C s2pi/demo
	
preview:
	python -m http.server -d s2pi-doc & true
	
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

