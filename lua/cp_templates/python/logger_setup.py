import os
import logging
from datetime import datetime

def setup_logger(scraper_name,
                 scraper_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "Logs"))):
    """
    Set up a logger instance for the scraper based on current month and year.
    """
    try:
        # Ensure scraper directory exists
        os.makedirs(scraper_dir, exist_ok=True)

        current_year = datetime.now().year
        current_month = datetime.now().month
        log_file_name = f"{scraper_name}_{current_month}_{current_year}.log"
        log_file = os.path.join(scraper_dir, log_file_name)

        logger = logging.getLogger(scraper_name)
        logger.setLevel(logging.INFO)
        logger.handlers.clear()
        formatter = logging.Formatter('[%(asctime)s] [%(levelname)s] %(message)s')

        # Console handler
        console_handler = logging.StreamHandler()
        console_handler.setFormatter(formatter)
        logger.addHandler(console_handler)

        file_handler = logging.FileHandler(log_file, mode='a', encoding='utf-8')
        file_handler.setFormatter(formatter)
        logger.addHandler(file_handler)
        return logger

    except Exception as e:
        print('Error setting up the logger named {}'.format(scraper_name))
        print('Full error message - ({})'.format(str(e)))
        return None

