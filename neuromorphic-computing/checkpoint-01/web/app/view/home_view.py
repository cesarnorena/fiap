import streamlit as st
import pandas as pd

def create():
    st.title("My Streamlit App")
    st.write("Welcome to my first Streamlit app!")

    dataframe = pd.DataFrame({"col1": [1, 2], "col2": [3, 4]})
    st.line_chart(dataframe)
