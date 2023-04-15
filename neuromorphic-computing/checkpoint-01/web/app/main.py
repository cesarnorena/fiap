# Remove later
import importlib

import streamlit as st
import pandas as pd
from view import home_view

def main():
    # Remove later
    importlib.reload(home_view)
    
    home_view.create()
    
if __name__ == "__main__":
    main()
