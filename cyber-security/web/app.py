import streamlit as web

from classifier import issues
from classifier import match


def main():
    web.title("App store comment's classifier")
    text_input = web.text_input("Enter issue:")

    if web.button("validate"):
        if match(text_input.lower(), issues):
            web.error("Is an issue 😔!")
        else:
            web.success("Not an issue 😬!")


if __name__ == '__main__':
    main()
