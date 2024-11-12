import logging
logging.basicConfig(level=logging.DEBUG,filename='p1.log',filemode='w',format='%(name)s - %(levelname)s - %(message)s')

logging.debug('debug message')
logging.info('info message')
logging.warning('warning message')
logging.error('error message')
logging.critical('critical message')
