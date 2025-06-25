// Initialize Gulp and modules ////////////////////////////

const gulp = require('gulp');
const tailwindcss = require('tailwindcss');
const browserSync = require('browser-sync').create();
const autoprefixer = require('autoprefixer');
const cssnano = require('cssnano');
const postcss = require('gulp-postcss');
// const purgecss = require('gulp-purgecss');
const rename = require('gulp-rename');
const sourcemaps = require('gulp-sourcemaps');

// Tasks //////////////////////////////////////////////////

// Build CSS
function buildCss() {
    var plugins = [
        // postcss-import,
        tailwindcss,
        autoprefixer,
        cssnano
        // purgecss
    ];

    return gulp.src('./src/css/tailwind.css')
        .pipe(sourcemaps.init())
        .pipe(postcss(plugins))
        .pipe(rename('main.css'))
        .pipe(sourcemaps.write()) // write('.') for separate file, write() for inside css file
        .pipe(gulp.dest('./dist/css'))
        .pipe(browserSync.stream()); // refresh browser-sync
};

// Copy HTML files from SRC to DIST
function copyHtml() {
    return gulp.src('./src/**/*.html')
        .pipe(gulp.dest('./dist/'));
};

// Copy all files to DIST
// const copyFiles = gulp.parallel(copyHtml, copyCss);

// Watch files
function watchFiles() {
    gulp.watch('./src/css/**/*', buildCss);
    gulp.watch('./src/**/*.html', copyHtml);
};

// Launch local web server
function serve(done) {
    browserSync.init(['./dist/**/*.html', './dist/css/**/*.css'], // watch these files for changes
    {
        server: {
          baseDir: "./dist/"
        },
        port: 3000
    });
    done();
};

// Default task
const defaultTask = gulp.parallel(watchFiles, serve);

// Export tasks ///////////////////////////////////////////

exports.buildCss = buildCss;
exports.copyHtml = copyHtml;
// exports.copyFiles = copyFiles;
exports.watchFiles = watchFiles;
exports.default = defaultTask;