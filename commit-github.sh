#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "Error: .env file not found."
    exit 1
fi

# Function to check if a command executed successfully
check_command() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed."
    exit 1
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install jq to process JSON."
    exit 1
fi

# Check repository status and add changes
git add .
check_command "Failed to execute 'git add'" "Changes added to index."

# Get changes
git_diff=$(git diff --cached)

# Log diff
echo "Git diff:"
echo "$git_diff"

# Check the number of characters in the diff
diff_length=${#git_diff}
max_diff_length=50000  # Maximum number of characters (configurable)

# If there are no changes, exit the script
if [ -z "$git_diff" ]; then
    echo "No changes to commit. Script finished."
    exit 0
fi

# If diff is too large, use a standard message
if [ $diff_length -gt $max_diff_length ]; then
    commit_description="too many changes"
    echo "Diff is too large ($diff_length characters). Using standard description."
else
    # Log API request
    echo "Sending request to OpenAI API..."

    # Generate commit description using GPT-4
    api_response=$(curl -s https://api.openai.com/v1/chat/completions \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $OPENAI_API_KEY" \
      -d @<(cat <<EOF
    {
      "model": "gpt-4o-mini",
      "messages": [
        {
          "role": "system",
          "content": "You are an experienced developer who writes concise yet informative commit descriptions. Describe the changes in the code based on the diff, using no more than 70 words."
        },
        {
          "role": "user",
          "content": $(jq -Rs . <<< "$git_diff")
        }
      ],
      "max_tokens": 100
    }
EOF
    ))

    # Log API response
    echo "API Response:"
    echo "$api_response"

    # Check for errors in API response
    if echo "$api_response" | jq -e '.error' > /dev/null; then
        error_message=$(echo "$api_response" | jq -r '.error.message')
        commit_description="too many changes"
        echo "API Error: $error_message"
    else
        # Extract commit description from API response
        commit_description=$(echo "$api_response" | jq -r '.choices[0].message.content')
    fi
fi

# Log extracted description
echo "Extracted commit description:"
echo "$commit_description"

# Commit changes with generated description
git commit -m "$commit_description"
check_command "Failed to execute commit"

# Push changes to the remote repository
git push origin main
if [ $? -ne 0 ]; then
    echo "Push failed. Trying to pull first."
    git pull --rebase origin main
    check_command "Failed to execute 'git pull'" "Pull executed successfully."
    
    git push origin main
    check_command "Failed to execute 'git push' after pull" "Changes pushed to the remote repository."
else
    echo "Changes pushed to the remote repository."
fi

# Get and display the full commit hash
commit_hash=$(git rev-parse HEAD)
echo "Full commit hash: $commit_hash"

# Output commit description
echo "Commit description:"
echo "$commit_description"

# Script completion message
echo "All changes successfully pushed to GitHub!"

# Add output message in the required format
echo -e "\n\"\"\"" 
echo "$commit_description"
echo
echo "\`\`\`$commit_hash\`\`\`"
echo
commit_keywords="commits, repository creation, repositories, github"
echo "$commit_keywords"
echo "\"\"\""
