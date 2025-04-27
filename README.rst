
Itzï
====

This is a full environment for the Itzï flood model.
It includes:

- GRASS 8
- North Carolina sample dataset
- scripts and parameter files to run the tutorials from Itzï documentation.

How to run the tutorials
------------------------

First, download and run the container in interactive mode:

.. code-block:: bash

    docker run -it lrntct/itzi:25.4 bash

Once inside the container, launch grass:

.. code-block:: bash

    grass grassdata/nc_spm_08_grass7/PERMANENT/

Inside the grass shell, you can now run the tutorial:

    .. code-block:: bash

        sh tutorial.sh
        itzi run tutorial.ini
        itzi run tutorial_drainage.ini
