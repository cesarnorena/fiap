import streamlit as web

from service import *


def create():
    web.title("Procure o vilão")

    name = web.text_input("Nome completo:")

    passport = web.text_input("Número do passaporte:",
                              help="Insira o passaporte junto com as iniciais do país, ex: AUS123456789",
                              max_chars=12)

    on_click = web.button("Procure")

    if on_click:
        _search(name, passport)


def _search(name: str, passport: str):
    web.snow()

    try:
        name_allowed = name_service.is_name_allowed(name)
    except ValidatorError as err:
        web.warning(err)
        return

    try:
        passport_allowed = passport_service.is_passport_allowed(passport)
    except ValidatorError as err:
        web.warning(err)
        return

    if not name_allowed:
        web.error("Nome supeito de terrorismo")
        return

    if not passport_allowed:
        web.error("Pessoa reportada como terrorista")
        return

    web.success("Pessoa permitida para ingresar")
