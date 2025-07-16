# Default recipe - list available commands
default SESSION_NAME="tahoe-dev":
    @just --list

# Run tests
test:
    uv run pytest

# Start the development environment
dev SESSION_NAME="tahoe-dev":
    tmux new-session -d -s {{SESSION_NAME}}
    tmux split-window -t {{SESSION_NAME}}:0 -h
    tmux split-window -t {{SESSION_NAME}}:0.1 -v

    tmux send-keys -t {{SESSION_NAME}}:0.1 'uv run tahoe run tahoe-server/storage0' Enter
    tmux send-keys -t {{SESSION_NAME}}:0.2 'uv run tahoe run tahoe-server/client0' Enter

    tmux select-pane -t {{SESSION_NAME}}:0.0
    
    tmux attach-session -t {{SESSION_NAME}}

# Start dev environment and run the hello script
hello SESSION_NAME="tahoe-dev":
    tmux new-session -d -s {{SESSION_NAME}}
        
    tmux split-window -t {{SESSION_NAME}}:0 -h
    tmux split-window -t {{SESSION_NAME}}:0.1 -v

    tmux send-keys -t {{SESSION_NAME}}:0.1 'uv run tahoe run tahoe-server/storage0' Enter
    tmux send-keys -t {{SESSION_NAME}}:0.2 'uv run tahoe run tahoe-server/client0' Enter

    # Short wait for services to start
    while ! nc -z localhost 50442; do sleep 1; done  # storage0 port
    while ! nc -z localhost 3456; do sleep 1; done  # client0 port

    tmux select-pane -t {{SESSION_NAME}}:0.0

    tmux send-keys -t {{SESSION_NAME}}:0.0 'uv run -m src.hello.hello_local' Enter
    
    tmux attach-session -t {{SESSION_NAME}}

# Stop the development environment
stop SESSION_NAME="tahoe-dev":
    tmux kill-session -t {{SESSION_NAME}} || echo "Session {{SESSION_NAME}} not found"

# List running sessions
list:
    tmux list-sessions 2>/dev/null || echo "No tmux sessions running"
