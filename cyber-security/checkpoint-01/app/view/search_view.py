import streamlit as web


def create():
    web.title("Procure o vilão")

    name = web.text_input("Nome completo:")

    passport = web.text_input("Número do passaporte:",
                              help="Insira o passaporte junto com as iniciais do país, ex: AUS123456789",
                              max_chars=12)

    is_disable = not name or not passport
    on_click = web.button("Procure", disabled=is_disable)

    if on_click:
        _search(name, passport)


def _search(name: str, passport: str):
    print(name)
    print(passport)
