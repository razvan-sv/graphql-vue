<template>
  <div id='movies' class="row" v-if="movies.length">
    <Movie
      v-for="movie in movies"
      :movie="movie"
      :key="movie.id"
    />
  </div>
</template>

<script>
  import gql from 'graphql-tag'
  import Movie from './Movie'
  export default {
    components: {
      Movie
    },
    apollo: {
      movies: gql`
        query {
          movies {
            id
            title
            posterUrl
            shortDescription
            rated
            imdbRating
            year
            websiteUrl
          }
        }
      `
    },
    data() {
      return {
        movies: []
      }
    }
  }
</script>