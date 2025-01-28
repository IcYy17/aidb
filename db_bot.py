import json
from openai import OpenAI
import os
import sqlite3
from time import time

print("Running db_bot.py!")

fdir = os.path.dirname(__file__)
def get_path(fname):
    return os.path.join(fdir, fname)

# SQLITE
sqlDbPath = get_path("mydb.sqlite")
setupSqlPath = get_path("setup.sql")
setupSqlDataPath = get_path("setupData.sql")

# Erase previous db
if os.path.exists(sqlDbPath):
    os.remove(sqlDbPath)

sqlCon = sqlite3.connect(sqlDbPath) # create a new db
sqlCursor = sqlCon.cursor()
with (
    open(setupSqlPath) as setupSqlFile,
    open(setupSqlDataPath) as setupSqlDataFile
):

    setupSqlScript = setupSqlFile.read()
    setupSqlDataScript = setupSqlDataFile.read()

sqlCursor.executescript(setupSqlScript) # setup tables and keys
sqlCursor.executescript(setupSqlDataScript) # setup data

def runSql(query):
    result = sqlCursor.execute(query).fetchall()
    return result

# OPENAI
config_path = get_path("config.json")
print(config_path)
with open(config_path) as config_file:
    config = json.load(config_file)

open_ai_client = OpenAI(api_key = config["openaiKey"])

def get_chat_gpt_response(content):
    stream = open_ai_client.chat.completions.create(
        model="gpt-4o",
        messages=[{"role": "user", "content": content}],
        stream = True,
    )

    response_list = []
    for chunk in stream:
        if chunk.choices[0].delta.content is not None:
            response_list.append(chunk.choices[0].delta.content)

    result = "".join(response_list)
    return result


# strategies
common_sql_only_request = "Give me a sqlite select statement that answers the question. Only respond with sqlite syntax. If there is an error do not explain it!"
strategies = {
    "zero_shot": setupSqlScript + common_sql_only_request,
    "single_domain_double_shot": (setupSqlScript +
                                  "Who has won worlds more than twice?" +
                                  "SELECT name, world_titles\nFROM team\nWHERE world_titles > 2;" +
                                  common_sql_only_request)
}

questions = [
    "Which player had the highest kda?",
    "Which players are from South Korea?",
    "Which players are from China?",
    "Are there any players from the USA?",
    "What player have kda higher than 4.0?",
    "Which players have won worlds more than twice?",
    "Who has better kda, Faker or Keria?",
    "Did Faker carry based on his kda and vision score in 2024?",
    "Who had the highest cs out of the three years? And which year was it?"
]

def sanitize_for_sql(value):
    gpt_sql_start_marker = "```sql"
    gpt_sql_end_marker = "```"
    if gpt_sql_start_marker in value:
        value = value.split(gpt_sql_start_marker)[1]
    if gpt_sql_end_marker in value:
        value = value.split(gpt_sql_end_marker)[0]

    return value

for strategy in strategies:
    responses = {"strategy": strategy, "prompt_prefix": strategies[strategy]}
    question_results = []
    for question in questions:
        print(question)
        error = "None"
        try:
            sql_syntax_response = get_chat_gpt_response(strategies[strategy] + " " + question)
            sql_syntax_response = sanitize_for_sql(sql_syntax_response)
            print(sql_syntax_response)

            query_raw_response = str(runSql(sql_syntax_response))
            print(query_raw_response)

            friendly_results_prompt = "I asked a question \"" + question + "\" and the response was \"" + query_raw_response + "\" Please, just give a concise response in a more friendly way? Please do not give any other suggests or chatter."
            friendly_response = get_chat_gpt_response(friendly_results_prompt)
            print(friendly_response)
        
        except Exception as err:
            error = str(err)
            print(err)

        question_results.append({
            "question": question,
            "sql": sql_syntax_response,
            "query_raw_response": query_raw_response,
            "friendly_response": friendly_response,
            "error": error
        })

    responses["question_results"] = question_results

    with open(get_path(f"response_{strategy}_{time()}.json"), "w") as outFile:
        json.dump(responses, outFile, indent = 2)

sqlCursor.close()
sqlCon.close()
print("Done!")
