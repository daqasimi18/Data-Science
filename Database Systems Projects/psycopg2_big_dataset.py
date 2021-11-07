import psycopg2.extras
import matplotlib.pyplot as plt

connectionString = "dbname='daqasimi18_db' user='daqasimi18'"
connection = psycopg2.connect(connectionString)
print("Connected to ", connectionString,"\n")
cursor = connection.cursor()

# SQL Query
cursor.execute("SELECT country, COUNT(country) AS country_count FROM phone_user_review GROUP BY country ORDER BY country_count DESC;")
records = cursor.fetchall()

# First Graph
count_country = []
country = []
for row in records:
    count_country.append(row[0])
    country.append(row[1])
plt.figure(figsize=(16, 8))
plt.subplot(131)
plt.plot(country, count_country, 'go')
plt.xlabel("Reviews")
plt.ylabel("Countries")
plt.savefig("countries_reviews.png")

# SQL Query
dict_cursor = connection.cursor(cursor_factory = psycopg2.extras.DictCursor)
dict_cursor.execute("SELECT lang, COUNT(lang) AS lang_count FROM phone_user_review GROUP BY lang ORDER BY lang_count DESC;")
product_dict = dict_cursor.fetchall()

# Second Graph
count_lang = []
langs = []
for row in product_dict:
    count_lang.append(row[0])
    langs.append(row[1])
    
plt.subplot(132)
plt.plot(langs, count_lang, 'bo')
plt.xlabel("Reviews")
plt.ylabel("Languages")
plt.savefig("lang_reviews.png")