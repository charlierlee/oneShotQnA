# One Shot Q & A

Pick a transformer modal. I have two options at the moment, but there are more:

- NeuML/bert-small-cord19qa <-- low GPU memory requirements
- deepset/bert-base-cased-squad2 <-- needs a bit more GPU RAM

It will use wikipidia for its data source to lookup the answer, and then try to answer the question specifically from the data source.

# Setup

- install docker-compose
- docker-compose build
- docker-compose up
- navigate browser to http://x.x.x.x:9901
