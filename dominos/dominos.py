from dominos.api import Client
api = Client()
response = api.get_nearest_store('7004')
print(response.json())
