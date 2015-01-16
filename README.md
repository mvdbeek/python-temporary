# Python PyPI Template

Template for quickly creating a new Python project and publishing it to [PyPI](https://pypi.python.org/pypi).

> ***NOTE: Not yet operational! Stay tuned!***


## Requirements

- [Python](https://www.python.org/)
- [Travis CI command-line tools](https://rubygems.org/gems/travis)
- [Docker](https://www.docker.com/) and [Fig](http://www.fig.sh/)
- [Git](http://git-scm.com/) and a [GitHub](https://github.com/) account


## Initial Setup

1. Fork this repository to your own GitHub account.
2. Rename your forked repo to something more in line with the spirit of your project.
3. Enable your repo in:
    - [Travis CI](https://travis-ci.org) for building, testing, and publishing to PyPI;
    - [Landscape](https://landscape.io) for code metrics; and
    - [Coveralls](https://coveralls.io) for code coverage.
4. Clone your repo locally.
5. [Make sure you have `user.name` and `user.email` set in git](https://help.github.com/articles/setting-your-username-in-git/).
6. Edit `populate.ini` and fill out the appropriate info for your project.
7. Commit.
8. Run `populate.py` to populate all templated files and filenames. This will delete all files useful only for the template, including itself. If something doesn't work out, you can always revert to commit you made in the previous step.
9. Add your encrypted PyPI password to `.travis.yml` by running `travis encrypt --add deploy.password`.
10. Commit.

At this point, your library should be empty, but all set up. Let's test it out!


## Tests

We're using Docker, Fig, and [Tox](https://tox.readthedocs.org/en/latest/) to approximate the environment that Travis CI runs when you push. This will allow you to run your code against multiple versions of Python (2.6, 2.7, 3.2, 3.3, 3.4, PyPy, and PyPy3) locally before pushing it or even committing it.

```
$ fig build && fig up
```

The command will take a while the first time you run it, but subsequent runs will be quick.