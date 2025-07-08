# Private Facts

Private Facts is a web app to track your private info. This project was originally developed at [https://github.com/blaisep/private_facts/tree/main](https://github.com/blaisep/private_facts/tree/main); previous commit history can be found there.

[//]: # (Tahoe Logo)

[//]: # (Badges: Build status,  UV, Python version, Downloads)

#### Why private facts?

This repo holds the source code and resource files for the project described at [private-facts.readthedocs.io](https://private-facts.readthedocs.io/en/latest/index.html)
The code intends to be a demonstration of how to use [Tahoe-lafs](https://tahoe-lafs.readthedocs.io/en/latest/about-tahoe.html#what-is-tahoe-lafs) and better
understand the concept of "provider-independent security" as it pertains to Tahoe-lafs.

## How to use this repo

There are several ways you can use this repo:
- as a companion to the tutorials at [private-facts.readthedocs.io](https://private-facts.readthedocs.io/en/latest/tutorials/index.html)
- as the starting point for a project of your own
- as a practical guide to setting up a local development instance of Tahoe-lafs

We encourage you to read through the docs first and get an overall sense of the narrative arc. 
Later, if you want the hands-on experience, clone the repo and go through the instructions.

## Installation

These instructions assume you are using [uv](https://docs.astral.sh/uv/) for project management; if you use another approach, you will have to modify some of the commands below. Project dependencies are listed in `pyproject.toml`.

### 1. Clone the repo

```bash
git clone https://github.com/blaisep/private_facts.git && cd private_facts
```

### 2. Install dependencies

```bash
uv sync
```

### 3. Start the Tahoe storage server and client (in separate terminals or using e.g. tmux)
```bash
uv run tahoe-server/storage0
uv run tahoe-server/client0
```

### 4. Run the demo scripts
```bash
uv run hello
uv run hello_file
uv run hello_system
uv run hello_mutable
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

### Getting ready for your first pull request

Please make sure to update tests as appropriate.

To run the tests:
```bash
uv run pytest
```

## License

[GNU General Public License v3](https://choosealicense.com/licenses/gpl-3.0/)
[//]: # ( This file was inspired by https://www.makeareadme.com/ )
