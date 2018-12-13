<template>
  <div id="app" class='container'>
    <h1 class='text-center'>TvDB</h1>
    <MovieList />
  </div>
</template>

<script>
  import MovieList from './components/MovieList';
  export default {
    components:{
      MovieList
    }
  }
</script>
