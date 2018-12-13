<template>
  <div class='movie row col-6 no-gutters'>
    <div class='col-4'>
      <a v-bind:href="movie.websiteUrl">
        <img class="poster-url" v-bind:src="movie.posterUrl" />
      </a>
    </div>
    <div class='col-8'>
      <h4 class='title'>
        <a v-bind:href="movie.websiteUrl" class='text'>{{ movie.title }}</a>
        <span class='year'>({{ movie.year }}),</span>
        <span class='rating'>
          {{ movie.imdbRating }}
          <span class="fa fa-star"></span>
        </span>
      </h4>
      <div class='details'>
        {{ movie.shortDescription}}
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      movie: {
        type: Object,
        required: true
      }
    }
  }
</script>
