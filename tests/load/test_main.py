from locust import HttpUser, between, task


class User(HttpUser):

    wait_time = between(5, 15)

    @task
    def call_hello_world(self) -> None:
        self.client.get("/")
