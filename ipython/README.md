A docker container for running [IPython 3.0](http://ipython.org/) over Python 3, and the development version of [Spot](https://spot.lrde.epita.fr/) (i.e., what will eventually become Spot 2.0).

Start it as follows:

    sudo docker run -p 8888:8888 -t -e USERID=`id -u` -v $PWD:/home/docker/remote gadl/spot-ipython run-nb

And then connect to http://localhost:8888/

The current directory will appear as `remote/` in the notebook.  The reason we your user id to the script is to ensure any file you write in that `remote/` directory has you as owner (rather than root, or some arbitrary userid).

This installation of IPython 3.0 also have [a number of notebook extensions](https://github.com/ipython-contrib/IPython-notebook-extensions) installed, but not they are not loaded by default.  So you have to [do it yourself](https://github.com/ipython-contrib/IPython-notebook-extensions/wiki#interactive-loading-of-a-notebook-extension).

There is also a profile called `rise` that is meant to make notebook-based presentations.  This profile activates [RISE](https://github.com/damianavila/RISE), as well as a couple of useful extensions: `usability/hide_input` and [`usability/hide_input_all`](https://github.com/ipython-contrib/IPython-notebook-extensions/wiki/hide_input_all) to hide one or all code cells.  It also activate the cell magic `%%tikz` to display TikZ figures.   You can start in this profile with:

    sudo docker run -p 8888:8888 -t -e USERID=`id -u` -v $PWD:/home/docker/remote gadl/spot-ipython run-nb --profile=rise

(All Arguments passed to `run-nb` get passed to the `ipython notebook` command.)


The following additional command-line tools are installed in the container, as Spot can interact with them very easily and they have little dependencies.

- [ltl2ba](http://www.lsv.ens-cachan.fr/~gastin/ltl2ba/) 1.2b1
- [ltl3ba](http://sourceforge.net/projects/ltl3ba/) 1.1.2
- [ltl3dra](http://sourceforge.net/projects/ltl3dra/) 0.2.2
- [ltl2dstar](http://www.ltl2dstar.de/) 0.5.3
