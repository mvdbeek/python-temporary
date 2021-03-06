Temporary |Version| |Build| |Coverage| |Health|
===============================================

|Compatibility| |Implementations| |Format| |Downloads|

Context managers for managing temporary files and directories.


.. code:: python

    with temporary.temp_dir() as d:
        ...

    with temporary.temp_file(content='hello') as f:
        ...


Installation:

.. code:: shell

    $ pip install temporary


Temporary Directory Examples
----------------------------

The temporary directory is created when entering the context manager, and
deleted when exiting it:

.. code:: python

    >>> import temporary
    >>> with temporary.temp_dir() as temp_dir:
    ...     assert temp_dir.is_dir()
    >>> assert not temp_dir.exists()

This time let's make the temporary directory our working directory:

.. code:: python

    >>> import os
    >>> with temporary.temp_dir(make_cwd=True) as temp_dir:
    ...     assert str(temp_dir) == os.getcwd()
    >>> assert not str(temp_dir) == os.getcwd()

The suffix, prefix, and parent_dir options are passed to the standard
``tempfile.mkdtemp()`` function:

.. code:: python

    >>> with temporary.temp_dir() as p:
    ...     with temporary.temp_dir(suffix='suf', prefix='pre', parent_dir=p) as d:
    ...         assert d.parent == p
    ...         assert d.name.startswith('pre')
    ...         assert d.name.endswith('suf')

This function can also be used as a decorator, with the ``in_temp_dir`` alias:

.. code:: python

    >>> @temporary.in_temp_dir()
    ... def my_function():
    ...     assert old_cwd != os.getcwd()
    ...
    >>> old_cwd = os.getcwd()
    >>> my_function()
    >>> assert old_cwd == os.getcwd()


Temporary File Examples
-----------------------

The temporary file is created when entering the context manager and
deleted when exiting it.

.. code:: python

    >>> import temporary
    >>> with temporary.temp_file() as temp_file:
    ...     assert temp_file.exists()
    >>> assert not temp_file.exists()

The user may also supply some content for the file to be populated with:

.. code:: python

    >>> with temporary.temp_file('hello!') as temp_file:
    ...     with temp_file.open() as f:
    ...         assert f.read() == 'hello!'

The temporary file can be placed in a custom directory:

.. code:: python

    >>> with temporary.temp_dir() as temp_dir:
    ...     with temporary.temp_file(parent_dir=temp_dir) as temp_file:
    ...         assert temp_file.parent == temp_dir

If, for some reason, the user wants to delete the temporary file before
exiting the context, that's okay too:

.. code:: python

    >>> with temporary.temp_file() as temp_file:
    ...     temp_file.unlink()

.. |Build| image:: https://travis-ci.org/themattrix/python-temporary.svg?branch=master
   :target: https://travis-ci.org/themattrix/python-temporary
.. |Coverage| image:: https://img.shields.io/coveralls/themattrix/python-temporary.svg
   :target: https://coveralls.io/r/themattrix/python-temporary
.. |Health| image:: https://codeclimate.com/github/themattrix/python-temporary/badges/gpa.svg
   :target: https://codeclimate.com/github/themattrix/python-temporary
.. |Version| image:: https://img.shields.io/pypi/v/temporary.svg
   :target: https://pypi.python.org/pypi/temporary
.. |Downloads| image:: https://img.shields.io/pypi/dm/temporary.svg
   :target: https://pypi.python.org/pypi/temporary
.. |Compatibility| image:: https://img.shields.io/pypi/pyversions/temporary.svg
   :target: https://pypi.python.org/pypi/temporary
.. |Implementations| image:: https://img.shields.io/pypi/implementation/temporary.svg
   :target: https://pypi.python.org/pypi/temporary
.. |Format| image:: https://img.shields.io/pypi/format/temporary.svg
   :target: https://pypi.python.org/pypi/temporary
