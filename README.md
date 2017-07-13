OptStoic python package
========================
Perform OptStoic analysis using python code that share the same data files with GAMS code. 
Note: All the examples are specific for glycolysis pathway generation. 
Currently, the main package is available in `optstoicpy` folder. We are working to move more modules into the package. 

##Requirement:
*GLPK 4.47 or GUROBI solver
Note: Commercial solvers are more robust than open source solvers. 

1. GLPK 4.47 installation
    ```bash
    wget  http://ftp.gnu.org/gnu/glpk/glpk-4.47.tar.gz
    tar -xvzf glpk-4.47.tar.gz
    cd  ~/glpk-4.47
    ./configure
    make
    make install
    #if the program is successfully installed, you should get an output by typing
    glpsol --version
    ```

2. GUROBI Optimization provide academic license for free (https://www.gurobi.com/). Install gurobipy following the instruction provided by GUROBI. 


##Current project dependencies:
1. pulp 
```pip install pulp```
2. pandas
```pip install pandas```
3. graphviz (for drawing pathway). The [Graphviz](http://www.graphviz.org/Download..php) software is required before installing the graphviz python package. 
    ```bash
    #If you have root access
    sudo apt-get install graphviz

    #If you do not have root access (you can get a different version of graphviz from their website http://www.graphviz.org/Download_source.php)
    cd $HOME
    mkdir -p bin/graphviz
    wget http://www.graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.38.0.tar.gz
    tar xvf graphviz-2.38.0.tar.gz
    cd graphviz-2.38.0
    ./configure --prefix=$HOME/bin/graphviz
    make && make install
    # Check if the graphviz is working
    cd $HOME/bin/graphviz/bin
    dot -V
    # Add the following line to your .bashrc
    export PATH=$PATH:$HOME/bin/graphviz/bin


    #Install the python graphviz
    pip install graphviz
    ```
4. [Component-Contribution](https://github.com/eladnoor/component-contribution) or [Component-Contribution Fork](https://github.com/maranasgroup/component-contribution)