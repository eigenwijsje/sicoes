##########################################
Seguimiento a las convocatorias del SICOES
##########################################

Esta aplicación facilita el seguimiento a las convocatorias nacionales para
contrataciones de bienes y servicios generales, publicadas por el SICOES_, a
través del sitio de INFOSICOES_.

La información básica de todas las contrataciones se obtienen con un rastreador
con Scrapy_.

Esta información se revisa a través de una aplicación Django_, donde se
determina si es interesante y si es necesario el documento base de contratación
para su evaluación.

Ademas se puede administrar una lista de temas a los que se puede asignar las
convocatorias.

El documento base de contratación es obtenido a través de un comando de Django
y puede ser evaluado posteriormente.

Los resultados de la evaluación son publicados a través de el sitio Web.

==============
Requerimientos
==============

::

    Django==2.1.5
    requests==2.21.0
    Scrapy==1.5.1

===========
Instalación
===========

Crear inicialmente y activar un entorno virtual que albergue a los
requerimientos del proyecto.

::

    $ virtualenv -p python3 venv
    $ source venv/bin/activate
    (venv) $ pip install -r requirements/base.txt

=========
Ejecución
=========

Una vez activado en entorno virtual, se puede ejecutar el rastreador, dentro
del subdirectorio ``infosicoes``:

::

    (venv) $ scrapy runspider convocatorias.py --nolog -o ../seguimiento/convocatorias.json

La aplicación Django requiere la configuración de la variable de entorno
``DJANGO_SETTINGS_MODULE``:

::

    (venv) $ export DJANGO_SETTINGS_MODULE=seguimiento.settings.local

Para empezar: crear la base de datos y crear un super usuario, dentro del
subirectorio ``seguimiento``:

::

    (venv) $ ./manage.py migrate
    (venv) $ ./manage.py createsuperuser

Luego se pueden importar los resultados del rastreador:

::

    (venv) $ ./manage.py import_convocatorias convocatorias.json

Y para ejecutar la aplicación:

::

    (venv) $ ./manage.py runserver

Luego de marcar, en la interfaz de administración, convocatorias que necesiten
del documento base de contratación para su evaluación, se puede descargar los
documentos:

::

    (venv) $ ./manage.py download_documentos

Finalmente, una vez más en la interfaz de administración, se puede acceder a
las convocatorias nuevamente y los documentos estarán disponibles.

.. _Scrapy: https://scrapy.org/
.. _Django: http://djangoproject.com/
.. _SICOES: https://www.sicoes.gob.bo/
.. _INFOSICOES: https://www.infosicoes.com/
