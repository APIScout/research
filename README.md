# Thesis Research Repository

This repository contains experiments and proofs of concept for Edoardo Riggio's Master's thesis "API Scout:
An Information Retrieval System for OpenAPI Specifications."

## Repository Structure

```
.
├── .run
├── data
├── notebooks
├── out
│   ├── latex
│   ├── models
│   │   ├── universal-sentence-encoder
│   │   └── doc2vec.model
│   ├── pdfs
│   └── plots
└── proposal
```

## Models

For the vectorization of the specifications,
I've experimented with both the `doc2vec` model by gensim (trained on my data),
and with the `Universal Sentence Encoder` model by Google
(only used to vectorize the documents, no training was necessary).

### Universal Sentence Encoder

The notebooks `elasticsearch.ipynb` and `migration.ipynb` require the "Universal Sentence Encoder" module from Google.
This model can be downloaded by running the following command:

```shell
mkdir ./out/models/universal-sentence-encoder

curl -L "https://tfhub.dev/google/universal-sentence-encoder/2?tf-hub-format=compressed" | tar -zxvC ./out/models/universal-sentence-encoder
```