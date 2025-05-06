from imdb import IMDb
from pprint import pprint

ia = IMDb()  # Move this line to the global scope

def search_movie(title, limit=1):
    """
    Searches for a movie or series on IMDb.

    Args:
        title (str): The title to search for.
        limit (int): The maximum number of results to fetch initially. Defaults to 1.

    Returns:
        list: A list of IMDb Movie objects (or None if an error occurs).
              Returns only the top result based on the limit.
    """
    try:
        # search_movie returns a list of Movie objects
        results = ia.search_movie(title, results=limit)
        return results[:limit] # Return the specified number of results
    except Exception as e:
        print(f"An error occurred during search: {e}")
        return None

def get_movie_details(movie_id):
    """
    Fetches detailed information for a specific IMDb movie/series ID.

    Args:
        movie_id (str): The IMDb ID of the movie/series.

    Returns:
        Movie object: An IMDb Movie object with detailed data (or None if an error occurs).
    """
    try:
        # get_movie returns a Movie object with more details
        full_movie = ia.get_movie(movie_id)
        return full_movie
    except Exception as e:
        print(f"An error occurred fetching details for ID {movie_id}: {e}")
        return None

# --- Example Usage ---
if __name__ == "__main__":
    search_term = "Breaking Bad"
    print(f"Searching for '{search_term}' (limit 1)...")

    # Search for the movie/series
    results = search_movie(search_term, limit=1) # Already searches for 6

    if results:
        print(f"\nFound {len(results)} result(s). Fetching details...\n")

        for index, movie in enumerate(results): # Iterate through all results
            movie_id = movie.getID()
            print(f"--- Processing Result {index + 1} (ID: {movie_id}) ---")

            # Get detailed information
            full_movie = get_movie_details(movie_id)

            if full_movie:
                print("\n" + "=" * 50)
                print(f"Information for '{full_movie.get('title', 'N/A')}' (ID: {movie_id})")
                print("-" * 50)

                # Display selected details
                print(f"Localized title: {full_movie.get('localized title', 'N/A')}")
                print(f"Cover URL: {full_movie.get('cover url', 'N/A')}")

                print("\nGenres:")
                genres = full_movie.get('genres', [])
                if genres:
                    for genre in genres:
                        print(f"  - {genre}")
                else:
                    print("  N/A")

                # Check if it's a series and print years
                if 'series years' in full_movie.data:
                    print(f"\nSeries years: {full_movie.get('series years', 'N/A')}")
                elif 'year' in full_movie.data:
                     print(f"\nYear: {full_movie.get('year', 'N/A')}")
                else:
                     print("\nYear/Series years: N/A")


                print("\nDistributors:")
                distributors = full_movie.get('distributors', [])
                if distributors:
                     # Distributors might be a list of Company objects
                    for distributor in distributors:
                         print(f"  - {distributor.get('name', 'N/A')}") # Access name using .get()
                else:
                     print("  N/A")


                print("\nProduction companies:")
                companies = full_movie.get('production companies', [])
                if companies:
                     # Production companies might also be a list of Company objects
                     for company in companies:
                         print(f"  - {company.get('name', 'N/A')}") # Access name using .get()
                else:
                     print("  N/A")


                print("=" * 50)
                print("\n") # Add a newline for separation

                # Uncomment the following line to see all available raw data for this item
                pprint(full_movie.data)

            else:
                print(f"Could not fetch details for '{movie.get('title', 'Unknown Title')}' (ID: {movie_id}).\n")
    else:
        print(f"No results found for '{search_term}' or there was an error during the search.")