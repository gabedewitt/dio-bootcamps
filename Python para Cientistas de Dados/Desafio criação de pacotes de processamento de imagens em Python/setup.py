from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="earth_distances",
    version="0.0.7",
    author="Gabriel Vinicius Sebastião",
    author_email="gabrielvrsas@gmail.com",
    description="Package focused on Earth distance calculation and plotting",
    long_description=page_description,
    long_description_content_type="text/markdown",
    url="https://tinyurl.com/2p83nw5z",
    packages=find_packages(),
    install_requires=requirements,
    python_requires='>=3.8.5'
)

