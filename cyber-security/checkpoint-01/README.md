# Cyber-Security - Checkpoint 01

[Fight the terrorism](http://54.163.213.160:8501/) is an academic project to identify if an immigrant is or not a
terrorist. Based on immigrant's personal information such as name and/or passport, an API is consulted to match with the
provided information. If a match is found, the immigrant will be accused as terrorist.

- UI built with [Streamlit](https://docs.streamlit.io/)
- The API is hosted on GitHub as static json file and consumed with Python `requests` package
- Input validation with Regex
- Text comparison, to match names, based on [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
  using [TheFuzz](https://github.com/seatgeek/thefuzz) Python library
- Measured Precision score with [scikit-learn](https://scikit-learn.org)
- Project deployed on AWS EC2 instance ([link](http://54.163.213.160:8501/))

## Text matching algorithm

To measure the correctness of the text matching algorithm, we
used [Precision Score](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.precision_score.html) because
false positives have a high cost in the context's problem.

The precision score is granted by [unit testing](test/service/test_name_validator_service.py), where is
expected a score greater than `0.99`.

## Setup

- Install [Python3](https://www.python.org/downloads/)
- Install [pip](https://pip.pypa.io/en/stable/installation/)
- Install dependencies `pip install -r requirements.txt`

## Run

`streamlit run app/main.py`

### Run process in background

`nohup python3 -m streamlit run app/main.py &`

## Test

`python3 -m unittest discover test/`
