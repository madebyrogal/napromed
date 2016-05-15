/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var gulp = require('gulp'),
        less = require('gulp-less'),
        cleanCSS = require('gulp-clean-css'),
        plumber = require('gulp-plumber'),
        concat = require('gulp-concat');
        watch = require('gulp-watch');

gulp.task('less', function () {
    return gulp.src('web/css/main.less')
            .pipe(plumber())
            .pipe(less())
            .on('error', function (error) {
                // Would like to catch the error here
                console.log(error);
                this.emit('end');
            })
            .pipe(gulp.dest('web/css'));
});

// Watch Files For Changes
gulp.task('watch', function () {
    gulp.watch('web/css/*.less', ['less']);
});

gulp.task('cleanCSS', function () {
    gulp.src([
        '.web/css/main.css'
    ])
            .pipe(concat('style.min.css'))
            .pipe(cleanCSS({compatibility: 'ie8'}))
            .pipe(gulp.dest('web/css'));
});
// define tasks here
gulp.task('default', ['less', 'cleanCSS', 'watch']);