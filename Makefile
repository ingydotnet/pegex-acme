doc: ReadMe.pod

ReadMe.pod: doc/pegex.swim
	swim --to=pod $< > $@
