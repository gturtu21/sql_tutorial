import os
from sqlalchemy import create_engine, text
from sqlalchemy.engine.url import URL
import pandas as pd
from dotenv import load_dotenv

# load environment variables from .env file
load_dotenv()

# retrieve database connection parameters from environment variables
DB_NAME = os.getenv("DB_NAME")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_HOST = os.getenv("DB_HOST", "127.0.0.1")
DB_PORT = os.getenv("DB_PORT", "5432")
# construct the database URL and create the SQLAlchemy engine
DATABASE_URL = URL.create(
    drivername="postgresql+psycopg2",
    username=DB_USER,
    password=DB_PASSWORD,
    host=DB_HOST,
    port=DB_PORT,
    database=DB_NAME,
)
engine = create_engine(DATABASE_URL)

def run_query(query: str, params=None) -> pd.DataFrame:
    """Execute a SQL query and return the results as a pandas DataFrame."""
    try:
        with engine.connect() as conn:
            df = pd.read_sql(text(query), conn, params=params)
        return df
    except Exception as e:
        print("Query execution failed:", e)
        return None

def test_connection():
    """
    Test database connection and print the database version.
    """
    try:
        with engine.connect() as conn:
            version = conn.execute(text("SELECT version();")).scalar()
            print(f"onnected to PostgreSQL: {version}")
    except Exception as e:
        print("Connection failed:", e)
