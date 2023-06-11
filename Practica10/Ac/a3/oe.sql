Select CUST_FIRST_NAME, CUST_LAST_NAME, CUST_EMAIL, DATE_OF_BIRTH,
    (decode (to_char(sysdate,'dd/mm'),
        to_char((date_of_birth+2),'dd/mm'), 'Day before yesterday',
        to_char((date_of_birth+1),'dd/mm'), 'Yesterday',
        to_char(date_of_birth,'dd/mm'), 'Today',
        to_char((date_of_birth-1),'dd/mm'), 'Tomorrow',
        to_char((date_of_birth-2),'dd/mm'), 'Day after tomorrow',
        'Later this week')) BIRTHDAY  
from Customers where to_char(date_of_birth,'dd') between to_char((sysdate-2),'dd') and to_char((sysdate+7),'dd') 
    and to_char(date_of_birth,'mm') between to_char((sysdate-2),'mm') and to_char((sysdate+7),'mm')
order by to_char(date_of_birth,'dd/mm') asc;