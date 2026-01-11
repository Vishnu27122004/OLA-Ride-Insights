"""
Utility functions for OLA Ride Insights project
"""

import pandas as pd
import numpy as np
from typing import Tuple, List
import logging

logger = logging.getLogger(__name__)


def load_data(filepath: str) -> pd.DataFrame:
    """
    Load data from CSV file
    Args:
        filepath: Path to CSV file
    Returns:
        DataFrame with loaded data
    """
    try:
        df = pd.read_csv(filepath)
        logger.info(f"Loaded {len(df)} records from {filepath}")
        return df
    except FileNotFoundError:
        logger.error(f"File {filepath} not found")
        raise
    except Exception as e:
        logger.error(f"Error loading file {filepath}: {e}")
        raise


def handle_missing_values(df: pd.DataFrame, strategy: str = 'drop') -> pd.DataFrame:
    """
    Handle missing values in dataset
    Args:
        df: Input DataFrame
        strategy: 'drop' or 'fill'
    Returns:
        DataFrame with missing values handled
    """
    if strategy == 'drop':
        return df.dropna()
    elif strategy == 'fill':
        return df.fillna(df.mean(numeric_only=True))
    else:
        raise ValueError(f"Unknown strategy: {strategy}")


def remove_outliers(df: pd.DataFrame, column: str, method: str = 'iqr') -> pd.DataFrame:
    """
    Remove outliers from dataset
    Args:
        df: Input DataFrame
        column: Column name
        method: 'iqr' for Interquartile Range
    Returns:
        DataFrame without outliers
    """
    if method == 'iqr':
        Q1 = df[column].quantile(0.25)
        Q3 = df[column].quantile(0.75)
        IQR = Q3 - Q1
        return df[(df[column] >= (Q1 - 1.5 * IQR)) & (df[column] <= (Q3 + 1.5 * IQR))]
    else:
        raise ValueError(f"Unknown method: {method}")


def normalize_column(df: pd.DataFrame, column: str) -> pd.DataFrame:
    """
    Normalize column to 0-1 range
    Args:
        df: Input DataFrame
        column: Column name
    Returns:
        DataFrame with normalized column
    """
    df[column] = (df[column] - df[column].min()) / (df[column].max() - df[column].min())
    return df


def get_summary_statistics(df: pd.DataFrame) -> dict:
    """
    Get summary statistics for numeric columns
    Args:
        df: Input DataFrame
    Returns:
        Dictionary with statistics
    """
    return {
        'count': len(df),
        'numeric_columns': df.select_dtypes(include=[np.number]).columns.tolist(),
        'missing_values': df.isnull().sum().to_dict(),
        'data_types': df.dtypes.to_dict()
    }


def get_data_quality_report(df: pd.DataFrame) -> dict:
    """
    Generate data quality report
    Args:
        df: Input DataFrame
    Returns:
        Dictionary with quality metrics
    """
    return {
        'total_rows': len(df),
        'total_columns': len(df.columns),
        'missing_percentage': (df.isnull().sum().sum() / (len(df) * len(df.columns))) * 100,
        'duplicate_rows': df.duplicated().sum(),
        'columns': list(df.columns)
    }
