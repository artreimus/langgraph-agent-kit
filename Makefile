.PHONY: help setup run-service run-streamlit docker-watch docker-build docker-down all

help:
	@echo "Available commands:"
	@echo "  setup          - Install dependencies using uv"
	@echo "  run-service    - Run the FastAPI service (requires setup and virtual env activation)"
	@echo "  run-streamlit  - Run the Streamlit app (requires setup and virtual env activation)"
	@echo "  docker-watch   - Run services with Docker Compose in watch mode"
	@echo "  docker-build   - Build and run services with Docker Compose"
	@echo "  docker-down    - Stop Docker Compose services"

setup:
	@if command -v uv > /dev/null; then \
		uv sync --frozen; \
	else \
		echo "uv is not installed. Please install uv: pip install uv"; \
		exit 1; \
	fi

run-service:
	@echo "Starting FastAPI service... Ensure you have run 'make setup' and activated your virtual environment if needed (e.g., source .venv/bin/activate)."
	python src/run_service.py

run-streamlit:
	@echo "Starting Streamlit app... Ensure you have run 'make setup' and activated your virtual environment if needed (e.g., source .venv/bin/activate)."
	streamlit run src/streamlit_app.py

docker-watch:
	docker compose watch

docker-build:
	docker compose up --build

docker-down:
	docker compose down
