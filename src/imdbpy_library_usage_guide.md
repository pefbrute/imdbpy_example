# Guide to Using the `imdbpy` Library for IMDb Data

This guide provides instructions and examples on how to use the `imdbpy` Python library to programmatically access data from IMDb. This will enable you to write your own scripts for fetching movie and TV series information.

## 1. Installation

If you haven't already, install the `imdbpy` library using pip:

```bash
pip install imdbpy
```

## 2. Basic Setup: Importing and Initializing

To start using the library, you need to import the `IMDb` class and create an instance of it. This instance will be your main point of interaction with the library.

```python
from imdb import IMDb

# Create an instance of the IMDb class
ia = IMDb()
```

## 3. Searching for Movies or TV Series

You can search for titles (movies, TV series, etc.) using the `search_movie()` method.

```python
try:
    search_term = "The Matrix"
    # search_movie returns a list of Movie objects
    # You can limit the number of results with the 'results' parameter
    results = ia.search_movie(search_term, results=5)

    if results:
        print(f"Found {len(results)} results for '{search_term}':")
        for movie in results:
            print(f"- {movie['title']} ({movie.get('year', 'N/A')}) - ID: {movie.getID()}")
    else:
        print(f"No results found for '{search_term}'.")

except Exception as e:
    print(f"An error occurred during search: {e}")
```

-   `ia.search_movie(title_string, results=N)`: Searches for titles matching `title_string`.
    -   It returns a list of `Movie` objects. These are lightweight objects containing basic information like title, year, and IMDb ID.
    -   The `results` argument is optional and limits the number of initial results returned.

## 4. Getting Detailed Information

Once you have a `Movie` object from a search (or if you know the IMDb ID directly), you can fetch detailed information for that specific title.

First, you need the IMDb ID of the movie. If you have a `Movie` object from `search_movie()`, you can get its ID using `movie.getID()`.

```python
# Assuming 'results' is a list of Movie objects from the previous search
if results:
    first_result = results[0]
    movie_id = first_result.getID()
    print(f"Fetching details for '{first_result['title']}' (ID: {movie_id})...")

    try:
        # get_movie returns a more detailed Movie object
        full_movie_details = ia.get_movie(movie_id)

        if full_movie_details:
            # Now you can access detailed information
            print(f"Title: {full_movie_details.get('title')}")
            print(f"Year: {full_movie_details.get('year')}")
            print(f"Rating: {full_movie_details.get('rating')}")
            print(f"Genres: {full_movie_details.get('genres')}")
            # ... and much more
        else:
            print(f"Could not fetch details for ID {movie_id}.")

    except Exception as e:
        print(f"An error occurred fetching details for ID {movie_id}: {e}")

```

-   `ia.get_movie(movieID)`: Fetches comprehensive data for the given `movieID`.
    -   This method updates the `Movie` object in place with more information (if you pass an existing `Movie` object) or returns a new, richly populated `Movie` object.

## 5. Accessing Data from a `Movie` Object

Once you have a detailed `Movie` object (usually after calling `ia.get_movie()`), you can access its data in several ways:

-   **Dictionary-like access**: `movie['key']` (e.g., `movie['title']`, `movie['year']`). This is common for top-level, frequently accessed information.
-   **`.get()` method**: `movie.get('key', 'default_value')` (e.g., `movie.get('genres', [])`). This is safer as it allows providing a default value if the key is not present.
-   **`movie.data`**: This attribute holds a dictionary containing *all* the information fetched for the movie. This is useful for exploring all available fields or when a specific piece of information isn't available as a direct key.

```python
from pprint import pprint # For nicely printing complex data structures

# Assuming 'full_movie_details' is a Movie object with fetched data
if full_movie_details:
    print(f"Selected details for: {full_movie_details.get('title')}")
    print(f"Localized Title: {full_movie_details.get('localized title', 'N/A')}")
    print(f"Cover URL: {full_movie_details.get('cover url', 'N/A')}")
    
    genres = full_movie_details.get('genres', [])
    if genres:
        print("Genres:")
        for genre in genres:
            print(f"  - {genre}")
    else:
        print("Genres: N/A")

    # To see ALL available data for this movie:
    print("--- Raw Data (all available fields) ---")
    pprint(full_movie_details.data)
```

### Key Data Fields to Explore

The `movie.data` dictionary can contain a wealth of information. Some common and useful fields include:

*   `title`, `original title`, `localized title`
*   `year`, `series years` (for TV series)
*   `rating`, `votes`
*   `genres` (list of strings)
*   `plot` (list of strings, often multiple summaries)
*   `plot outline` (string)
*   `cast` (list of `Person` objects)
*   `directors`, `writers` (list of `Person` objects)
*   `production companies`, `distributors` (list of `Company` objects)
*   `cover url` (URL to the poster image)
*   `runtimes` (list of strings)
*   `countries`, `languages`
*   `akas` (list of "Also Known As" titles)
*   `certificates` (list of age ratings)

For a more comprehensive guide on the structure and meaning of these fields, please refer to the `imdb_api_response_format.md` file in this directory.

This guide should give you a solid foundation for writing your own Python scripts to interact with IMDb data. Happy scripting! 