import streamlit as st
import pandas as pd
import requests
import os

def create():
    st.title("Temperature Forecasting")

    dataframe = pd.DataFrame({"col1": [1, 2], "col2": [3, 4]})
    st.line_chart(dataframe)

    url = os.environ.get('BASE_URL')
    st.write(url)
    response = requests.get(f"{url}/")
    st.write(response.json())
