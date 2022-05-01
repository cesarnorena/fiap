import streamlit as web

from service import name_service, passport_service, ValidatorError


def create():
    web.title("🔍 Pesquisar imigrante")

    form = web.form(key="form")
    name = form.text_input("Nome completo:")
    passport = form.text_input(
        "Número do passaporte:",
        help="Insira o passaporte junto com as iniciais do país, ex: AUS123456789",
        max_chars=12
    )
    on_click = form.form_submit_button("Procure")

    if on_click:
        with web.spinner("Procurando"):
            _search(name, passport)


def _search(name: str, passport: str):
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
        web.error("⛔ Nome reportado como terrorista pela Interpol")
        return

    if not passport_allowed:
        web.error("⛔ Pasaporte reportado como terrorista")
        return

    web.success("✅ Pessoa permitida para ingresar")
